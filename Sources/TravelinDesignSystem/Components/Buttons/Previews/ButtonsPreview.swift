//
//  ButtonsPreview.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("Buttons") {
    VStack(alignment: .leading, spacing: 30) {

        Text("Standard Buttons")
            .font(.headline)
        
        HStack(spacing: 17) {
            DSButton(title: "Book Now", variant: .primary, size: .large) { }
            DSButton(title: "Back", variant: .secondary, size: .large) { }
        }
        
        DSButton(title: "Back to home", variant: .ghost, size: .large, fixedWidth: 295) { }
        
        HStack(spacing: 17) {
            DSButton(
                title: "+100 Photos",
                variant: .dark,
                size: .compact,
                fixedWidth: 73
            ) { }
            
            DSButton(
                title: "See all +20 photos",
                variant: .outline,
                size: .compact,
                fixedWidth: 156
            ) { }
        }
        
        DSButton(
            title: "Oversea",
            icon: Image(systemName: "airplane"),
            variant: .ghost,
            size: .small,
            fixedWidth: 131
        ) { }
        
        DSButton(
            title: "Edit profile",
            icon: Image(systemName: "person.circle"),
            trailingIcon: Image(systemName: "chevron.right"),
            variant: .transparent,
            size: .menu,
            fixedWidth: 323
        ) { }
        
        HStack(spacing: 20) {
            DSFavoriteButton(isFavorite: .constant(false))
            DSFavoriteButton(isFavorite: .constant(true))
        }
        
        Text("Icon Buttons")
            .font(.headline)
        
        HStack(spacing: 20) {
            DSButton(
                icon: Image(systemName: "chevron.left"),
                variant: .icon,
                size: .medium
            ) { }
            
            DSButton(
                icon: Image(systemName: "chevron.right"),
                variant: .icon,
                size: .medium
            ) { }
        }
    }
    .padding()
    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
}
#endif
#endif
