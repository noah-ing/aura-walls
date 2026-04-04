import SwiftUI

struct WallpaperGridItem: View {
    let wallpaper: WallpaperDefinition

    var body: some View {
        GradientRenderer(spec: wallpaper.gradientSpec, effects: wallpaper.effects, seed: wallpaper.seed)
            .aspectRatio(9 / 19.5, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: Theme.cornerMd))
            .overlay(
                RoundedRectangle(cornerRadius: Theme.cornerMd)
                    .strokeBorder(Color.white.opacity(0.08), lineWidth: 0.5)
            )
            .overlay(alignment: .bottom) {
                Text(wallpaper.name)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .clipShape(UnevenRoundedRectangle(
                        bottomLeadingRadius: Theme.cornerMd,
                        bottomTrailingRadius: Theme.cornerMd
                    ))
            }
    }
}
