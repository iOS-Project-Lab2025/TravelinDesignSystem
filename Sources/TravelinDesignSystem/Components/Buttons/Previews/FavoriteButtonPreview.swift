//
//  FavoriteButtonPreview.swift
//  TravelinDesignSystem
//
//  Created by Daniel Retamal on 28-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

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
