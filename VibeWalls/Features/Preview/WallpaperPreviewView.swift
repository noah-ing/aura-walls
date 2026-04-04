import SwiftUI
import SwiftData
import Photos

struct WallpaperPreviewView: View {
    let wallpaper: WallpaperDefinition
    @Environment(AppState.self) private var appState
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Query private var favorites: [FavoriteWallpaper]

    @State private var showSavedToast = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var isSaving = false
    @State private var currentSeed: Float
    @State private var isAmoled = false

    init(wallpaper: WallpaperDefinition) {
        self.wallpaper = wallpaper
        self._currentSeed = State(initialValue: wallpaper.seed)
    }

    private var isFavorited: Bool {
        favorites.contains { $0.wallpaperId == wallpaper.id }
    }

    private var activeSpec: GradientSpec {
        isAmoled ? WallpaperExporter.applyAMOLED(to: wallpaper.gradientSpec) : wallpaper.gradientSpec
    }

    var body: some View {
        ZStack {
            GradientRenderer(spec: activeSpec, effects: wallpaper.effects, seed: currentSeed)
                .ignoresSafeArea()

            VStack {
                // Top bar
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white)
                    }

                    Spacer()

                    Text(wallpaper.name)
                        .font(.headline)
                        .foregroundStyle(.white)

                    Spacer()

                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .opacity(0)
                }
                .padding(.horizontal, Theme.paddingMd)
                .padding(.top, 8)

                Spacer()

                // Bottom actions
                HStack(spacing: 20) {
                    // Favorite
                    actionButton(
                        icon: isFavorited ? "heart.fill" : "heart",
                        label: "Favorite",
                        tint: isFavorited ? .red : .white
                    ) { toggleFavorite() }

                    // Shuffle
                    actionButton(icon: "dice.fill", label: "Shuffle", tint: .white) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            currentSeed = Float.random(in: 0...1000)
                        }
                    }

                    // AMOLED toggle
                    actionButton(
                        icon: isAmoled ? "circle.fill" : "circle",
                        label: "AMOLED",
                        tint: isAmoled ? .green : .white
                    ) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isAmoled.toggle()
                        }
                    }

                    // Save
                    Button { Task { await saveWallpaper() } } label: {
                        VStack(spacing: 4) {
                            ZStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .opacity(isSaving ? 0 : 1)
                                if isSaving {
                                    ProgressView()
                                        .tint(.white)
                                }
                            }
                            Group {
                                if appState.isPremium {
                                    Text("Save")
                                } else {
                                    Text("\(appState.savesRemaining) left")
                                }
                            }
                            .font(.caption2)
                            .foregroundStyle(.white)
                        }
                    }
                    .disabled(isSaving)
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }

            // Saved toast
            if showSavedToast {
                VStack {
                    Spacer()
                    Text("Saved to Photos!")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.green.gradient, in: Capsule())
                        .padding(.bottom, 100)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .navigationBarHidden(true)
        .alert("Error", isPresented: $showErrorAlert) {
            Button("OK") {}
        } message: {
            Text(errorMessage)
        }
    }

    private func actionButton(icon: String, label: String, tint: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(tint)
                Text(label)
                    .font(.caption2)
                    .foregroundStyle(.white)
            }
        }
    }

    private func toggleFavorite() {
        if let existing = favorites.first(where: { $0.wallpaperId == wallpaper.id }) {
            modelContext.delete(existing)
        } else {
            modelContext.insert(FavoriteWallpaper(wallpaperId: wallpaper.id))
        }
        try? modelContext.save()
    }

    private func saveWallpaper() async {
        guard !isSaving else { return }

        guard appState.canSave else {
            appState.showPaywall = true
            return
        }

        isSaving = true
        defer { isSaving = false }

        // Show interstitial ad for free users
        if !appState.isPremium {
            await appState.interstitialAdManager.showAd()
        }

        // Check photo library permission
        let status = await PHPhotoLibrary.requestAuthorization(for: .addOnly)
        guard status == .authorized || status == .limited else {
            errorMessage = "Photo library access is required to save wallpapers. Please enable it in Settings."
            showErrorAlert = true
            return
        }

        // Render using new exporter (captures Metal shader effects)
        guard let image = WallpaperExporter.renderToImage(
            spec: activeSpec,
            effects: wallpaper.effects,
            seed: currentSeed,
            amoled: false // already applied via activeSpec
        ) else {
            errorMessage = "Failed to render wallpaper."
            showErrorAlert = true
            return
        }

        // Save to photo library
        do {
            try await PHPhotoLibrary.shared().performChanges {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }

            if !appState.isPremium {
                appState.recordSave()
            }

            withAnimation(.spring(duration: 0.4)) {
                showSavedToast = true
            }
            try? await Task.sleep(for: .seconds(2))
            withAnimation { showSavedToast = false }

        } catch {
            errorMessage = "Failed to save: \(error.localizedDescription)"
            showErrorAlert = true
        }
    }
}
