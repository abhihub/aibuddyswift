import Foundation
import SwiftUI

@MainActor
class ChatService: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    
    private let apiKey: String
    private let apiURL = "https://api.openai.com/v1/chat/completions"
    
    init() {
        if let key = Bundle.main.object(forInfoDictionaryKey: "OPENAI_API_KEY") as? String, !key.isEmpty {
            self.apiKey = key
        } else {
            self.apiKey = ""
            print("Warning: OpenAI API key not found. Please add OPENAI_API_KEY to Info.plist")
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
        guard !apiKey.isEmpty else {
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
            model: "gpt-4-vision-preview",
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
            return "OpenAI API key is missing. Please add it to the app configuration."
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