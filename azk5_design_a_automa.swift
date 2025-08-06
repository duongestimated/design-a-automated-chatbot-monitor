Swift
import Foundation

class ChatbotMonitor {
    var chatLog: [String] = []
    var chatbotResponses: [String: String] = [:]
    var alertThreshold: Int = 5

    func processChatMessage(_ message: String) {
        chatLog.append(message)
        if let response = chatbotResponses[message] {
            print("Chatbot response: \(response)")
        } else {
            print("Unknown message: \(message)")
        }
        if chatLog.count >= alertThreshold {
            sendAlert()
        }
    }

    func sendAlert() {
        print("Alert: Excessive chat activity detected!")
    }

    func addChatbotResponse(_ input: String, response: String) {
        chatbotResponses[input] = response
    }
}

let monitor = ChatbotMonitor()

monitor.addChatbotResponse("hello", response: "Hi, how can I help you today?")
monitor.addChatbotResponse("goodbye", response: "Goodbye! Have a great day!")

monitor.processChatMessage("hello")
monitor.processChatMessage("goodbye")
monitor.processChatMessage("hello")
monitor.processChatMessage("goodbye")
monitor.processChatMessage("hello")
monitor.processChatMessage("goodbye")
monitor.processChatMessage("hello")