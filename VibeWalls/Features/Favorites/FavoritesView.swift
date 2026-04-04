import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(AppState.self) private var appState
    @Query(sort: \FavoriteWallpaper.favoritedAt, order: .reverse)
    private var favorites: [FavoriteWallpaper]

    private var favoriteWallpapers: [WallpaperDefinition] {
        favorites.compactMap { fav in
            WallpaperCatalog.all.first { $0.id == fav.wallpaperId }
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if favoriteWallpapers.isEmpty {
                    ContentUnavailableView(
                        "No Favorites Yet",
                        systemImage: "heart.slash",
                        description: Text("Tap the heart icon on any wallpaper to save it here.")
                    )
                } else {
                    ScrollView {
                        LazyVGrid(columns: Theme.gridColumns, spacing: Theme.gridSpacing) {
                            ForEach(favoriteWallpapers) { wallpaper in
                                NavigationLink(value: wallpaper.id) {
                                    WallpaperGridItem(wallpaper: wallpaper)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, Theme.paddingMd)
                        .padding(.bottom, 80)
                    }
                }
            }
            .background(Theme.background)
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: String.self) { wallpaperId in
                if let wallpaper = WallpaperCatalog.all.first(where: { $0.id == wallpaperId }) {
                    WallpaperPreviewView(wallpaper: wallpaper)
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .safeAreaInset(edge: .bottom) {
                if !appState.isPremium {
                    BannerAdView()
                        .frame(height: 50)
                }
            }
        }
    }
}
