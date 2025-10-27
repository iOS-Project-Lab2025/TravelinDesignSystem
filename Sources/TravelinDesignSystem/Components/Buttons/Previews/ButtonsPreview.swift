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
            DSButton(title: "Book Now", style: .primary, size: .large) { }
            DSButton(title: "Back", style: .secondary, size: .large) { }
        }
        
        DSButton(title: "Back to home", style: .ghost, size: .large, fixedWidth: 295) { }
        
        Divider().padding(.vertical, 10)
        
        Text("Buttons with Icons")
            .font(.headline)
        
        HStack(spacing: 17) {
            // Texto con ícono a la izquierda
            DSButton(
                title: "Flight",
                icon: Image(systemName: "airplane"),
                style: .primary,
                size: .large
            ) { }
            
            // Texto con ícono a la derecha
            DSButton(
                title: "Next",
                icon: Image(systemName: "arrow.right"),
                iconPosition: .trailing,
                style: .secondary,
                size: .large
            ) { }
        }
        
        HStack(spacing: 17) {
            // Solo ícono
            DSButton(
                icon: Image(systemName: "heart.fill"),
                style: .ghost,
                size: .large
            ) { }
            
            DSButton(
                icon: Image(systemName: "star.fill"),
                style: .dark,
                size: .large
            ) { }
        }
    }
    .padding()
    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
}
#endif
#endif
