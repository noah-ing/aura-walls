import SwiftUI

enum GradientStyle {
    case linear(angle: Double)
    case radial(center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)
    case angular(center: UnitPoint, startAngle: Double, endAngle: Double)
    case mesh(width: Int, height: Int, points: [SIMD2<Float>], colors: [Color])
}

struct ColorStop {
    let color: Color
    let location: CGFloat
}

struct GradientSpec {
    let style: GradientStyle
    let stops: [ColorStop]
    let opacity: Double

    init(style: GradientStyle, stops: [ColorStop], opacity: Double = 1.0) {
        self.style = style
        self.stops = stops
        self.opacity = opacity
    }
}
