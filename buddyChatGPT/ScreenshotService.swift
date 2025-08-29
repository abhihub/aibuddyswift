import Foundation
import AppKit

class ScreenshotService: ObservableObject {
    private var screenpipePath: String?
    
    func setup() {
        findScreenpipeBinary()
    }
    
    private func findScreenpipeBinary() {
        if let resourcePath = Bundle.main.resourcePath {
            let bundledPath = "\(resourcePath)/screenpipe"
            if FileManager.default.fileExists(atPath: bundledPath) {
                screenpipePath = bundledPath
                makeExecutable(path: bundledPath)
                return
            }
        }
        
        let fallbackPaths = [
            "/usr/local/bin/screenpipe",
            "/opt/homebrew/bin/screenpipe",
            Bundle.main.bundlePath + "/Contents/Resources/screenpipe"
        ]
        
        for path in fallbackPaths {
            if FileManager.default.fileExists(atPath: path) {
                screenpipePath = path
                break
            }
        }
    }
    
    private func makeExecutable(path: String) {
        let task = Process()
        task.launchPath = "/bin/chmod"
        task.arguments = ["+x", path]
        task.launch()
        task.waitUntilExit()
    }
    
    func takeScreenshot() async -> String? {
        let tempDir = NSTemporaryDirectory()
        let timestamp = Int(Date().timeIntervalSince1970)
        let screenshotPath = "\(tempDir)screenshot_\(timestamp).png"
        
        return await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let result = self.captureScreenshotUsingScreenCapture(path: screenshotPath)
                continuation.resume(returning: result ? screenshotPath : nil)
            }
        }
    }
    
    private func captureScreenshotUsingScreenCapture(path: String) -> Bool {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-x", "-t", "png", path]
        
        do {
            try task.run()
            task.waitUntilExit()
            return task.terminationStatus == 0
        } catch {
            print("Screenshot capture failed: \(error)")
            return false
        }
    }
    
    func startScreenpipeRecording() {
        guard let screenpipePath = screenpipePath else {
            print("Screenpipe binary not found")
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            let task = Process()
            task.launchPath = screenpipePath
            task.arguments = ["--fps", "0.5", "--audio-disabled"]
            
            do {
                try task.run()
            } catch {
                print("Failed to start screenpipe: \(error)")
            }
        }
    }
    
    func getScreenpipeData(query: String) async -> String? {
        guard let screenpipePath = screenpipePath else { return nil }
        
        return await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let task = Process()
                task.launchPath = screenpipePath
                task.arguments = ["search", "--query", query, "--limit", "1"]
                
                let pipe = Pipe()
                task.standardOutput = pipe
                
                do {
                    try task.run()
                    task.waitUntilExit()
                    
                    let data = pipe.fileHandleForReading.readDataToEndOfFile()
                    let output = String(data: data, encoding: .utf8)
                    continuation.resume(returning: output)
                } catch {
                    print("Screenpipe search failed: \(error)")
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}