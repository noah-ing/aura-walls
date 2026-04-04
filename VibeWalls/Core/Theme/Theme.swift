import SwiftUI

enum Theme {
    // MARK: - Colors
    static let background = Color(hex: 0x0A0A0F)
    static let surface = Color(hex: 0x1A1A24)
    static let surfaceLight = Color(hex: 0x2A2A38)
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.6)
    static let accent = Color(hex: 0x7B61FF)
    static let accentGlow = Color(hex: 0x7B61FF).opacity(0.3)

    // MARK: - Spacing
    static let paddingSm: CGFloat = 8
    static let paddingMd: CGFloat = 16
    static let paddingLg: CGFloat = 24
    static let paddingXl: CGFloat = 32

    // MARK: - Corners
    static let cornerSm: CGFloat = 8
    static let cornerMd: CGFloat = 12
    static let cornerLg: CGFloat = 16
    static let cornerXl: CGFloat = 24

    // MARK: - Grid
    static let gridSpacing: CGFloat = 12
    static let gridColumns = [
        GridItem(.flexible(), spacing: gridSpacing),
        GridItem(.flexible(), spacing: gridSpacing)
    ]
}

extension Color {
    init(hex: UInt, opacity: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
}
