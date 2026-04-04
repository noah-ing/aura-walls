import SwiftUI

struct PaywallView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: Theme.paddingLg) {
                        // Hero
                        ZStack {
                            Circle()
                                .fill(Theme.accentGlow)
                                .frame(width: 120, height: 120)
                                .blur(radius: 40)

                            Image(systemName: "sparkles")
                                .font(.system(size: 50))
                                .foregroundStyle(Theme.accent)
                        }
                        .padding(.top, 40)

                        Text("Unlock Aura Walls Pro")
                            .font(.title.bold())
                            .foregroundStyle(.white)

                        Text("Unlimited wallpaper saves, no ads, full access to every gradient.")
                            .font(.subheadline)
                            .foregroundStyle(Theme.textSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, Theme.paddingXl)

                        // Features
                        VStack(alignment: .leading, spacing: 16) {
                            featureRow(icon: "infinity", text: "Unlimited saves to Photos")
                            featureRow(icon: "eye.slash", text: "No ads, ever")
                            featureRow(icon: "square.grid.2x2.fill", text: "All 60+ premium wallpapers")
                            featureRow(icon: "arrow.triangle.2.circlepath", text: "New wallpapers added regularly")
                        }
                        .padding(.horizontal, Theme.paddingLg)
                        .padding(.vertical, Theme.paddingMd)

                        Spacer(minLength: 20)

                        // Purchase button
                        if let product = appState.storeManager.product {
                            Button {
                                Task { await appState.storeManager.purchase() }
                            } label: {
                                VStack(spacing: 4) {
                                    Text("Subscribe Now")
                                        .font(.headline)
                                    Text("\(product.displayPrice) / week")
                                        .font(.caption)
                                        .opacity(0.8)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Theme.accent.gradient)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: Theme.cornerLg))
                            }
                            .disabled(appState.storeManager.purchaseState == .purchasing)
                            .padding(.horizontal, Theme.paddingLg)
                        } else {
                            ProgressView("Loading...")
                                .tint(Theme.accent)
                        }

                        // Restore
                        Button("Restore Purchases") {
                            Task { await appState.storeManager.restorePurchases() }
                        }
                        .font(.subheadline)
                        .foregroundStyle(Theme.textSecondary)

                        // Legal
                        Text("Auto-renewable subscription. Cancel anytime in Settings. Payment charged to your Apple ID. Subscription renews automatically unless cancelled at least 24 hours before the end of the current period.")
                            .font(.caption2)
                            .foregroundStyle(Theme.textSecondary.opacity(0.6))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, Theme.paddingLg)
                            .padding(.bottom, Theme.paddingLg)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Theme.textSecondary)
                    }
                }
            }
            .onChange(of: appState.storeManager.purchaseState) { _, newValue in
                if newValue == .purchased {
                    dismiss()
                }
            }
        }
    }

    private func featureRow(icon: String, text: String) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.body)
                .foregroundStyle(Theme.accent)
                .frame(width: 28)
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}
