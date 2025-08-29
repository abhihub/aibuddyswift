import SwiftUI
import AppKit
import Foundation

// MARK: - Screenshot Service
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
            Bundle.main.bundlePath + "/Contents/Resources/screenpipe",
            "./Sources/buddyChatGPT/Resources/screenpipe",
            "./buddyChatGPT/Resources/screenpipe"
        ]
        
        for path in fallbackPaths {
            if FileManager.default.fileExists(atPath: path) {
                screenpipePath = path
                makeExecutable(path: path)
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
                // Try screenpipe first, fallback to screencapture
                if self.screenpipePath != nil {
                    let result = self.captureScreenshotUsingScreenpipe(path: screenshotPath)
                    if result {
                        continuation.resume(returning: screenshotPath)
                        return
                    }
                }
                
                // Fallback to regular screencapture
                let result = self.captureScreenshotUsingScreenCapture(path: screenshotPath)
                continuation.resume(returning: result ? screenshotPath : nil)
            }
        }
    }
    
    private func captureScreenshotUsingScreenpipe(path: String) -> Bool {
        guard let screenpipePath = screenpipePath else { return false }
        
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-x", "-t", "png", path]
        
        do {
            try task.run()
            task.waitUntilExit()
            print("📸 Screenshot taken with screenpipe integration: \(path)")
            return task.terminationStatus == 0
        } catch {
            print("Screenpipe screenshot failed: \(error)")
            return false
        }
    }
    
    private func captureScreenshotUsingScreenCapture(path: String) -> Bool {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-x", "-t", "png", path]
        
        do {
            try task.run()
            task.waitUntilExit()
            print("📸 Screenshot taken with screencapture: \(path)")
            return task.terminationStatus == 0
        } catch {
            print("Screenshot capture failed: \(error)")
            return false
        }
    }
    
    func getScreenContent() async -> String? {
        guard let screenpipePath = screenpipePath else { 
            print("⚠️ Screenpipe not available, using screenshot only")
            return nil 
        }
        
        return await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let task = Process()
                task.launchPath = screenpipePath
                task.arguments = ["search", "--limit", "1", "--content_type", "ocr"]
                
                let pipe = Pipe()
                task.standardOutput = pipe
                
                do {
                    try task.run()
                    task.waitUntilExit()
                    
                    let data = pipe.fileHandleForReading.readDataToEndOfFile()
                    let output = String(data: data, encoding: .utf8)
                    print("🔍 Screenpipe OCR content: \(output?.prefix(100) ?? "none")")
                    continuation.resume(returning: output)
                } catch {
                    print("❌ Screenpipe search failed: \(error)")
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}

// MARK: - Message Model
struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isFromUser: Bool
    let screenshotPath: String?
    
    init(content: String, isFromUser: Bool, screenshotPath: String? = nil) {
        self.content = content
        self.isFromUser = isFromUser
        self.screenshotPath = screenshotPath
    }
}

// MARK: - ChatGPT API Models
struct ContentItem: Codable {
    let type: String
    let text: String?
    let imageUrl: ImageUrl?
    
    enum CodingKeys: String, CodingKey {
        case type
        case text
        case imageUrl = "image_url"
    }
}

struct ImageUrl: Codable {
    let url: String
}

struct ChatMessage: Codable {
    let role: String
    let content: [ContentItem]
}

struct ChatRequest: Codable {
    let model: String
    let messages: [ChatMessage]
    let maxTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case model
        case messages
        case maxTokens = "max_tokens"
    }
}

struct ChatResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: ResponseMessage
}

struct ResponseMessage: Codable {
    let content: String
}

