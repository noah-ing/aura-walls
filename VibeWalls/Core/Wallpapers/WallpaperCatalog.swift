import SwiftUI

struct WallpaperCatalog {

    static let all: [WallpaperDefinition] = dark + minimal + nature + abstract + neon + gradient
        + amoled + geometric + marble + pastel

    // MARK: - Dark

    private static let dark: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "dark_obsidian_depths",
            name: "Obsidian Depths",
            category: .dark,
            gradientSpec: linear(180, [(0x0A0A0A, 0.0), (0x1A1A2E, 0.5), (0x16213E, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "dark_midnight_ember",
            name: "Midnight Ember",
            category: .dark,
            gradientSpec: radial(.bottom, 600, [(0x0D0D0D, 0.0), (0x1B0000, 0.5), (0x3D0000, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.4), .noise(scale: 4, opacity: 0.1)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "dark_charcoal_veil",
            name: "Charcoal Veil",
            category: .dark,
            gradientSpec: linear(135, [(0x141414, 0.0), (0x1C1C1C, 0.5), (0x2D2D2D, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.2)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "dark_void_amethyst",
            name: "Void Amethyst",
            category: .dark,
            gradientSpec: radial(.center, 500, [(0x0A0A0A, 0.0), (0x1A0A2E, 0.5), (0x2D1B69, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 5, opacity: 0.1)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "dark_dark_tide",
            name: "Dark Tide",
            category: .dark,
            gradientSpec: linear(200, [(0x0B132B, 0.0), (0x1C2541, 0.5), (0x3A506B, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.2), .noise(scale: 3, opacity: 0.08)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "dark_eclipse",
            name: "Eclipse",
            category: .dark,
            gradientSpec: radialWithOpacity(.topTrailing, 400, [
                (0x000000, 1.0, 0.0),
                (0x1A1A1A, 1.0, 0.5),
                (0xFF6B35, 0.3, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.5)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "dark_carbon_fiber",
            name: "Carbon Fiber",
            category: .dark,
            gradientSpec: linear(90, [
                (0x111111, 0.0),
                (0x1A1A1A, 0.33),
                (0x111111, 0.66),
                (0x1A1A1A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.2)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "dark_onyx_rose",
            name: "Onyx Rose",
            category: .dark,
            gradientSpec: linear(160, [(0x0A0A0A, 0.0), (0x2B0A1E, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 4, opacity: 0.09)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "dark_shadow_teal",
            name: "Shadow Teal",
            category: .dark,
            gradientSpec: angular(.center, 360, [(0x0A0A0A, 0.0), (0x0A2E2E, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.4)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "dark_abyss",
            name: "Abyss",
            category: .dark,
            gradientSpec: radial(.bottomLeading, 600, [(0x000000, 0.0), (0x0A1628, 0.5), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.5), .noise(scale: 6, opacity: 0.12)],
            seed: 199
        ),
        // New dark wallpapers 11-20
        WallpaperDefinition(
            id: "dark_blackout_blue",
            name: "Blackout Blue",
            category: .dark,
            gradientSpec: linear(170, [(0x000000, 0.0), (0x0D1B2A, 0.5), (0x1B263B, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "dark_phantom",
            name: "Phantom",
            category: .dark,
            gradientSpec: radial(.center, 450, [(0x050505, 0.0), (0x1A0533, 0.5), (0x050505, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.4), .noise(scale: 5, opacity: 0.1)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "dark_deep_space",
            name: "Deep Space",
            category: .dark,
            gradientSpec: linear(180, [(0x000000, 0.0), (0x0B0B1E, 0.33), (0x1A1A3E, 0.66), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.5), .noise(scale: 4, opacity: 0.12)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "dark_smoked_glass",
            name: "Smoked Glass",
            category: .dark,
            gradientSpec: linear(135, [(0x1A1A1A, 0.0), (0x2C2C2C, 0.5), (0x1A1A1A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.2)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "dark_obsidian_flame",
            name: "Obsidian Flame",
            category: .dark,
            gradientSpec: radial(.bottomTrailing, 500, [(0x0A0A0A, 0.0), (0x3D0C02, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.4), .noise(scale: 3, opacity: 0.15)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "dark_dark_matter",
            name: "Dark Matter",
            category: .dark,
            gradientSpec: angular(.center, 360, [
                (0x0A0A0A, 0.0),
                (0x1A1A2E, 0.25),
                (0x0A0A0A, 0.5),
                (0x1A2E1A, 0.75),
                (0x0A0A0A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 5, opacity: 0.08)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "dark_ink_well",
            name: "Ink Well",
            category: .dark,
            gradientSpec: linear(200, [(0x000000, 0.0), (0x1C1C2E, 0.5), (0x2A2A42, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "dark_pitch",
            name: "Pitch",
            category: .dark,
            gradientSpec: radial(.topLeading, 550, [(0x000000, 0.0), (0x0A0A14, 0.5), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.5)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "dark_tar_horizon",
            name: "Tar Horizon",
            category: .dark,
            gradientSpec: linear(180, [
                (0x0A0A0A, 0.0),
                (0x141414, 0.25),
                (0x1E1E1E, 0.5),
                (0x141414, 0.75),
                (0x0A0A0A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.2), .noise(scale: 6, opacity: 0.1)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "dark_shadow_pulse",
            name: "Shadow Pulse",
            category: .dark,
            gradientSpec: radial(.center, 400, [(0x0A0A0A, 0.0), (0x0A1A2A, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.4), .noise(scale: 4, opacity: 0.11)],
            seed: 53
        ),
    ]

    // MARK: - Minimal

    private static let minimal: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "minimal_cotton",
            name: "Cotton",
            category: .minimal,
            gradientSpec: linear(180, [(0xFFFFFF, 0.0), (0xF5F5F5, 0.5), (0xE8E8E8, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "minimal_whisper",
            name: "Whisper",
            category: .minimal,
            gradientSpec: linear(135, [(0xFAF9F6, 0.0), (0xE8E4DF, 0.5), (0xD4CFC9, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "minimal_fog",
            name: "Fog",
            category: .minimal,
            gradientSpec: radial(.top, 500, [(0xFFFFFF, 0.0), (0xE0E5EC, 0.5), (0xD0D5DC, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "minimal_parchment",
            name: "Parchment",
            category: .minimal,
            gradientSpec: linear(180, [(0xFFF8F0, 0.0), (0xF5E6D3, 0.5), (0xE8D5B7, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "minimal_frost",
            name: "Frost",
            category: .minimal,
            gradientSpec: linear(200, [(0xF0F4F8, 0.0), (0xD9E2EC, 0.5), (0xBCCCDC, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "minimal_blush_air",
            name: "Blush Air",
            category: .minimal,
            gradientSpec: linear(160, [(0xFFF5F5, 0.0), (0xFED7D7, 0.5), (0xFEB2B2, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "minimal_sage",
            name: "Sage",
            category: .minimal,
            gradientSpec: linear(170, [(0xF7FFF7, 0.0), (0xD4EDDA, 0.5), (0xB7D4B7, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "minimal_linen",
            name: "Linen",
            category: .minimal,
            gradientSpec: linear(145, [(0xFAF0E6, 0.0), (0xF5DEB3, 0.5), (0xDEB887, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "minimal_silver",
            name: "Silver",
            category: .minimal,
            gradientSpec: angular(.center, 360, [
                (0xF8F9FA, 0.0),
                (0xDEE2E6, 0.33),
                (0xADB5BD, 0.66),
                (0xF8F9FA, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "minimal_cloud_nine",
            name: "Cloud Nine",
            category: .minimal,
            gradientSpec: radial(.center, 400, [
                (0xFFFFFF, 0.0),
                (0xF8F9FA, 0.33),
                (0xE9ECEF, 0.66),
                (0xFFFFFF, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 199
        ),
        // New minimal wallpapers 11-20
        WallpaperDefinition(
            id: "minimal_cream",
            name: "Cream",
            category: .minimal,
            gradientSpec: linear(180, [(0xFFFDD0, 0.0), (0xFFF8E1, 0.5), (0xFFFDE7, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "minimal_snowdrift",
            name: "Snowdrift",
            category: .minimal,
            gradientSpec: linear(170, [(0xFFFFFF, 0.0), (0xFAFAFA, 0.33), (0xF0F0F0, 0.66), (0xFFFFFF, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "minimal_pearl",
            name: "Pearl",
            category: .minimal,
            gradientSpec: radial(.center, 400, [(0xFFFFFF, 0.0), (0xF0EDE8, 0.5), (0xE8E0D8, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "minimal_ivory_mist",
            name: "Ivory Mist",
            category: .minimal,
            gradientSpec: linear(160, [(0xFFFFF0, 0.0), (0xFAF0E6, 0.5), (0xFAEBD7, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "minimal_dove",
            name: "Dove",
            category: .minimal,
            gradientSpec: linear(145, [(0xF5F5F5, 0.0), (0xEBEBEB, 0.5), (0xE0E0E0, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "minimal_porcelain",
            name: "Porcelain",
            category: .minimal,
            gradientSpec: linear(135, [(0xFFFFFF, 0.0), (0xF8F8FF, 0.5), (0xF0F0FF, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "minimal_powder",
            name: "Powder",
            category: .minimal,
            gradientSpec: radial(.top, 500, [(0xFFFFFF, 0.0), (0xE8EAF6, 0.5), (0xC5CAE9, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "minimal_eggshell",
            name: "Eggshell",
            category: .minimal,
            gradientSpec: linear(180, [(0xF5F5DC, 0.0), (0xFFFFF0, 0.5), (0xFFF8DC, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "minimal_mist",
            name: "Mist",
            category: .minimal,
            gradientSpec: linear(200, [(0xF0F4F8, 0.0), (0xE2E8F0, 0.33), (0xCBD5E0, 0.66), (0xE2E8F0, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "minimal_alabaster",
            name: "Alabaster",
            category: .minimal,
            gradientSpec: angular(.center, 360, [
                (0xFAFAF0, 0.0),
                (0xF0F0E0, 0.33),
                (0xE8E8D8, 0.66),
                (0xFAFAF0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 53
        ),
    ]

    // MARK: - Nature

    private static let nature: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "nature_golden_hour",
            name: "Golden Hour",
            category: .nature,
            gradientSpec: linear(180, [
                (0xFF6B35, 0.0),
                (0xF7C59F, 0.33),
                (0xFFE66D, 0.66),
                (0xFF6B35, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.0), .noise(scale: 5, opacity: 0.12)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "nature_deep_forest",
            name: "Deep Forest",
            category: .nature,
            gradientSpec: linear(180, [
                (0x1B4332, 0.0),
                (0x2D6A4F, 0.33),
                (0x40916C, 0.66),
                (0x52B788, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.15)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "nature_ocean_floor",
            name: "Ocean Floor",
            category: .nature,
            gradientSpec: linear(170, [
                (0x023E8A, 0.0),
                (0x0077B6, 0.33),
                (0x0096C7, 0.66),
                (0x48CAE4, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 7, opacity: 0.12)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "nature_desert_dusk",
            name: "Desert Dusk",
            category: .nature,
            gradientSpec: linear(200, [
                (0xD4A373, 0.0),
                (0xCCD5AE, 0.33),
                (0xE9EDC9, 0.66),
                (0xFEFAE0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 5, opacity: 0.1), .vignette(intensity: 1.0)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "nature_aurora",
            name: "Aurora",
            category: .nature,
            gradientSpec: linear(160, [
                (0x004E64, 0.0),
                (0x25A18E, 0.33),
                (0x7AE582, 0.66),
                (0x9FFFCB, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 8, opacity: 0.15)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "nature_cherry_blossom",
            name: "Cherry Blossom",
            category: .nature,
            gradientSpec: radial(.topTrailing, 500, [
                (0xFFCAD4, 0.0),
                (0xF4ACB7, 0.33),
                (0xD8E2DC, 0.66),
                (0xFFE5D9, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 4, opacity: 0.1)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "nature_volcanic",
            name: "Volcanic",
            category: .nature,
            gradientSpec: linear(180, [
                (0x1A1A2E, 0.0),
                (0xE94560, 0.33),
                (0xFF6B35, 0.66),
                (0xFFD700, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.18), .vignette(intensity: 1.0)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "nature_misty_mountain",
            name: "Misty Mountain",
            category: .nature,
            gradientSpec: linear(180, [
                (0xCCD5AE, 0.0),
                (0xD4E09B, 0.33),
                (0xF6F4D2, 0.66),
                (0xFFFFFF, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 7, opacity: 0.12)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "nature_coral_reef",
            name: "Coral Reef",
            category: .nature,
            gradientSpec: radial(.bottom, 500, [
                (0x006D77, 0.0),
                (0x83C5BE, 0.33),
                (0xEDF6F9, 0.66),
                (0xFFDDD2, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 5, opacity: 0.14)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "nature_autumn",
            name: "Autumn",
            category: .nature,
            gradientSpec: linear(135, [
                (0xD4A373, 0.0),
                (0xE76F51, 0.33),
                (0xF4A261, 0.66),
                (0xE9C46A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.13), .vignette(intensity: 1.0)],
            seed: 199
        ),
        // New nature wallpapers 11-20
        WallpaperDefinition(
            id: "nature_meadow",
            name: "Meadow",
            category: .nature,
            gradientSpec: linear(170, [
                (0x7CB342, 0.0),
                (0x8BC34A, 0.33),
                (0xAED581, 0.66),
                (0xC5E1A5, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.14)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "nature_tide_pool",
            name: "Tide Pool",
            category: .nature,
            gradientSpec: radial(.bottom, 500, [
                (0x004D40, 0.0),
                (0x00695C, 0.33),
                (0x00897B, 0.66),
                (0x4DB6AC, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 7, opacity: 0.16)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "nature_sandstone",
            name: "Sandstone",
            category: .nature,
            gradientSpec: linear(180, [
                (0xD7CCC8, 0.0),
                (0xBCAAA4, 0.33),
                (0xA1887F, 0.66),
                (0x8D6E63, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 5, opacity: 0.18)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "nature_wildfire",
            name: "Wildfire",
            category: .nature,
            gradientSpec: linear(160, [
                (0xBF360C, 0.0),
                (0xE65100, 0.33),
                (0xFF6D00, 0.66),
                (0xFF9100, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.2), .vignette(intensity: 1.0)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "nature_glacier",
            name: "Glacier",
            category: .nature,
            gradientSpec: linear(200, [
                (0xE3F2FD, 0.0),
                (0xBBDEFB, 0.33),
                (0x90CAF9, 0.66),
                (0x64B5F6, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 4, opacity: 0.1)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "nature_fern",
            name: "Fern",
            category: .nature,
            gradientSpec: linear(180, [
                (0x1B5E20, 0.0),
                (0x2E7D32, 0.33),
                (0x388E3C, 0.66),
                (0x4CAF50, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 8, opacity: 0.15)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "nature_driftwood",
            name: "Driftwood",
            category: .nature,
            gradientSpec: linear(135, [
                (0x795548, 0.0),
                (0x8D6E63, 0.33),
                (0xA1887F, 0.66),
                (0xBCAAA4, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 5, opacity: 0.16)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "nature_lagoon",
            name: "Lagoon",
            category: .nature,
            gradientSpec: radial(.center, 500, [
                (0x006064, 0.0),
                (0x00838F, 0.33),
                (0x0097A7, 0.66),
                (0x00BCD4, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 7, opacity: 0.14)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "nature_ember",
            name: "Ember",
            category: .nature,
            gradientSpec: radial(.bottom, 400, [
                (0x3E2723, 0.0),
                (0x4E342E, 0.33),
                (0xBF360C, 0.66),
                (0xFF6F00, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 6, opacity: 0.18), .vignette(intensity: 1.0)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "nature_rainfall",
            name: "Rainfall",
            category: .nature,
            gradientSpec: linear(180, [
                (0x546E7A, 0.0),
                (0x78909C, 0.33),
                (0x90A4AE, 0.66),
                (0xB0BEC5, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .noise(scale: 8, opacity: 0.2)],
            seed: 53
        ),
    ]

    // MARK: - Abstract

    private static let abstract: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "abstract_synthwave_memory",
            name: "Synthwave Memory",
            category: .abstract,
            gradientSpec: angular(.center, 360, [
                (0xFF006E, 0.0),
                (0x8338EC, 0.33),
                (0x3A86FF, 0.66),
                (0xFF006E, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 8, opacity: 0.18)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "abstract_broken_prism",
            name: "Broken Prism",
            category: .abstract,
            gradientSpec: angular(.bottomLeading, 360, [
                (0xFFD700, 0.0),
                (0xFF6B35, 0.25),
                (0xFF006E, 0.5),
                (0x8338EC, 0.75),
                (0x3A86FF, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 4, opacity: 0.2)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "abstract_duotone_pop",
            name: "Duotone Pop",
            category: .abstract,
            gradientSpec: linear(135, [(0xFF006E, 0.0), (0x8338EC, 1.0)]),
            effects: [.grain(intensity: 0.05), .noise(scale: 3, opacity: 0.15)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "abstract_chromatic_drift",
            name: "Chromatic Drift",
            category: .abstract,
            gradientSpec: mesh3x3(
                topLeft: 0xFF006E,
                topRight: 0x3A86FF,
                bottomLeft: 0xFFD700,
                bottomRight: 0x06D6A0
            ),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 10, opacity: 0.2)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "abstract_smoke_signal",
            name: "Smoke Signal",
            category: .abstract,
            gradientSpec: radial(.trailing, 400, [
                (0x2B2D42, 0.0),
                (0x8D99AE, 0.5),
                (0xEDF2F4, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 5, opacity: 0.18)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "abstract_acid_wash",
            name: "Acid Wash",
            category: .abstract,
            gradientSpec: linear(225, [
                (0xF72585, 0.0),
                (0x7209B7, 0.25),
                (0x3A0CA3, 0.5),
                (0x4361EE, 0.75),
                (0x4CC9F0, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 7, opacity: 0.22)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "abstract_rust_and_cyan",
            name: "Rust & Cyan",
            category: .abstract,
            gradientSpec: linear(150, [(0xE76F51, 0.0), (0x264653, 1.0)]),
            effects: [.grain(intensity: 0.05), .noise(scale: 4, opacity: 0.2)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "abstract_paper_moon",
            name: "Paper Moon",
            category: .abstract,
            gradientSpec: radial(.topLeading, 500, [
                (0xFAF3DD, 0.0),
                (0xC8D5B9, 0.33),
                (0x8FC0A9, 0.66),
                (0x68B0AB, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 3, opacity: 0.16)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "abstract_glitch",
            name: "Glitch",
            category: .abstract,
            gradientSpec: linear(90, [
                (0xFF006E, 0.0),
                (0x000000, 0.25),
                (0x3A86FF, 0.5),
                (0x000000, 0.75),
                (0xFFD700, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 12, opacity: 0.25)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "abstract_marble_swirl",
            name: "Marble Swirl",
            category: .abstract,
            gradientSpec: angular(.center, 270, [
                (0xFAF9F6, 0.0),
                (0xCCC5B9, 0.33),
                (0x6B705C, 0.66),
                (0xFAF9F6, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 5, opacity: 0.2)],
            seed: 199
        ),
        // New abstract wallpapers 11-20
        WallpaperDefinition(
            id: "abstract_pixel_storm",
            name: "Pixel Storm",
            category: .abstract,
            gradientSpec: linear(90, [
                (0xFF1744, 0.0),
                (0x000000, 0.2),
                (0x00E5FF, 0.4),
                (0x000000, 0.6),
                (0xFFEA00, 0.8),
                (0x000000, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 10, opacity: 0.3)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "abstract_neon_dream",
            name: "Neon Dream",
            category: .abstract,
            gradientSpec: angular(.center, 360, [
                (0xFF4081, 0.0),
                (0x7C4DFF, 0.25),
                (0x00BFA5, 0.5),
                (0xFFD740, 0.75),
                (0xFF4081, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 4, opacity: 0.18)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "abstract_spectrum_shift",
            name: "Spectrum Shift",
            category: .abstract,
            gradientSpec: linear(180, [(0x6200EA, 0.0), (0x00BFA5, 0.5), (0xFFD600, 1.0)]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 9, opacity: 0.2)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "abstract_clash",
            name: "Clash",
            category: .abstract,
            gradientSpec: linear(45, [(0xFF1744, 0.0), (0x2979FF, 1.0)]),
            effects: [.grain(intensity: 0.05), .noise(scale: 3, opacity: 0.25)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "abstract_double_helix",
            name: "Double Helix",
            category: .abstract,
            gradientSpec: angular(.bottomTrailing, 360, [
                (0xE040FB, 0.0),
                (0x40C4FF, 0.25),
                (0xE040FB, 0.5),
                (0x69F0AE, 0.75),
                (0xE040FB, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 11, opacity: 0.22)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "abstract_fission",
            name: "Fission",
            category: .abstract,
            gradientSpec: radial(.center, 400, [
                (0x000000, 0.0),
                (0xFF1744, 0.25),
                (0x000000, 0.5),
                (0x2979FF, 0.75),
                (0x000000, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 5, opacity: 0.22)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "abstract_waveform",
            name: "Waveform",
            category: .abstract,
            gradientSpec: linear(135, [
                (0x1DE9B6, 0.0),
                (0x00B8D4, 0.33),
                (0x6200EA, 0.66),
                (0xAA00FF, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 8, opacity: 0.2)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "abstract_infrared",
            name: "Infrared",
            category: .abstract,
            gradientSpec: linear(160, [
                (0xFF1744, 0.0),
                (0xD50000, 0.33),
                (0xB71C1C, 0.66),
                (0x880E4F, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .noise(scale: 4, opacity: 0.2)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "abstract_holographic",
            name: "Holographic",
            category: .abstract,
            gradientSpec: angular(.center, 360, [
                (0xE1BEE7, 0.0),
                (0xB3E5FC, 0.2),
                (0xDCEDC8, 0.4),
                (0xFFF9C4, 0.6),
                (0xF8BBD0, 0.8),
                (0xE1BEE7, 1.0),
            ]),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 6, opacity: 0.15)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "abstract_acid_trip",
            name: "Acid Trip",
            category: .abstract,
            gradientSpec: mesh3x3(
                topLeft: 0xFF00FF,
                topRight: 0x00FFFF,
                bottomLeft: 0xFFFF00,
                bottomRight: 0xFF0000
            ),
            effects: [.grain(intensity: 0.05), .voronoi(scale: 12, opacity: 0.28)],
            seed: 53
        ),
    ]

    // MARK: - Neon

    private static let neon: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "neon_neon_pulse",
            name: "Neon Pulse",
            category: .neon,
            gradientSpec: radialWithOpacity(.center, 400, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFF006E, 0.6, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "neon_cyber_grid",
            name: "Cyber Grid",
            category: .neon,
            gradientSpec: linear(180, [(0x0A0A0A, 0.0), (0x00F5FF, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 4, opacity: 0.1)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "neon_plasma",
            name: "Plasma",
            category: .neon,
            gradientSpec: radial(.bottomLeading, 500, [
                (0x0A0A0A, 0.0),
                (0x7B2FBE, 0.33),
                (0xE040FB, 0.66),
                (0x0A0A0A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "neon_electric_lime",
            name: "Electric Lime",
            category: .neon,
            gradientSpec: radialWithOpacity(.top, 450, [
                (0x0A0A0A, 1.0, 0.0),
                (0x39FF14, 0.7, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 5, opacity: 0.1)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "neon_hot_wire",
            name: "Hot Wire",
            category: .neon,
            gradientSpec: linear(135, [
                (0x0A0A0A, 0.0),
                (0xFF073A, 0.33),
                (0xFF6B35, 0.66),
                (0x0A0A0A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "neon_neon_duo",
            name: "Neon Duo",
            category: .neon,
            gradientSpec: radialWithOpacity(.center, 500, [
                (0xFF006E, 0.7, 0.0),
                (0x0A0A0A, 1.0, 0.5),
                (0x00F5FF, 0.7, 1.0),
            ], startRadius: 100),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "neon_ultraviolet",
            name: "Ultraviolet",
            category: .neon,
            gradientSpec: linear(200, [
                (0x0A0A0A, 0.0),
                (0x3A0CA3, 0.25),
                (0x7209B7, 0.5),
                (0xB5179E, 0.75),
                (0x0A0A0A, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 6, opacity: 0.1)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "neon_gold_rush",
            name: "Gold Rush",
            category: .neon,
            gradientSpec: radialWithOpacity(.bottom, 450, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFFD700, 0.7, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "neon_matrix",
            name: "Matrix",
            category: .neon,
            gradientSpec: linearWithOpacity(180, [
                (0x001A00, 1.0, 0.0),
                (0x00FF41, 0.3, 0.25),
                (0x003300, 1.0, 0.5),
                (0x00FF41, 0.15, 0.75),
                (0x001A00, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 5, opacity: 0.1)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "neon_hologram",
            name: "Hologram",
            category: .neon,
            gradientSpec: angularWithOpacity(.center, 360, [
                (0xFF006E, 1.0, 0.0),
                (0x00F5FF, 1.0, 0.25),
                (0x39FF14, 1.0, 0.5),
                (0xFFD700, 1.0, 0.75),
                (0xFF006E, 1.0, 1.0),
            ], specOpacity: 0.9),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 199
        ),
        // New neon wallpapers 11-20
        WallpaperDefinition(
            id: "neon_pink_lightning",
            name: "Pink Lightning",
            category: .neon,
            gradientSpec: linear(135, [(0x0A0A0A, 0.0), (0xFF1493, 0.5), (0x0A0A0A, 1.0)]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "neon_laser_blue",
            name: "Laser Blue",
            category: .neon,
            gradientSpec: radialWithOpacity(.center, 350, [
                (0x0A0A0A, 1.0, 0.0),
                (0x00BFFF, 0.6, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 4, opacity: 0.1)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "neon_toxic",
            name: "Toxic",
            category: .neon,
            gradientSpec: radialWithOpacity(.bottomTrailing, 450, [
                (0x0A0A0A, 1.0, 0.0),
                (0x7FFF00, 0.5, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "neon_magenta_burst",
            name: "Magenta Burst",
            category: .neon,
            gradientSpec: radialWithOpacity(.top, 400, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFF00FF, 0.6, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 6, opacity: 0.1)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "neon_signal_red",
            name: "Signal Red",
            category: .neon,
            gradientSpec: linearWithOpacity(180, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFF0000, 0.4, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "neon_phosphor",
            name: "Phosphor",
            category: .neon,
            gradientSpec: radialWithOpacity(.center, 500, [
                (0x0A0A0A, 1.0, 0.0),
                (0x00FF7F, 0.3, 0.33),
                (0x00FF7F, 0.5, 0.66),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "neon_dual_shock",
            name: "Dual Shock",
            category: .neon,
            gradientSpec: linearWithOpacity(135, [
                (0xFF006E, 0.7, 0.0),
                (0x0A0A0A, 1.0, 0.5),
                (0x00F5FF, 0.7, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 5, opacity: 0.1)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "neon_strobe",
            name: "Strobe",
            category: .neon,
            gradientSpec: linearWithOpacity(90, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFFFFFF, 0.15, 0.25),
                (0x0A0A0A, 1.0, 0.5),
                (0xFFFFFF, 0.1, 0.75),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "neon_reactor",
            name: "Reactor",
            category: .neon,
            gradientSpec: radialWithOpacity(.center, 300, [
                (0x0A0A0A, 1.0, 0.0),
                (0x00E5FF, 0.8, 0.5),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3), .noise(scale: 4, opacity: 0.1)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "neon_neon_sunset",
            name: "Neon Sunset",
            category: .neon,
            gradientSpec: linearWithOpacity(180, [
                (0x0A0A0A, 1.0, 0.0),
                (0xFF6B35, 0.5, 0.33),
                (0xFF006E, 0.5, 0.66),
                (0x0A0A0A, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .vignette(intensity: 1.3)],
            seed: 53
        ),
    ]

    // MARK: - Gradient

    private static let gradient: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "gradient_sunrise_silk",
            name: "Sunrise Silk",
            category: .gradient,
            gradientSpec: linear(135, [(0xFF9A9E, 0.0), (0xFAD0C4, 0.5), (0xFFF1EB, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "gradient_berry_smoothie",
            name: "Berry Smoothie",
            category: .gradient,
            gradientSpec: linear(160, [(0xA18CD1, 0.0), (0xFBC2EB, 0.5), (0xF5576C, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 6, opacity: 0.07)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "gradient_ocean_breeze",
            name: "Ocean Breeze",
            category: .gradient,
            gradientSpec: linear(180, [(0x667EEA, 0.0), (0x764BA2, 0.5), (0xF093FB, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "gradient_mojito",
            name: "Mojito",
            category: .gradient,
            gradientSpec: linear(135, [(0x11998E, 0.0), (0x38EF7D, 0.5), (0xA8FF78, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.06)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "gradient_peach_cobbler",
            name: "Peach Cobbler",
            category: .gradient,
            gradientSpec: mesh3x3(
                topLeft: 0xFFDEE9,
                topRight: 0xFCB69F,
                bottomLeft: 0xFF9A9E,
                bottomRight: 0xFAD0C4
            ),
            effects: [.grain(intensity: 0.03)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "gradient_arctic_ice",
            name: "Arctic Ice",
            category: .gradient,
            gradientSpec: linear(200, [
                (0xE0EAFC, 0.0),
                (0xCFDEF3, 0.33),
                (0xC3CFE2, 0.66),
                (0x667EEA, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 5, opacity: 0.08)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "gradient_mango_tango",
            name: "Mango Tango",
            category: .gradient,
            gradientSpec: linear(150, [
                (0xFFD700, 0.0),
                (0xFF8C00, 0.33),
                (0xFF6347, 0.66),
                (0xFF4500, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "gradient_twilight",
            name: "Twilight",
            category: .gradient,
            gradientSpec: linear(170, [
                (0x0F2027, 0.0),
                (0x203A43, 0.25),
                (0x2C5364, 0.5),
                (0x667EEA, 0.75),
                (0x764BA2, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 8, opacity: 0.05)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "gradient_cotton_candy",
            name: "Cotton Candy",
            category: .gradient,
            gradientSpec: mesh3x3(
                topLeft: 0xFBC2EB,
                topRight: 0xA6C1EE,
                bottomLeft: 0xFFDEE9,
                bottomRight: 0xC2E9FB
            ),
            effects: [.grain(intensity: 0.03)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "gradient_rainbow_road",
            name: "Rainbow Road",
            category: .gradient,
            gradientSpec: linear(135, [
                (0xFF0000, 0.0),
                (0xFF8C00, 0.2),
                (0xFFD700, 0.4),
                (0x00FF00, 0.6),
                (0x0000FF, 0.8),
                (0x8B00FF, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.06)],
            seed: 199
        ),
        // New gradient wallpapers 11-20
        WallpaperDefinition(
            id: "gradient_rose_gold",
            name: "Rose Gold",
            category: .gradient,
            gradientSpec: linear(135, [(0xB76E79, 0.0), (0xE8B4B8, 0.5), (0xEED5D2, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "gradient_lagoon_dream",
            name: "Lagoon Dream",
            category: .gradient,
            gradientSpec: linear(170, [(0x00B4DB, 0.0), (0x0083B0, 0.5), (0x005C7A, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 6, opacity: 0.08)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "gradient_candy_floss",
            name: "Candy Floss",
            category: .gradient,
            gradientSpec: linear(135, [(0xFBC2EB, 0.0), (0xA6C1EE, 0.5), (0xFBC2EB, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "gradient_emerald",
            name: "Emerald",
            category: .gradient,
            gradientSpec: linear(180, [
                (0x004D40, 0.0),
                (0x00695C, 0.33),
                (0x26A69A, 0.66),
                (0x80CBC4, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 5, opacity: 0.07)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "gradient_lavender_haze",
            name: "Lavender Haze",
            category: .gradient,
            gradientSpec: linear(160, [
                (0xE1BEE7, 0.0),
                (0xCE93D8, 0.33),
                (0xBA68C8, 0.66),
                (0xAB47BC, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "gradient_citrus",
            name: "Citrus",
            category: .gradient,
            gradientSpec: linear(135, [(0xFDD835, 0.0), (0xFF8F00, 0.5), (0xFF6D00, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 8, opacity: 0.05)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "gradient_sky_at_dawn",
            name: "Sky at Dawn",
            category: .gradient,
            gradientSpec: linear(180, [
                (0x1A237E, 0.0),
                (0x283593, 0.25),
                (0x5C6BC0, 0.5),
                (0x9FA8DA, 0.75),
                (0xE8EAF6, 1.0),
            ]),
            effects: [.grain(intensity: 0.03)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "gradient_coral_sunset",
            name: "Coral Sunset",
            category: .gradient,
            gradientSpec: linear(160, [
                (0xFF8A65, 0.0),
                (0xFF7043, 0.33),
                (0xF4511E, 0.66),
                (0xBF360C, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.1)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "gradient_mint_chip",
            name: "Mint Chip",
            category: .gradient,
            gradientSpec: mesh3x3(
                topLeft: 0xA7FFEB,
                topRight: 0xB9F6CA,
                bottomLeft: 0xE8F5E9,
                bottomRight: 0x80CBC4
            ),
            effects: [.grain(intensity: 0.03)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "gradient_velvet",
            name: "Velvet",
            category: .gradient,
            gradientSpec: linear(200, [
                (0x4A148C, 0.0),
                (0x6A1B9A, 0.33),
                (0x8E24AA, 0.66),
                (0xCE93D8, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .noise(scale: 6, opacity: 0.06)],
            seed: 53
        ),
    ]

    // MARK: - AMOLED

    private static let amoled: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "amoled_pure_black",
            name: "Pure Black",
            category: .amoled,
            gradientSpec: linear(180, [(0x000000, 0.0), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "amoled_blue_ember",
            name: "Blue Ember",
            category: .amoled,
            gradientSpec: radialWithOpacity(.bottom, 350, [
                (0x000000, 1.0, 0.0),
                (0x0D47A1, 0.3, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.8)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "amoled_red_pulse",
            name: "Red Pulse",
            category: .amoled,
            gradientSpec: radialWithOpacity(.center, 300, [
                (0x000000, 1.0, 0.0),
                (0xB71C1C, 0.25, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.5)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "amoled_green_glow",
            name: "Green Glow",
            category: .amoled,
            gradientSpec: radialWithOpacity(.top, 400, [
                (0x000000, 1.0, 0.0),
                (0x1B5E20, 0.3, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.7)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "amoled_purple_haze",
            name: "Purple Haze",
            category: .amoled,
            gradientSpec: radialWithOpacity(.bottomLeading, 400, [
                (0x000000, 1.0, 0.0),
                (0x4A148C, 0.3, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.6)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "amoled_gold_thread",
            name: "Gold Thread",
            category: .amoled,
            gradientSpec: linearWithOpacity(135, [
                (0x000000, 1.0, 0.0),
                (0xF9A825, 0.15, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.8)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "amoled_cyan_spark",
            name: "Cyan Spark",
            category: .amoled,
            gradientSpec: radialWithOpacity(.topTrailing, 350, [
                (0x000000, 1.0, 0.0),
                (0x006064, 0.35, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.7)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "amoled_crimson_edge",
            name: "Crimson Edge",
            category: .amoled,
            gradientSpec: linearWithOpacity(180, [
                (0x000000, 1.0, 0.0),
                (0x000000, 1.0, 0.33),
                (0x880E4F, 0.2, 0.66),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.5)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "amoled_midnight_blue",
            name: "Midnight Blue",
            category: .amoled,
            gradientSpec: linearWithOpacity(200, [
                (0x000000, 1.0, 0.0),
                (0x0D1B2A, 0.8, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.6)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "amoled_warm_noir",
            name: "Warm Noir",
            category: .amoled,
            gradientSpec: radialWithOpacity(.center, 450, [
                (0x000000, 1.0, 0.0),
                (0x3E2723, 0.25, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.5)],
            seed: 199
        ),
        WallpaperDefinition(
            id: "amoled_teal_whisper",
            name: "Teal Whisper",
            category: .amoled,
            gradientSpec: radialWithOpacity(.bottom, 400, [
                (0x000000, 1.0, 0.0),
                (0x004D40, 0.2, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.7)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "amoled_indigo_fade",
            name: "Indigo Fade",
            category: .amoled,
            gradientSpec: linearWithOpacity(170, [
                (0x000000, 1.0, 0.0),
                (0x1A237E, 0.3, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.6)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "amoled_amber_accent",
            name: "Amber Accent",
            category: .amoled,
            gradientSpec: radialWithOpacity(.topLeading, 350, [
                (0x000000, 1.0, 0.0),
                (0xFF6F00, 0.2, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.8)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "amoled_rose_bleed",
            name: "Rose Bleed",
            category: .amoled,
            gradientSpec: radialWithOpacity(.trailing, 400, [
                (0x000000, 1.0, 0.0),
                (0x880E4F, 0.25, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.6)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "amoled_void",
            name: "Void",
            category: .amoled,
            gradientSpec: linear(180, [(0x000000, 0.0), (0x050505, 0.5), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 2.0)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "amoled_electric_blue_edge",
            name: "Electric Blue Edge",
            category: .amoled,
            gradientSpec: linearWithOpacity(0, [
                (0x000000, 1.0, 0.0),
                (0x000000, 1.0, 0.33),
                (0x1565C0, 0.3, 0.66),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.7)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "amoled_magenta_whisper",
            name: "Magenta Whisper",
            category: .amoled,
            gradientSpec: radialWithOpacity(.center, 250, [
                (0x000000, 1.0, 0.0),
                (0xAD1457, 0.2, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.5)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "amoled_forest_noir",
            name: "Forest Noir",
            category: .amoled,
            gradientSpec: radialWithOpacity(.bottomLeading, 350, [
                (0x000000, 1.0, 0.0),
                (0x1B5E20, 0.15, 0.5),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.8)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "amoled_sunset_bleed",
            name: "Sunset Bleed",
            category: .amoled,
            gradientSpec: linearWithOpacity(180, [
                (0x000000, 1.0, 0.0),
                (0xBF360C, 0.15, 0.33),
                (0xF57F17, 0.1, 0.66),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.6)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "amoled_starless",
            name: "Starless",
            category: .amoled,
            gradientSpec: angularWithOpacity(.center, 360, [
                (0x000000, 1.0, 0.0),
                (0x0D1B2A, 0.3, 0.25),
                (0x000000, 1.0, 0.5),
                (0x1A0533, 0.3, 0.75),
                (0x000000, 1.0, 1.0),
            ]),
            effects: [.grain(intensity: 0.03), .vignette(intensity: 1.7)],
            seed: 53
        ),
    ]

    // MARK: - Geometric

    private static let geometric: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "geometric_crystal_lattice",
            name: "Crystal Lattice",
            category: .geometric,
            gradientSpec: linear(135, [(0xE8EAF6, 0.0), (0xC5CAE9, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 12, opacity: 0.35)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "geometric_honeycomb",
            name: "Honeycomb",
            category: .geometric,
            gradientSpec: linear(180, [(0xFFF8E1, 0.0), (0xFFE082, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 15, opacity: 0.3)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "geometric_shattered",
            name: "Shattered",
            category: .geometric,
            gradientSpec: linear(160, [(0x263238, 0.0), (0x37474F, 0.5), (0x455A64, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 10, opacity: 0.4)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "geometric_diamond_grid",
            name: "Diamond Grid",
            category: .geometric,
            gradientSpec: radial(.center, 500, [(0xE3F2FD, 0.0), (0x90CAF9, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 18, opacity: 0.25)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "geometric_stone_cells",
            name: "Stone Cells",
            category: .geometric,
            gradientSpec: linear(200, [(0xD7CCC8, 0.0), (0xBCAAA4, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 8, opacity: 0.45)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "geometric_frozen_web",
            name: "Frozen Web",
            category: .geometric,
            gradientSpec: linear(180, [(0xE0F7FA, 0.0), (0xB2EBF2, 0.5), (0x80DEEA, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 14, opacity: 0.3)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "geometric_lava_cracks",
            name: "Lava Cracks",
            category: .geometric,
            gradientSpec: linear(180, [(0x3E2723, 0.0), (0xBF360C, 0.5), (0xFF6F00, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 10, opacity: 0.5)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "geometric_ocean_tiles",
            name: "Ocean Tiles",
            category: .geometric,
            gradientSpec: linear(170, [(0x006064, 0.0), (0x00838F, 0.5), (0x0097A7, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 12, opacity: 0.35)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "geometric_neon_grid",
            name: "Neon Grid",
            category: .geometric,
            gradientSpec: linear(135, [(0x0A0A0A, 0.0), (0x1A1A2E, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 16, opacity: 0.4)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "geometric_rose_quartz",
            name: "Rose Quartz",
            category: .geometric,
            gradientSpec: linear(160, [(0xFCE4EC, 0.0), (0xF8BBD0, 0.5), (0xF48FB1, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 11, opacity: 0.25)],
            seed: 199
        ),
        WallpaperDefinition(
            id: "geometric_emerald_facets",
            name: "Emerald Facets",
            category: .geometric,
            gradientSpec: linear(180, [(0x1B5E20, 0.0), (0x2E7D32, 0.5), (0x4CAF50, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 13, opacity: 0.35)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "geometric_amethyst_cut",
            name: "Amethyst Cut",
            category: .geometric,
            gradientSpec: linear(135, [(0x4A148C, 0.0), (0x6A1B9A, 0.5), (0x9C27B0, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 10, opacity: 0.4)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "geometric_gold_mesh",
            name: "Gold Mesh",
            category: .geometric,
            gradientSpec: linear(145, [(0xF57F17, 0.0), (0xFFB300, 0.5), (0xFFD54F, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 15, opacity: 0.3)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "geometric_graphite",
            name: "Graphite",
            category: .geometric,
            gradientSpec: linear(180, [(0x212121, 0.0), (0x424242, 0.5), (0x616161, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 12, opacity: 0.35)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "geometric_sapphire_net",
            name: "Sapphire Net",
            category: .geometric,
            gradientSpec: linear(170, [(0x0D47A1, 0.0), (0x1565C0, 0.5), (0x1E88E5, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 14, opacity: 0.3)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "geometric_coral_grid",
            name: "Coral Grid",
            category: .geometric,
            gradientSpec: linear(135, [(0xBF360C, 0.0), (0xE64A19, 0.5), (0xFF7043, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 11, opacity: 0.35)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "geometric_mint_mosaic",
            name: "Mint Mosaic",
            category: .geometric,
            gradientSpec: linear(180, [(0x00695C, 0.0), (0x00897B, 0.5), (0x26A69A, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 13, opacity: 0.3)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "geometric_sunset_shards",
            name: "Sunset Shards",
            category: .geometric,
            gradientSpec: linear(160, [(0xFF6F00, 0.0), (0xFF8F00, 0.5), (0xFFC107, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 10, opacity: 0.4)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "geometric_arctic_grid",
            name: "Arctic Grid",
            category: .geometric,
            gradientSpec: linear(200, [(0xECEFF1, 0.0), (0xCFD8DC, 0.5), (0xB0BEC5, 1.0)]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 16, opacity: 0.25)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "geometric_plasma_net",
            name: "Plasma Net",
            category: .geometric,
            gradientSpec: angular(.center, 360, [
                (0xFF4081, 0.0),
                (0x7C4DFF, 0.33),
                (0x00BFA5, 0.66),
                (0xFF4081, 1.0),
            ]),
            effects: [.grain(intensity: 0.04), .voronoi(scale: 12, opacity: 0.35)],
            seed: 53
        ),
    ]

    // MARK: - Marble

    private static let marble: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "marble_white_marble",
            name: "White Marble",
            category: .marble,
            gradientSpec: linear(135, [(0xFAFAFA, 0.0), (0xE0E0E0, 0.5), (0xBDBDBD, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 3, opacity: 0.4)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "marble_black_marble",
            name: "Black Marble",
            category: .marble,
            gradientSpec: linear(180, [(0x1A1A1A, 0.0), (0x2C2C2C, 0.5), (0x1A1A1A, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 2.5, opacity: 0.45)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "marble_green_serpentine",
            name: "Green Serpentine",
            category: .marble,
            gradientSpec: linear(160, [(0x1B5E20, 0.0), (0x2E7D32, 0.5), (0x388E3C, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 3, opacity: 0.4)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "marble_rosa",
            name: "Rosa",
            category: .marble,
            gradientSpec: linear(135, [(0xF8BBD0, 0.0), (0xF48FB1, 0.5), (0xEC407A, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 2.5, opacity: 0.35)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "marble_travertine",
            name: "Travertine",
            category: .marble,
            gradientSpec: linear(180, [(0xD7CCC8, 0.0), (0xBCAAA4, 0.5), (0xA1887F, 1.0)]),
            effects: [.grain(intensity: 0.08), .noise(scale: 3, opacity: 0.5)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "marble_blue_sodalite",
            name: "Blue Sodalite",
            category: .marble,
            gradientSpec: linear(170, [(0x0D47A1, 0.0), (0x1565C0, 0.5), (0x42A5F5, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 2, opacity: 0.4)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "marble_onyx",
            name: "Onyx",
            category: .marble,
            gradientSpec: linear(135, [(0x000000, 0.0), (0x212121, 0.5), (0x000000, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 3, opacity: 0.35)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "marble_sandstone",
            name: "Sandstone",
            category: .marble,
            gradientSpec: linear(180, [
                (0x8D6E63, 0.0),
                (0xA1887F, 0.33),
                (0xBCAAA4, 0.66),
                (0xD7CCC8, 1.0),
            ]),
            effects: [.grain(intensity: 0.07), .noise(scale: 2.5, opacity: 0.4)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "marble_malachite",
            name: "Malachite",
            category: .marble,
            gradientSpec: angular(.center, 360, [
                (0x004D40, 0.0),
                (0x00695C, 0.33),
                (0x00897B, 0.66),
                (0x004D40, 1.0),
            ]),
            effects: [.grain(intensity: 0.06), .noise(scale: 2, opacity: 0.45)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "marble_cream_limestone",
            name: "Cream Limestone",
            category: .marble,
            gradientSpec: linear(160, [(0xFFF8E1, 0.0), (0xFFECB3, 0.5), (0xFFE082, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 3, opacity: 0.35)],
            seed: 199
        ),
        WallpaperDefinition(
            id: "marble_volcanic_ash",
            name: "Volcanic Ash",
            category: .marble,
            gradientSpec: linear(180, [(0x37474F, 0.0), (0x455A64, 0.5), (0x546E7A, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 2.5, opacity: 0.45)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "marble_rose_quartz",
            name: "Rose Quartz",
            category: .marble,
            gradientSpec: linear(135, [(0xFCE4EC, 0.0), (0xF8BBD0, 0.5), (0xF48FB1, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 3, opacity: 0.3)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "marble_granite",
            name: "Granite",
            category: .marble,
            gradientSpec: linear(170, [(0x616161, 0.0), (0x757575, 0.5), (0x9E9E9E, 1.0)]),
            effects: [.grain(intensity: 0.08), .noise(scale: 2, opacity: 0.5)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "marble_amber_stone",
            name: "Amber Stone",
            category: .marble,
            gradientSpec: linear(180, [(0xE65100, 0.0), (0xFF6D00, 0.5), (0xFF9100, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 3, opacity: 0.35)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "marble_ice_crystal",
            name: "Ice Crystal",
            category: .marble,
            gradientSpec: linear(200, [(0xE3F2FD, 0.0), (0xBBDEFB, 0.5), (0x90CAF9, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 2.5, opacity: 0.3)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "marble_jade",
            name: "Jade",
            category: .marble,
            gradientSpec: linear(160, [(0x004D40, 0.0), (0x00695C, 0.5), (0x26A69A, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 2, opacity: 0.4)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "marble_rust",
            name: "Rust",
            category: .marble,
            gradientSpec: linear(135, [(0xBF360C, 0.0), (0xD84315, 0.5), (0xE64A19, 1.0)]),
            effects: [.grain(intensity: 0.07), .noise(scale: 3, opacity: 0.45)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "marble_obsidian_flow",
            name: "Obsidian Flow",
            category: .marble,
            gradientSpec: linear(180, [
                (0x0A0A0A, 0.0),
                (0x1A1A1A, 0.33),
                (0x2C2C2C, 0.66),
                (0x1A1A1A, 1.0),
            ]),
            effects: [.grain(intensity: 0.08), .noise(scale: 2, opacity: 0.5)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "marble_marble_rose",
            name: "Marble Rose",
            category: .marble,
            gradientSpec: linear(145, [(0xFFFFFF, 0.0), (0xF8BBD0, 0.5), (0xFFFFFF, 1.0)]),
            effects: [.grain(intensity: 0.06), .noise(scale: 3, opacity: 0.35)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "marble_storm_cloud",
            name: "Storm Cloud",
            category: .marble,
            gradientSpec: linear(180, [
                (0x455A64, 0.0),
                (0x546E7A, 0.33),
                (0x78909C, 0.66),
                (0x546E7A, 1.0),
            ]),
            effects: [.grain(intensity: 0.07), .noise(scale: 2.5, opacity: 0.4)],
            seed: 53
        ),
    ]

    // MARK: - Pastel

    private static let pastel: [WallpaperDefinition] = [
        WallpaperDefinition(
            id: "pastel_lavender_dream",
            name: "Lavender Dream",
            category: .pastel,
            gradientSpec: linear(135, [(0xE1BEE7, 0.0), (0xF3E5F5, 0.5), (0xF8F0FC, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 8, opacity: 0.06)],
            seed: 0
        ),
        WallpaperDefinition(
            id: "pastel_baby_blue",
            name: "Baby Blue",
            category: .pastel,
            gradientSpec: linear(180, [(0xBBDEFB, 0.0), (0xE3F2FD, 0.5), (0xF5F9FF, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 42
        ),
        WallpaperDefinition(
            id: "pastel_peach_fuzz",
            name: "Peach Fuzz",
            category: .pastel,
            gradientSpec: linear(160, [(0xFFCCBC, 0.0), (0xFBE9E7, 0.5), (0xFFF3F0, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.05)],
            seed: 137
        ),
        WallpaperDefinition(
            id: "pastel_mint_dream",
            name: "Mint Dream",
            category: .pastel,
            gradientSpec: linear(170, [(0xB2DFDB, 0.0), (0xE0F2F1, 0.5), (0xF0FBF9, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 256
        ),
        WallpaperDefinition(
            id: "pastel_lemon_sorbet",
            name: "Lemon Sorbet",
            category: .pastel,
            gradientSpec: linear(135, [(0xFFF9C4, 0.0), (0xFFFDE7, 0.5), (0xFFFFF0, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 9, opacity: 0.05)],
            seed: 500
        ),
        WallpaperDefinition(
            id: "pastel_rose_water",
            name: "Rose Water",
            category: .pastel,
            gradientSpec: linear(180, [(0xF8BBD0, 0.0), (0xFCE4EC, 0.5), (0xFFF0F5, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 777
        ),
        WallpaperDefinition(
            id: "pastel_sky_pastel",
            name: "Sky Pastel",
            category: .pastel,
            gradientSpec: linear(200, [(0xB3E5FC, 0.0), (0xE1F5FE, 0.5), (0xF0FAFF, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 6, opacity: 0.06)],
            seed: 13
        ),
        WallpaperDefinition(
            id: "pastel_lilac",
            name: "Lilac",
            category: .pastel,
            gradientSpec: linear(145, [(0xD1C4E9, 0.0), (0xEDE7F6, 0.5), (0xF5F0FF, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 73
        ),
        WallpaperDefinition(
            id: "pastel_coral_soft",
            name: "Coral Soft",
            category: .pastel,
            gradientSpec: linear(160, [(0xFFAB91, 0.0), (0xFBE9E7, 0.5), (0xFFF5F2, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 10, opacity: 0.05)],
            seed: 101
        ),
        WallpaperDefinition(
            id: "pastel_spring_green",
            name: "Spring Green",
            category: .pastel,
            gradientSpec: linear(135, [(0xC8E6C9, 0.0), (0xE8F5E9, 0.5), (0xF5FFF5, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 199
        ),
        WallpaperDefinition(
            id: "pastel_cotton_candy",
            name: "Cotton Candy",
            category: .pastel,
            gradientSpec: linear(180, [(0xF8BBD0, 0.0), (0xE1BEE7, 0.5), (0xBBDEFB, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.06)],
            seed: 317
        ),
        WallpaperDefinition(
            id: "pastel_sunset_blush",
            name: "Sunset Blush",
            category: .pastel,
            gradientSpec: linear(160, [(0xFFCCBC, 0.0), (0xF8BBD0, 0.5), (0xE1BEE7, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 401
        ),
        WallpaperDefinition(
            id: "pastel_bubblegum",
            name: "Bubblegum",
            category: .pastel,
            gradientSpec: linear(135, [(0xF48FB1, 0.0), (0xCE93D8, 0.5), (0xB39DDB, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 8, opacity: 0.07)],
            seed: 503
        ),
        WallpaperDefinition(
            id: "pastel_seafoam",
            name: "Seafoam",
            category: .pastel,
            gradientSpec: linear(170, [(0xB2DFDB, 0.0), (0xB3E5FC, 0.5), (0xBBDEFB, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 607
        ),
        WallpaperDefinition(
            id: "pastel_apricot",
            name: "Apricot",
            category: .pastel,
            gradientSpec: linear(180, [(0xFFCC80, 0.0), (0xFFE0B2, 0.5), (0xFFF3E0, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 6, opacity: 0.08)],
            seed: 701
        ),
        WallpaperDefinition(
            id: "pastel_wisteria",
            name: "Wisteria",
            category: .pastel,
            gradientSpec: radial(.center, 500, [(0xF3E5F5, 0.0), (0xE1BEE7, 0.5), (0xF3E5F5, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 809
        ),
        WallpaperDefinition(
            id: "pastel_cloud_pink",
            name: "Cloud Pink",
            category: .pastel,
            gradientSpec: linear(145, [(0xFFF0F5, 0.0), (0xFCE4EC, 0.5), (0xFFF0F5, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 9, opacity: 0.05)],
            seed: 911
        ),
        WallpaperDefinition(
            id: "pastel_pistachio",
            name: "Pistachio",
            category: .pastel,
            gradientSpec: linear(180, [(0xDCEDC8, 0.0), (0xF1F8E9, 0.5), (0xFAFFF5, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 997
        ),
        WallpaperDefinition(
            id: "pastel_bluebell",
            name: "Bluebell",
            category: .pastel,
            gradientSpec: linear(160, [(0xC5CAE9, 0.0), (0xE8EAF6, 0.5), (0xF5F5FF, 1.0)]),
            effects: [.grain(intensity: 0.03), .noise(scale: 7, opacity: 0.06)],
            seed: 7
        ),
        WallpaperDefinition(
            id: "pastel_honey",
            name: "Honey",
            category: .pastel,
            gradientSpec: linear(135, [(0xFFE082, 0.0), (0xFFF8E1, 0.5), (0xFFFFF0, 1.0)]),
            effects: [.grain(intensity: 0.03)],
            seed: 53
        ),
    ]

    // MARK: - Helpers (Simple)

    /// Linear gradient from hex stops: (hex, location).
    private static func linear(_ angle: Double, _ stops: [(UInt, CGFloat)]) -> GradientSpec {
        GradientSpec(
            style: .linear(angle: angle),
            stops: stops.map { ColorStop(color: Color(hex: $0.0), location: $0.1) }
        )
    }

    /// Radial gradient with startRadius 0, from hex stops: (hex, location).
    private static func radial(_ center: UnitPoint, _ endRadius: CGFloat, _ stops: [(UInt, CGFloat)]) -> GradientSpec {
        GradientSpec(
            style: .radial(center: center, startRadius: 0, endRadius: endRadius),
            stops: stops.map { ColorStop(color: Color(hex: $0.0), location: $0.1) }
        )
    }

    /// Angular gradient with startAngle 0, from hex stops: (hex, location).
    private static func angular(_ center: UnitPoint, _ endAngle: Double, _ stops: [(UInt, CGFloat)]) -> GradientSpec {
        GradientSpec(
            style: .angular(center: center, startAngle: 0, endAngle: endAngle),
            stops: stops.map { ColorStop(color: Color(hex: $0.0), location: $0.1) }
        )
    }

    // MARK: - Helpers (Opacity Variants)

    /// Linear gradient where each stop carries its own opacity: (hex, opacity, location).
    private static func linearWithOpacity(_ angle: Double, _ stops: [(UInt, Double, CGFloat)]) -> GradientSpec {
        GradientSpec(
            style: .linear(angle: angle),
            stops: stops.map { ColorStop(color: Color(hex: $0.0, opacity: $0.1), location: $0.2) }
        )
    }

    /// Radial gradient where each stop carries its own opacity: (hex, opacity, location).
    private static func radialWithOpacity(
        _ center: UnitPoint,
        _ endRadius: CGFloat,
        _ stops: [(UInt, Double, CGFloat)],
        startRadius: CGFloat = 0
    ) -> GradientSpec {
        GradientSpec(
            style: .radial(center: center, startRadius: startRadius, endRadius: endRadius),
            stops: stops.map { ColorStop(color: Color(hex: $0.0, opacity: $0.1), location: $0.2) }
        )
    }

    /// Angular gradient where each stop carries its own opacity, with optional spec-level opacity.
    private static func angularWithOpacity(
        _ center: UnitPoint,
        _ endAngle: Double,
        _ stops: [(UInt, Double, CGFloat)],
        specOpacity: Double = 1.0
    ) -> GradientSpec {
        GradientSpec(
            style: .angular(center: center, startAngle: 0, endAngle: endAngle),
            stops: stops.map { ColorStop(color: Color(hex: $0.0, opacity: $0.1), location: $0.2) },
            opacity: specOpacity
        )
    }

    // MARK: - Helpers (Mesh)

    /// Creates a 3x3 mesh gradient from four corner colors, interpolating the 5 interior points.
    private static func mesh3x3(topLeft: UInt, topRight: UInt, bottomLeft: UInt, bottomRight: UInt) -> GradientSpec {
        let tl = topLeft
        let tr = topRight
        let bl = bottomLeft
        let br = bottomRight

        let topMid = blendHex(tl, tr)
        let bottomMid = blendHex(bl, br)
        let midLeft = blendHex(tl, bl)
        let midRight = blendHex(tr, br)
        let center = blendHex(blendHex(tl, br), blendHex(tr, bl))

        let points: [SIMD2<Float>] = [
            SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
            SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
            SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0),
        ]

        let colors: [Color] = [
            Color(hex: tl), Color(hex: topMid), Color(hex: tr),
            Color(hex: midLeft), Color(hex: center), Color(hex: midRight),
            Color(hex: bl), Color(hex: bottomMid), Color(hex: br),
        ]

        return GradientSpec(
            style: .mesh(width: 3, height: 3, points: points, colors: colors),
            stops: []
        )
    }

    /// Blends two hex colors by averaging their RGB channels.
    private static func blendHex(_ a: UInt, _ b: UInt) -> UInt {
        let rA = (a >> 16) & 0xFF
        let gA = (a >> 8) & 0xFF
        let bA = a & 0xFF

        let rB = (b >> 16) & 0xFF
        let gB = (b >> 8) & 0xFF
        let bB = b & 0xFF

        let r = (rA + rB) / 2
        let g = (gA + gB) / 2
        let blue = (bA + bB) / 2

        return (r << 16) | (g << 8) | blue
    }
}
