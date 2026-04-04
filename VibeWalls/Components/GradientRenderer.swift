import SwiftUI

struct GradientRenderer: View {
    let spec: GradientSpec
    var effects: [WallpaperEffect] = []
    var seed: Float = 0

    var body: some View {
        GeometryReader { geo in
            gradientView
                .opacity(spec.opacity)
                .applyEffects(effects, seed: seed, size: geo.size)
        }
    }

    @ViewBuilder
    private var gradientView: some View {
        switch spec.style {
        case .linear(let angle):
            let points = angleToUnitPoints(angle)
            LinearGradient(
                stops: spec.stops.map { Gradient.Stop(color: $0.color, location: $0.location) },
                startPoint: points.start,
                endPoint: points.end
            )

        case .radial(let center, let startRadius, let endRadius):
            RadialGradient(
                stops: spec.stops.map { Gradient.Stop(color: $0.color, location: $0.location) },
                center: center,
                startRadius: startRadius,
                endRadius: endRadius
            )

        case .angular(let center, let startAngle, let endAngle):
            AngularGradient(
                stops: spec.stops.map { Gradient.Stop(color: $0.color, location: $0.location) },
                center: center,
                startAngle: .degrees(startAngle),
                endAngle: .degrees(endAngle)
            )

        case .mesh(let width, let height, let points, let colors):
            if #available(iOS 18.0, *) {
                MeshGradient(width: width, height: height, points: points, colors: colors)
            } else {
                LinearGradient(
                    colors: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
    }

    private func angleToUnitPoints(_ degrees: Double) -> (start: UnitPoint, end: UnitPoint) {
        let radians = degrees * .pi / 180
        let dx = sin(radians)
        let dy = -cos(radians)

        let startX = 0.5 - dx * 0.5
        let startY = 0.5 - dy * 0.5
        let endX = 0.5 + dx * 0.5
        let endY = 0.5 + dy * 0.5

        return (
            UnitPoint(x: startX, y: startY),
            UnitPoint(x: endX, y: endY)
        )
    }
}
