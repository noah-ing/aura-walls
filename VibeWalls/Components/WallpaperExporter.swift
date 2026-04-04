import SwiftUI

@MainActor
enum WallpaperExporter {

    static func renderToImage(
        spec: GradientSpec,
        effects: [WallpaperEffect],
        seed: Float,
        amoled: Bool = false
    ) -> UIImage? {
        let screen = UIScreen.main
        let size = screen.bounds.size
        let scale = screen.scale

        let finalSpec = amoled ? applyAMOLED(to: spec) : spec

        let content = GradientRenderer(spec: finalSpec, effects: effects, seed: seed)
            .frame(width: size.width, height: size.height)

        let hostingController = UIHostingController(rootView: content)
        hostingController.view.frame = CGRect(origin: .zero, size: size)
        hostingController.view.backgroundColor = .clear

        // Force layout
        hostingController.view.setNeedsLayout()
        hostingController.view.layoutIfNeeded()

        // Attach to window hierarchy for GPU rendering
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return renderFallback(content: content, size: size, scale: scale)
        }

        // Add off-screen
        hostingController.view.frame = CGRect(
            x: -size.width * 2,
            y: -size.height * 2,
            width: size.width,
            height: size.height
        )
        window.addSubview(hostingController.view)

        // Allow GPU to process shader effects
        hostingController.view.setNeedsLayout()
        hostingController.view.layoutIfNeeded()

        let renderer = UIGraphicsImageRenderer(
            size: size,
            format: {
                let format = UIGraphicsImageRendererFormat()
                format.scale = scale
                format.opaque = true
                return format
            }()
        )

        let image = renderer.image { _ in
            hostingController.view.drawHierarchy(in: CGRect(origin: .zero, size: size), afterScreenUpdates: true)
        }

        hostingController.view.removeFromSuperview()
        return image
    }

    // Fallback using ImageRenderer (won't capture shaders but better than nothing)
    private static func renderFallback<V: View>(content: V, size: CGSize, scale: CGFloat) -> UIImage? {
        let renderer = ImageRenderer(content: content)
        renderer.scale = scale
        return renderer.uiImage
    }

    static func applyAMOLED(to spec: GradientSpec) -> GradientSpec {
        let darkenedStops = spec.stops.map { stop in
            ColorStop(
                color: darkenColor(stop.color, factor: 0.3),
                location: stop.location
            )
        }
        return GradientSpec(style: spec.style, stops: darkenedStops, opacity: spec.opacity)
    }

    private static func darkenColor(_ color: Color, factor: Double) -> Color {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        UIColor(color).getRed(&r, green: &g, blue: &b, alpha: &a)
        return Color(.sRGB, red: r * factor, green: g * factor, blue: b * factor, opacity: a)
    }
}
