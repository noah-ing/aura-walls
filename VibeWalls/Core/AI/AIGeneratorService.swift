import SwiftUI

enum AIGeneratorError: LocalizedError {
    case noToken
    case modelLoading(estimatedTime: Double)
    case serverError(String)
    case invalidResponse
    case rateLimited

    var errorDescription: String? {
        switch self {
        case .noToken:
            return "No Hugging Face API token configured."
        case .modelLoading(let time):
            return "Model is loading, please try again in \(Int(time))s."
        case .serverError(let msg):
            return msg
        case .invalidResponse:
            return "Failed to generate image."
        case .rateLimited:
            return "Rate limit reached. Please try again later."
        }
    }
}

@MainActor
@Observable
final class AIGeneratorService {
    private(set) var isGenerating = false
    var generatedImage: UIImage?
    private(set) var error: String?

    func generate(prompt: String) async {
        guard AIConstants.hfToken != "YOUR_HF_TOKEN_HERE" else {
            error = "Please set your Hugging Face API token in AIConstants.swift"
            return
        }

        isGenerating = true
        error = nil
        generatedImage = nil

        defer { isGenerating = false }

        let fullPrompt = prompt

        let body: [String: Any] = [
            "inputs": fullPrompt,
            "parameters": [
                "width": AIConstants.imageWidth,
                "height": AIConstants.imageHeight,
                "num_inference_steps": AIConstants.inferenceSteps,
                "guidance_scale": AIConstants.guidanceScale,
                "negative_prompt": "nsfw, nude, naked, porn, sexual, explicit, gore, blood, violence, dismembered, deformed, ugly, blurry, low quality, watermark, text, signature, closeup face, portrait, selfie"
            ]
        ]

        var request = URLRequest(url: AIConstants.modelURL)
        request.httpMethod = "POST"
        request.setValue("Bearer \(AIConstants.hfToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 120

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            self.error = "Failed to build request."
            return
        }

        // Retry loop for model cold starts
        for attempt in 0..<AIConstants.maxRetries {
            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse else {
                    self.error = "Invalid response."
                    return
                }

                switch httpResponse.statusCode {
                case 200:
                    // Success — data is raw image bytes
                    if let image = UIImage(data: data) {
                        self.generatedImage = image
                        return
                    } else {
                        self.error = "Failed to decode image."
                        return
                    }

                case 503:
                    // Model loading — parse estimated time and retry
                    if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let estimatedTime = json["estimated_time"] as? Double {
                        if attempt < AIConstants.maxRetries - 1 {
                            try await Task.sleep(for: .seconds(min(estimatedTime, AIConstants.retryDelay)))
                            continue
                        }
                        self.error = "Model is loading. Please try again in \(Int(estimatedTime))s."
                    } else {
                        self.error = "Service temporarily unavailable."
                    }
                    return

                case 429:
                    self.error = "Rate limit reached. Please try again later."
                    return

                default:
                    // Try to parse error message from JSON
                    if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let msg = json["error"] as? String {
                        self.error = msg
                    } else {
                        self.error = "Server error (\(httpResponse.statusCode))."
                    }
                    return
                }
            } catch is CancellationError {
                return
            } catch {
                self.error = "Network error: \(error.localizedDescription)"
                return
            }
        }
    }
}
