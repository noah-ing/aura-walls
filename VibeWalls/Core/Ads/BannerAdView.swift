import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    let adUnitID: String

    init(adUnitID: String = AdConstants.bannerAdUnitId) {
        self.adUnitID = adUnitID
    }

    func makeUIView(context: Context) -> BannerView {
        let banner = BannerView()
        banner.adUnitID = adUnitID
        banner.translatesAutoresizingMaskIntoConstraints = false

        let width = UIScreen.main.bounds.width
        banner.adSize = currentOrientationAnchoredAdaptiveBanner(width: width)

        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                banner.rootViewController = rootVC
                banner.load(Request())
            }
        }

        return banner
    }

    func updateUIView(_ uiView: BannerView, context: Context) {}
}
