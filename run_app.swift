// Run the buddyChatGPT app
import SwiftUI

struct ContentView: View {
    @State private var message = "Hello from buddyChatGPT!"
    
    var body: some View {
        VStack {
            Text(message)
                .font(.title)
                .padding()
            
            Text("This is a simple test - the full app is in the Xcode project files.")
                .padding()
            
            Button("Test Screenshot") {
                takeScreenshot()
            }
            .padding()
        }
        .frame(width: 400, height: 300)
    }
    
    func takeScreenshot() {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-x", "-t", "png", "/tmp/test_screenshot.png"]
        
        do {
            try task.run()
            task.waitUntilExit()
            message = "Screenshot taken! Saved to /tmp/test_screenshot.png"
        } catch {
            message = "Screenshot failed: \(error)"
        }
    }
}

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 500, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.title = "buddyChatGPT Test"
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

// Main entry point
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()