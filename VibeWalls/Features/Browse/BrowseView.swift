import SwiftUI

struct BrowseView: View {
    @Environment(AppState.self) private var appState
    @State private var selectedCategory: WallpaperCategory?
    @State private var searchText = ""

    private var filteredWallpapers: [WallpaperDefinition] {
        var wallpapers = WallpaperCatalog.all
        if let category = selectedCategory {
            wallpapers = wallpapers.filter { $0.category == category }
        }
        if !searchText.isEmpty {
            wallpapers = wallpapers.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        return wallpapers
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Theme.paddingMd) {
                    CategoryChipBar(selected: $selectedCategory)

                    LazyVGrid(columns: Theme.gridColumns, spacing: Theme.gridSpacing) {
                        ForEach(filteredWallpapers) { wallpaper in
                            NavigationLink(value: wallpaper.id) {
                                WallpaperGridItem(wallpaper: wallpaper)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, Theme.paddingMd)
                    .animation(.easeInOut(duration: 0.25), value: selectedCategory)
                }
                .padding(.bottom, 80)
            }
            .background(Theme.background)
            .navigationTitle("Aura Walls")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search wallpapers")
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
