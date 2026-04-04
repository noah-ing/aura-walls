import SwiftUI

enum WallpaperEffect {
    case grain(intensity: Float)
    case noise(scale: Float, opacity: Float)
    case voronoi(scale: Float, opacity: Float)
    case vignette(intensity: Float)
}

extension View {
    func applyEffects(_ effects: [WallpaperEffect], seed: Float, size: CGSize) -> some View {
        var view = AnyView(self)
        for effect in effects {
            switch effect {
            case .grain(let intensity):
                view = AnyView(view.colorEffect(
                    ShaderLibrary.filmGrain(
                        .float(seed),
                        .float(intensity)
                    )
                ))
            case .noise(let scale, let opacity):
                view = AnyView(view.colorEffect(
                    ShaderLibrary.perlinNoise(
                        .float(seed),
                        .float(scale),
                        .float(opacity),
                        .float2(Float(size.width), Float(size.height))
                    )
                ))
            case .voronoi(let scale, let opacity):
                view = AnyView(view.colorEffect(
                    ShaderLibrary.voronoiCells(
                        .float(seed),
                        .float(scale),
                        .float(opacity),
                        .float2(Float(size.width), Float(size.height))
                    )
                ))
            case .vignette(let intensity):
                view = AnyView(view.colorEffect(
                    ShaderLibrary.vignette(
                        .float(intensity),
                        .float2(Float(size.width), Float(size.height))
                    )
                ))
            }
        }
        return view
    }
}