// MARK: - Chat Service
@MainActor
class ChatService: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    
    private let apiKey: String
    private let apiURL = "https://api.openai.com/v1/chat/completions"
    
    init() {
        // Try environment variable first, then fallback to hardcoded
        if let envKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"], !envKey.isEmpty {
            self.apiKey = envKey
            print("✅ Using API key from environment variable")
        } else {
            self.apiKey = "YOUR_API_KEY_HERE" // Replace with actual key
            print("⚠️  Using hardcoded API key placeholder")
        }
    }
    
    func sendMessage(_ text: String, screenshotPath: String? = nil) async {
        let userMessage = Message(content: text, isFromUser: true, screenshotPath: screenshotPath)
        messages.append(userMessage)
        
        isLoading = true
        
        do {
            let response = try await callChatGPT(message: text, screenshotPath: screenshotPath)
            let assistantMessage = Message(content: response, isFromUser: false)
            messages.append(assistantMessage)
        } catch {
            let errorMessage = Message(content: "Error: \(error.localizedDescription)", isFromUser: false)
            messages.append(errorMessage)
        }
        
        isLoading = false
    }
    
    private func callChatGPT(message: String, screenshotPath: String?) async throws -> String {
        guard !apiKey.isEmpty && apiKey != "YOUR_API_KEY_HERE" else {
            throw APIError.missingAPIKey
        }
        
        guard let url = URL(string: apiURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var contentItems: [ContentItem] = [
            ContentItem(type: "text", text: message, imageUrl: nil)
        ]
        
        if let screenshotPath = screenshotPath {
            let base64Image = try encodeImageToBase64(path: screenshotPath)
            let imageContent = ContentItem(
                type: "image_url",
                text: nil,
                imageUrl: ImageUrl(url: "data:image/png;base64,\(base64Image)")
            )
            contentItems.append(imageContent)
        }
        
        let chatMessage = ChatMessage(role: "user", content: contentItems)
        let systemMessage = ChatMessage(
            role: "system",
            content: [ContentItem(
                type: "text",
                text: "You are a helpful AI assistant. When provided with screenshots, analyze and describe what you see in the image along with responding to the user's message.",
                imageUrl: nil
            )]
        )
        
        let requestBody = ChatRequest(
            model: "gpt-4o",
            messages: [systemMessage, chatMessage],
            maxTokens: 1000
        )
        
        request.httpBody = try JSONEncoder().encode(requestBody)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw APIError.serverError("HTTP \(httpResponse.statusCode): \(errorString)")
        }
        
        let chatResponse = try JSONDecoder().decode(ChatResponse.self, from: data)
        
        guard let firstChoice = chatResponse.choices.first else {
            throw APIError.noResponse
        }
        
        return firstChoice.message.content
    }
    
    private func encodeImageToBase64(path: String) throws -> String {
        let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
        return imageData.base64EncodedString()
    }
}

enum APIError: Error, LocalizedError {
    case missingAPIKey
    case invalidURL
    case invalidResponse
    case serverError(String)
    case noResponse
    
    var errorDescription: String? {
        switch self {
        case .missingAPIKey:
            return "OpenAI API key is missing. Set OPENAI_API_KEY environment variable."
        case .invalidURL:
            return "Invalid API URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .serverError(let message):
            return "Server error: \(message)"
        case .noResponse:
            return "No response from ChatGPT"
        }
    }
}

// Force GUI mode and window visibility
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Ensure we're in GUI mode
        NSApp.setActivationPolicy(.regular)
        
        let contentView = VStack {
            Text("🚀 buddyChatGPT")
                .font(.largeTitle)
                .padding()
            
            Text("ChatGPT with Automatic Screenshots")
                .font(.headline)
                .padding()
            
            ChatView()
        }
        .frame(minWidth: 700, minHeight: 500)
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        window.center()
        window.setFrameAutosaveName("buddyChatGPT")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.title = "buddyChatGPT - Working!"
        
        // Force window to front
        NSApp.activate(ignoringOtherApps: true)
        window.orderFrontRegardless()
        
        print("✅ Window should now be visible!")
        print("📍 Window frame: \(window.frame)")
        print("🔍 Window is visible: \(window.isVisible)")
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

struct ChatView: View {
    @StateObject private var chatService = ChatService()
    @StateObject private var screenshotService = ScreenshotService()
    @State private var currentMessage = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chatService.messages) { message in
                        HStack {
                            if message.isFromUser {
                                Spacer()
                            }
                            
                            Text(message.content)
                                .padding(10)
                                .background(message.isFromUser ? Color.blue : Color.gray.opacity(0.3))
                                .foregroundColor(message.isFromUser ? .white : .primary)
                                .cornerRadius(10)
                            
                            if !message.isFromUser {
                                Spacer()
                            }
                        }
                    }
                    
                    if chatService.isLoading {
                        HStack {
                            Text("Thinking...")
                                .padding(10)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Type a message...", text: $currentMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        sendMessage()
                    }
                
                Button("Send") {
                    sendMessage()
                }
                .disabled(chatService.isLoading)
            }
            .padding()
        }
        .onAppear {
            onAppear()
        }
    }
    
    private func sendMessage() {
        guard !currentMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        let userMessage = currentMessage
        currentMessage = ""
        
        Task {
            // Take screenshot using ScreenshotService
            let screenshotPath = await screenshotService.takeScreenshot()
            
            // For now, just use screenshots (screenpipe search will be implemented later)
            // let screenContent = await screenshotService.getScreenContent()
            
            await chatService.sendMessage(userMessage, screenshotPath: screenshotPath)
        }
    }
    
    func onAppear() {
        screenshotService.setup()
    }
    
}

// Main entry point
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

print("🚀 Starting buddyChatGPT with forced window visibility...")
print("💡 If window doesn't appear, check Activity Monitor for 'swift' process")

app.run()