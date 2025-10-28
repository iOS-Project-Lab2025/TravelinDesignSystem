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

        Text("Buttons")
            .font(.title).fontWeight(.bold)
        
        Text("1) Text")
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
        
        Text("2) Text + Icon")
            .font(.headline)
        
        DSButton(
            title: "Oversea",
            icon: Image(systemName: "airplane"),
            variant: .ghost,
            size: .small,
            fixedWidth: 131
        ) { }
        
        Text("3) Icon + Text + Icon")
            .font(.headline)
        
        DSButton(
            title: "Edit profile",
            icon: Image(systemName: "person.circle"),
            trailingIcon: Image(systemName: "chevron.right"),
            variant: .transparent,
            size: .menu,
            fixedWidth: 323
        ) { }
        
        
        Text("4) Icon")
            .font(.headline)
        
        HStack(spacing: 20) {
            DSFavoriteButton(isFavorite: .constant(false))
            DSFavoriteButton(isFavorite: .constant(true))
            DSButton(
                icon: Image(systemName: "chevron.left"),
                variant: .icon,
                size: .medium
            ) { }
            DSButton(icon: Image(systemName: "chevron.right"), variant: .icon, size: .medium) {}
        }
        
    }
    .padding()
    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
}
#endif
#endif
