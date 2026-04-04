import SwiftUI

struct CategoryChipBar: View {
    @Binding var selected: WallpaperCategory?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Theme.paddingSm) {
                chipButton(label: "All", icon: "square.grid.2x2", isSelected: selected == nil) {
                    selected = nil
                }

                ForEach(WallpaperCategory.allCases) { category in
                    chipButton(
                        label: category.displayName,
                        icon: category.iconName,
                        isSelected: selected == category
                    ) {
                        selected = category
                    }
                }
            }
            .padding(.horizontal, Theme.paddingMd)
        }
    }

    private func chipButton(label: String, icon: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(label)
                    .font(.subheadline.weight(.medium))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Theme.accent : Theme.surface)
            .foregroundStyle(isSelected ? .white : Theme.textSecondary)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
