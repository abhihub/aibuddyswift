#!/bin/bash

echo "Creating simple buddyChatGPT app structure..."

# Remove any existing broken projects
rm -rf buddyChatGPT.xcodeproj buddyChatGPT.xcodeproj.backup

# Create a simple single-file Swift app that can be run directly
cat > buddyChatGPT_Simple.swift << 'EOF'
#!/usr/bin/env swift

import SwiftUI
import AppKit
import Foundation

// MARK: - Data Models
struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isFromUser: Bool
    let timestamp: Date
    let screenshotPath: String?
    
    init(content: String, isFromUser: Bool, screenshotPath: String? = nil) {
        self.content = content
        self.isFromUser = isFromUser
        self.timestamp = Date()
        self.screenshotPath = screenshotPath
    }
}

// MARK: - Screenshot Service
class ScreenshotService: ObservableObject {
    func takeScreenshot() async -> String? {
        let tempDir = NSTemporaryDirectory()
        let timestamp = Int(Date().timeIntervalSince1970)
        let screenshotPath = "\(tempDir)screenshot_\(timestamp).png"
        
        return await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let result = self.captureScreenshot(path: screenshotPath)
                continuation.resume(returning: result ? screenshotPath : nil)
            }
        }
    }
    
    private func captureScreenshot(path: String) -> Bool {
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
}

// MARK: - Chat Service
@MainActor
class ChatService: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    
    private let apiKey = "YOUR_API_KEY_HERE" // Replace with your actual API key
    
    func sendMessage(_ text: String, screenshotPath: String? = nil) async {
        let userMessage = Message(content: text, isFromUser: true, screenshotPath: screenshotPath)
        messages.append(userMessage)
        
        isLoading = true
        
        // Simple mock response for demo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = screenshotPath != nil 
                ? "I can see your screenshot! You said: \(text)"
                : "You said: \(text)"
            let assistantMessage = Message(content: response, isFromUser: false)
            self.messages.append(assistantMessage)
            self.isLoading = false
        }
    }
}

// MARK: - Views
struct ContentView: View {
    @StateObject private var chatService = ChatService()
    @StateObject private var screenshotService = ScreenshotService()
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(chatService.messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: chatService.messages.count) { _ in
                    if let lastMessage = chatService.messages.last {
                        withAnimation(.easeOut(duration: 0.3)) {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            HStack {
                TextField("Type your message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        sendMessage()
                    }
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
                .disabled(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || chatService.isLoading)
            }
            .padding()
        }
        .navigationTitle("buddyChatGPT")
        .frame(minWidth: 600, minHeight: 400)
    }
    
    private func sendMessage() {
        let trimmedMessage = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedMessage.isEmpty else { return }
        
        messageText = ""
        
        Task {
            let screenshotPath = await screenshotService.takeScreenshot()
            await chatService.sendMessage(trimmedMessage, screenshotPath: screenshotPath)
        }
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromUser {
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.content)
                    .padding(12)
                    .background(message.isFromUser ? Color.blue : Color.gray.opacity(0.2))
                    .foregroundColor(message.isFromUser ? .white : .primary)
                    .cornerRadius(12)
                
                if let screenshotPath = message.screenshotPath,
                   let nsImage = NSImage(contentsOfFile: screenshotPath) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 150)
                        .cornerRadius(8)
                }
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            if !message.isFromUser {
                Spacer()
            }
        }
        .padding(.horizontal, message.isFromUser ? .zero : 8)
    }
}

// MARK: - App
@main
struct buddyChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
    }
}
EOF

chmod +x buddyChatGPT_Simple.swift

echo "✅ Created buddyChatGPT_Simple.swift"
echo ""
echo "To run the app directly:"
echo "  swift buddyChatGPT_Simple.swift"
echo ""
echo "Or create a proper Xcode project:"
echo "  1. Open Xcode"
echo "  2. Create New Project > macOS > App"
echo "  3. Name it 'buddyChatGPT'"
echo "  4. Copy the contents of our Swift files into the new project"
echo ""