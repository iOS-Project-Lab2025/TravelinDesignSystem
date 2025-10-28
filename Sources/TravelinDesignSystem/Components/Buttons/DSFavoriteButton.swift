//
//  DSFavoriteButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Retamal on 27/10/25.
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
                        .frame(width: Tokens.iconWidth, height: Tokens.iconHeight)
                        .foregroundColor(Tokens.favoriteColor)
                } else {
                    // Empty heart (black outline)
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: Tokens.iconWidth, height: Tokens.iconHeight)
                        .foregroundColor(Tokens.defaultColor)
                }
            }
            .frame(width: Tokens.buttonSize, height: Tokens.buttonSize)
            .background(Tokens.backgroundColor)
            .clipShape(Circle())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Tokens
    private enum Tokens {
        // Sizes
        static let buttonSize: CGFloat = 36
        static let iconWidth: CGFloat = 17
        static let iconHeight: CGFloat = 15
        
        // Colors
        static let backgroundColor: Color = .white
        static let defaultColor: Color = .black
        static let favoriteColor: Color = Color(red: 1, green: 0.42, blue: 0.42)
    }
}

// MARK: - Preview
#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("Favorite Button") {
    VStack(spacing: 20) {
        Text("Favorite Button States")
            .font(.headline)
        
        HStack(spacing: 30) {
            VStack {
                DSFavoriteButton(isFavorite: .constant(false))
                Text("Empty")
                    .font(.caption)
            }
            
            VStack {
                DSFavoriteButton(isFavorite: .constant(true))
                Text("Filled")
                    .font(.caption)
            }
        }
        
        Divider().padding(.vertical, 10)
        
        Text("Interactive Example")
            .font(.headline)
        
        InteractiveFavoriteExample()
    }
    .padding()
    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
}

@available(iOS 17.0, macOS 13.0, *)
private struct InteractiveFavoriteExample: View {
    @State private var isFavorite = false
    
    var body: some View {
        VStack(spacing: 10) {
            DSFavoriteButton(isFavorite: $isFavorite)
            Text(isFavorite ? "Favorite ❤️" : "No favorite")
                .font(.caption)
        }
    }
}
#endif

#endif
