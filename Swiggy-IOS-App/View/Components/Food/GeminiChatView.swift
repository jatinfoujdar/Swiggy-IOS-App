import SwiftUI
import GoogleGenerativeAI

struct GeminiChatView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: ApiKey.default)
    
    @State private var userPrompt = ""
    @State private var response = "How can I help you today?"
    @State private var isLoading = false
    @State private var chatHistory: [ChatMessage] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
           
                Text("Spice-Genie")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing)
                    )
                
            
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(chatHistory, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                        
                        if isLoading {
                            LoadingIndicator()
                        }
                        
                        Text(response)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
               
                HStack {
                    TextField("Ask me anything...", text: $userPrompt, axis: .vertical)
                        .lineLimit(1)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.bottom, 10)
                    
                    Button(action: generateResponse) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.indigo)
                            .clipShape(Circle())
                    }
                    .disabled(userPrompt.isEmpty || isLoading)
                }
                .padding()
                .padding(.bottom,70)

            }
            .navigationBarHidden(true)
        }
    }
    
    func generateResponse() {
        let currentPrompt = userPrompt
        
        // Add user message to chat history
        chatHistory.append(ChatMessage(text: currentPrompt, isUser: true))
        
        isLoading = true
        userPrompt = ""
        
        Task {
            do {
                let result = try await model.generateContent(currentPrompt)
                
                await MainActor.run {
                    isLoading = false
                    if let responseText = result.text {
                        chatHistory.append(ChatMessage(text: responseText, isUser: false))
                        response = responseText
                    }
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    response = "Something went wrong. Please try again."
                }
            }
        }
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(15)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(15)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct LoadingIndicator: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                .scaleEffect(1.5)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    GeminiChatView()
}
