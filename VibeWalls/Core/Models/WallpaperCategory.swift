import SwiftUI

enum WallpaperCategory: String, CaseIterable, Identifiable, Codable {
    case dark, minimal, nature, abstract, neon, gradient
    case amoled, geometric, marble, pastel

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .amoled: "AMOLED"
        default: rawValue.capitalized
        }
    }

    var iconName: String {
        switch self {
        case .dark: "moon.fill"
        case .minimal: "square"
        case .nature: "leaf.fill"
        case .abstract: "scribble.variable"
        case .neon: "bolt.fill"
        case .gradient: "circle.lefthalf.filled"
        case .amoled: "circle.fill"
        case .geometric: "hexagon.fill"
        case .marble: "circle.and.line.horizontal.fill"
        case .pastel: "paintpalette.fill"
        }
    }

    var accentColor: Color {
        switch self {
        case .dark: .purple
        case .minimal: .gray
        case .nature: .green
        case .abstract: .pink
        case .neon: .cyan
        case .gradient: .orange
        case .amoled: .white
        case .geometric: .blue
        case .marble: .brown
        case .pastel: .mint
        }
    }
}
