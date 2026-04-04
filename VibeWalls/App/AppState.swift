import SwiftUI

@MainActor
@Observable
final class AppState {
    var showPaywall = false
    let storeManager = StoreManager()
    let interstitialAdManager = InterstitialAdManager()
    let aiGenerator = AIGeneratorService()

    private(set) var savesUsed: Int {
        didSet { UserDefaults.standard.set(savesUsed, forKey: "wallpaperSavesUsed") }
    }

    var isPremium: Bool {
        storeManager.isSubscribed
    }

    var canSave: Bool {
        isPremium || savesUsed < 5
    }

    var savesRemaining: Int {
        max(0, 5 - savesUsed)
    }

    init() {
        self.savesUsed = UserDefaults.standard.integer(forKey: "wallpaperSavesUsed")
    }

    func recordSave() {
        savesUsed += 1
    }
}
