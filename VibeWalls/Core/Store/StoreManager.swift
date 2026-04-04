import StoreKit
import SwiftUI

@MainActor
@Observable
final class StoreManager {
    private(set) var product: Product?
    private(set) var purchaseState: PurchaseState = .idle
    private(set) var isSubscribed = false

    private var transactionListener: Task<Void, Never>?
    private let productId = "com.aurawalls.pro.weekly"

    enum PurchaseState: Equatable {
        case idle, loading, purchasing, purchased, failed(String)
    }

    init() {
        transactionListener = listenForTransactions()
        Task { await loadProduct() }
        Task { await checkSubscriptionStatus() }
    }

    func cancelListener() {
        transactionListener?.cancel()
    }

    func loadProduct() async {
        guard product == nil else { return }
        purchaseState = .loading
        do {
            let products = try await Product.products(for: [productId])
            product = products.first
            purchaseState = .idle
        } catch {
            purchaseState = .failed("Failed to load product.")
        }
    }

    func purchase() async {
        guard let product else {
            purchaseState = .failed("Product not available.")
            return
        }

        purchaseState = .purchasing
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                await transaction.finish()
                await checkSubscriptionStatus()
                purchaseState = .purchased
            case .userCancelled:
                purchaseState = .idle
            case .pending:
                purchaseState = .idle
            @unknown default:
                purchaseState = .idle
            }
        } catch {
            purchaseState = .failed("Purchase failed: \(error.localizedDescription)")
        }
    }

    func restorePurchases() async {
        do {
            try await AppStore.sync()
            await checkSubscriptionStatus()
        } catch {
            purchaseState = .failed("Restore failed: \(error.localizedDescription)")
        }
    }

    func checkSubscriptionStatus() async {
        var foundActive = false
        for await result in Transaction.currentEntitlements {
            if let transaction = try? checkVerified(result),
               transaction.productID == productId,
               transaction.revocationDate == nil {
                foundActive = true
                break
            }
        }
        isSubscribed = foundActive
    }

    private func listenForTransactions() -> Task<Void, Never> {
        Task.detached { [weak self] in
            for await result in Transaction.updates {
                if let transaction = try? result.payloadValue {
                    await transaction.finish()
                    await self?.checkSubscriptionStatus()
                }
            }
        }
    }

    private nonisolated func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let error):
            throw error
        case .verified(let safe):
            return safe
        }
    }
}
