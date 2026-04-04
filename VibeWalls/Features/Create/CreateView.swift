import SwiftUI
import Photos

struct CreateView: View {
    @Environment(AppState.self) private var appState
    @State private var prompt = ""
    @State private var selectedPreset: StylePreset?
    @State private var showSavedToast = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var isSaving = false

    private var hasImage: Bool {
        appState.aiGenerator.generatedImage != nil
    }

    var body: some View {
        // Stable view hierarchy — always a NavigationStack, overlay the image
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                promptView
                    .opacity(hasImage ? 0 : 1)

                if let image = appState.aiGenerator.generatedImage {
                    generatedImageView(image)
                        .transition(.opacity)
                }
            }
            .navigationTitle(hasImage ? "" : "Create")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar(hasImage ? .hidden : .visible, for: .navigationBar)
            .toolbar(hasImage ? .hidden : .visible, for: .tabBar)
            .ignoresSafeArea(edges: hasImage ? .all : [])
            .alert("Error", isPresented: $showErrorAlert) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
        }
    }

    // MARK: - Prompt View

    private var promptView: some View {
        ScrollView {
            VStack(spacing: Theme.paddingLg) {
                VStack(spacing: 8) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 40))
                        .foregroundStyle(Theme.accent)

                    Text("AI Wallpaper Generator")
                        .font(.title3.bold())
                        .foregroundStyle(.white)

                    Text("Describe your dream wallpaper and AI will create it")
                        .font(.subheadline)
                        .foregroundStyle(Theme.textSecondary)
                        .multilineTextAlignment(.center)

                    if !appState.isPremium {
                        Label("Pro Feature", systemImage: "lock.fill")
                            .font(.caption.bold())
                            .foregroundStyle(Theme.accent)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Theme.accentGlow, in: Capsule())
                    }
                }
                .padding(.top, 20)

                // Style Presets
                VStack(alignment: .leading, spacing: 10) {
                    Text("Style")
                        .font(.subheadline.bold())
                        .foregroundStyle(Theme.textSecondary)
                        .padding(.leading, 4)

                    FlowLayout(spacing: 8) {
                        ForEach(StylePreset.allCases) { preset in
                            presetChip(preset)
                        }
                    }
                }
                .padding(.horizontal, Theme.paddingMd)

                // Prompt Input
                VStack(alignment: .leading, spacing: 10) {
                    Text("Describe your wallpaper")
                        .font(.subheadline.bold())
                        .foregroundStyle(Theme.textSecondary)
                        .padding(.leading, 4)

                    TextField("e.g., aurora borealis over mountains at night", text: $prompt, axis: .vertical)
                        .lineLimit(3...6)
                        .padding(14)
                        .background(Theme.surface)
                        .clipShape(RoundedRectangle(cornerRadius: Theme.cornerMd))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, Theme.paddingMd)

                // Generate Button
                Button {
                    guard appState.isPremium else {
                        appState.showPaywall = true
                        return
                    }

                    // Content filter check
                    if ContentFilter.containsBlockedContent(prompt) {
                        errorMessage = "Your prompt contains content that isn't allowed. Please try a different description."
                        showErrorAlert = true
                        return
                    }

                    let fullPrompt = buildPrompt()
                    Task { await appState.aiGenerator.generate(prompt: fullPrompt) }
                } label: {
                    HStack(spacing: 8) {
                        if appState.aiGenerator.isGenerating {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Image(systemName: "wand.and.sparkles")
                        }
                        Text(appState.aiGenerator.isGenerating ? "Generating..." : "Generate Wallpaper")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(prompt.isEmpty ? AnyShapeStyle(Theme.surfaceLight) : AnyShapeStyle(Theme.accent.gradient))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: Theme.cornerLg))
                }
                .disabled(prompt.isEmpty || appState.aiGenerator.isGenerating)
                .padding(.horizontal, Theme.paddingMd)

                if let error = appState.aiGenerator.error {
                    Text(error)
                        .font(.caption)
                        .foregroundStyle(.red)
                        .padding(.horizontal, Theme.paddingMd)
                }
            }
            .padding(.bottom, 80)
        }
    }

    // MARK: - Generated Image View

    private func generatedImageView(_ image: UIImage) -> some View {
        GeometryReader { geo in
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()

                VStack {
                    Spacer()

                    HStack(spacing: 32) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                appState.aiGenerator.generatedImage = nil
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: "arrow.counterclockwise")
                                    .font(.title2)
                                Text("New")
                                    .font(.caption2)
                            }
                            .foregroundStyle(.white)
                        }

                        Button { Task { await saveGenerated(image) } } label: {
                            VStack(spacing: 4) {
                                ZStack {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .font(.title2)
                                        .opacity(isSaving ? 0 : 1)
                                    if isSaving {
                                        ProgressView().tint(.white)
                                    }
                                }
                                Text("Save")
                                    .font(.caption2)
                            }
                            .foregroundStyle(.white)
                        }
                        .disabled(isSaving)
                    }
                    .padding(.vertical, 20)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                }

                if showSavedToast {
                    VStack {
                        Spacer()
                        Text("Saved to Photos!")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(.green.gradient, in: Capsule())
                            .padding(.bottom, 120)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
    }

    // MARK: - Helpers

    private func presetChip(_ preset: StylePreset) -> some View {
        Button {
            if selectedPreset == preset {
                selectedPreset = nil
            } else {
                selectedPreset = preset
                if prompt.isEmpty {
                    prompt = preset.examplePrompt
                }
            }
        } label: {
            HStack(spacing: 5) {
                Image(systemName: preset.icon)
                    .font(.caption2)
                Text(preset.rawValue)
                    .font(.subheadline.weight(.medium))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(selectedPreset == preset ? Theme.accent : Theme.surface)
            .foregroundStyle(selectedPreset == preset ? .white : Theme.textSecondary)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }

    private func buildPrompt() -> String {
        var base = prompt
        if let preset = selectedPreset {
            base = preset.prefix + base
        }
        // Force wallpaper-style output
        return base + ", wide angle, scenic background wallpaper, no closeup faces, no portraits, high quality, 4K, phone wallpaper aspect ratio"
    }

    private func saveGenerated(_ image: UIImage) async {
        guard !isSaving else { return }

        guard appState.canSave else {
            appState.showPaywall = true
            return
        }

        isSaving = true
        defer { isSaving = false }

        let status = await PHPhotoLibrary.requestAuthorization(for: .addOnly)
        guard status == .authorized || status == .limited else {
            errorMessage = "Photo library access required."
            showErrorAlert = true
            return
        }

        do {
            try await PHPhotoLibrary.shared().performChanges {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }
            if !appState.isPremium { appState.recordSave() }

            withAnimation(.spring(duration: 0.4)) { showSavedToast = true }
            try? await Task.sleep(for: .seconds(2))
            withAnimation { showSavedToast = false }
        } catch {
            errorMessage = "Failed to save: \(error.localizedDescription)"
            showErrorAlert = true
        }
    }
}

// MARK: - Content Filter

enum ContentFilter {
    private static let blockedTerms: Set<String> = [
        "nude", "naked", "nsfw", "porn", "pornographic", "xxx", "sexual",
        "erotic", "hentai", "topless", "bottomless", "genitalia", "genital",
        "breast", "nipple", "penis", "vagina", "sex", "intercourse",
        "orgasm", "fetish", "bondage", "bdsm", "lingerie", "underwear",
        "undress", "strip", "provocative", "seductive", "explicit",
        "gore", "blood", "murder", "kill", "violence", "torture",
        "dismember", "decapitate", "mutilate", "child", "minor", "underage",
        "loli", "shota", "drugs", "cocaine", "heroin", "meth"
    ]

    static func containsBlockedContent(_ text: String) -> Bool {
        let lowered = text.lowercased()
        let words = Set(lowered.components(separatedBy: .alphanumerics.inverted).filter { !$0.isEmpty })
        return !blockedTerms.isDisjoint(with: words)
    }
}

// MARK: - Style Presets

enum StylePreset: String, CaseIterable, Identifiable {
    case abstract = "Abstract"
    case dark = "Dark"
    case nature = "Nature"
    case neon = "Neon"
    case minimal = "Minimal"
    case cosmic = "Cosmic"
    case cyberpunk = "Cyberpunk"
    case watercolor = "Watercolor"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .abstract: "scribble.variable"
        case .dark: "moon.fill"
        case .nature: "leaf.fill"
        case .neon: "bolt.fill"
        case .minimal: "square"
        case .cosmic: "sparkles"
        case .cyberpunk: "building.2.fill"
        case .watercolor: "paintbrush.fill"
        }
    }

    var prefix: String {
        switch self {
        case .abstract: "abstract art wallpaper, flowing shapes, vibrant colors, "
        case .dark: "dark moody wallpaper, deep shadows, minimal light, "
        case .nature: "nature landscape wallpaper, photorealistic, golden hour, "
        case .neon: "neon glow wallpaper, dark background, electric colors, cyberpunk, "
        case .minimal: "minimalist wallpaper, clean design, simple shapes, negative space, "
        case .cosmic: "cosmic space wallpaper, nebula, stars, galaxies, deep space, "
        case .cyberpunk: "cyberpunk city wallpaper, futuristic, rain, neon signs, "
        case .watercolor: "watercolor painting wallpaper, soft brushstrokes, artistic, dreamy, "
        }
    }

    var examplePrompt: String {
        switch self {
        case .abstract: "swirling purple and gold fluid shapes"
        case .dark: "silhouette of mountains under starless sky"
        case .nature: "misty forest with sunbeams through trees"
        case .neon: "glowing geometric shapes on black"
        case .minimal: "single circle on soft gradient background"
        case .cosmic: "colorful nebula with distant stars"
        case .cyberpunk: "rainy neon-lit street at night"
        case .watercolor: "cherry blossoms in soft pink and white"
        }
    }
}

// MARK: - Flow Layout

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        arrange(proposal: proposal, subviews: subviews).size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (positions: [CGPoint], size: CGSize) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0, y: CGFloat = 0, rowHeight: CGFloat = 0, maxX: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth, x > 0 {
                x = 0; y += rowHeight + spacing; rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            maxX = max(maxX, x - spacing)
        }
        return (positions, CGSize(width: maxX, height: y + rowHeight))
    }
}
