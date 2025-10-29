//
//  DSFavoriteButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Retamal on 27-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSFavoriteButton
/// Favorite button with toggle state (empty/filled heart).
///
/// ```swift
/// @State private var isFavorite = false
///
/// DSFavoriteButton(isFavorite: $isFavorite)
/// ```
@available(iOS 17.0, macOS 13.0, *)
public struct DSFavoriteButton: View {
    @Binding private var isFavorite: Bool
    
    public init(isFavorite: Binding<Bool>) {
        self._isFavorite = isFavorite
    }
    
    public var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isFavorite.toggle()
            }
        }) {
            ZStack {
                if isFavorite {
                    // Filled heart (red)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(
                            width: DesignTokens.Sizes.favoriteIconWidth,
                            height: DesignTokens.Sizes.favoriteIconHeight
                        )
                        .foregroundColor(DesignTokens.Colors.favoriteColor)
                } else {
                    // Empty heart (black outline)
                    Image(systemName: "heart")
                        .resizable()
                        .frame(
                            width: DesignTokens.Sizes.favoriteIconWidth,
                            height: DesignTokens.Sizes.favoriteIconHeight
                        )
                        .foregroundColor(DesignTokens.Colors.primaryText)
                }
            }
            .frame(
                width: DesignTokens.Sizes.favoriteButtonSize,
                height: DesignTokens.Sizes.favoriteButtonSize
            )
            .background(DesignTokens.Colors.primaryBackground)
            .clipShape(Circle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#endif
