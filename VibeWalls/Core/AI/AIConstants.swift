import Foundation

enum AIConstants {
    static let hfToken = Secrets.hfToken

    static let modelURL = URL(string: "https://router.huggingface.co/hf-inference/models/black-forest-labs/FLUX.1-schnell")!

    static let imageWidth = 768
    static let imageHeight = 1344
    static let inferenceSteps = 4
    static let guidanceScale: Double = 0.0

    static let maxRetries = 3
    static let retryDelay: TimeInterval = 10
}
