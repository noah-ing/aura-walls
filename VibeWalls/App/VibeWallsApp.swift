import SwiftUI
import SwiftData
import GoogleMobileAds

@main
struct VibeWallsApp: App {
    @State private var appState = AppState()

    init() {
        MobileAds.shared.start()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(appState)
                .preferredColorScheme(.dark)
                .sheet(isPresented: $appState.showPaywall) {
                    PaywallView()
                        .environment(appState)
                }
        }
        .modelContainer(for: FavoriteWallpaper.self)
    }
}
