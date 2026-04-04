import SwiftUI
import SwiftData

@Model
final class FavoriteWallpaper {
    @Attribute(.unique) var wallpaperId: String
    var favoritedAt: Date

    init(wallpaperId: String, favoritedAt: Date = .now) {
        self.wallpaperId = wallpaperId
        self.favoritedAt = favoritedAt
    }
}
