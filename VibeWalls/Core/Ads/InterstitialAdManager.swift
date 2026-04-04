import GoogleMobileAds
import SwiftUI

@MainActor
@Observable
final class InterstitialAdManager {
    private var interstitialAd: InterstitialAd?
    private(set) var isLoaded = false

    init() {
        Task { await loadAd() }
    }

    func loadAd() async {
        do {
            interstitialAd = try await InterstitialAd.load(
                with: AdConstants.interstitialAdUnitId,
                request: Request()
            )
            isLoaded = true
        } catch {
            isLoaded = false
        }
    }

    func showAd() async {
        guard let ad = interstitialAd else { return }

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else {
            return
        }

        ad.present(from: rootVC)
        interstitialAd = nil
        isLoaded = false

        // Small delay then preload next
        try? await Task.sleep(for: .seconds(1))
        await loadAd()
    }
}
