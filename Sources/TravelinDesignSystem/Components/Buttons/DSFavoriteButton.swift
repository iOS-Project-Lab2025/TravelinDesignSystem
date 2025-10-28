//
//  DSFavoriteButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Retamal on 27/10/25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSFavoriteButton
/// Botón de favorito con estado toggle (corazón vacío/lleno).
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
                    // Corazón lleno (rojo)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 17, height: 15)
                        .foregroundColor(Color(red: 1, green: 0.42, blue: 0.42))
                } else {
                    // Corazón vacío (negro outline)
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 17, height: 15)
                        .foregroundColor(.black)
                }
            }
            .frame(width: 36, height: 36)
            .background(.white)
            .clipShape(Circle())
        }
        .buttonStyle(PlainButtonStyle())
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
