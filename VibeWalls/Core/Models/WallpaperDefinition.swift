import Foundation

struct WallpaperDefinition: Identifiable {
    let id: String
    let name: String
    let category: WallpaperCategory
    let gradientSpec: GradientSpec
    let effects: [WallpaperEffect]
    let seed: Float

    init(id: String, name: String, category: WallpaperCategory, gradientSpec: GradientSpec,
         effects: [WallpaperEffect] = [], seed: Float = 0) {
        self.id = id
        self.name = name
        self.category = category
        self.gradientSpec = gradientSpec
        self.effects = effects
        self.seed = seed
    }
}
