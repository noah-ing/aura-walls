import Foundation

enum AdConstants {
    #if DEBUG
    static let bannerAdUnitId = "ca-app-pub-3940256099942544/2435281174"
    static let interstitialAdUnitId = "ca-app-pub-3940256099942544/4411468910"
    #else
    static let bannerAdUnitId = Secrets.admobBannerId
    static let interstitialAdUnitId = Secrets.admobInterstitialId
    #endif

    static let appId = Secrets.admobAppId
}
