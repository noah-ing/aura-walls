import SwiftUI

struct SettingsView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            List {
                // Subscription section
                Section {
                    if appState.isPremium {
                        Label {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Aura Walls Pro")
                                    .font(.headline)
                                Text("Active subscription")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        } icon: {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.green)
                        }
                    } else {
                        Button {
                            appState.showPaywall = true
                        } label: {
                            Label {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Upgrade to Pro")
                                        .font(.headline)
                                    Text("Unlimited saves, no ads")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            } icon: {
                                Image(systemName: "sparkles")
                                    .foregroundStyle(Theme.accent)
                            }
                        }
                    }
                } header: {
                    Text("Subscription")
                }

                // Saves section
                Section {
                    HStack {
                        Text("Wallpapers Saved")
                        Spacer()
                        if appState.isPremium {
                            Text("Unlimited")
                                .foregroundStyle(.green)
                        } else {
                            Text("\(appState.savesUsed) / 5")
                                .foregroundStyle(appState.savesRemaining <= 1 ? .red : .secondary)
                        }
                    }
                } header: {
                    Text("Usage")
                }

                // Restore
                Section {
                    Button("Restore Purchases") {
                        Task { await appState.storeManager.restorePurchases() }
                    }
                } header: {
                    Text("Purchases")
                }

                // About
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0")
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("About")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
