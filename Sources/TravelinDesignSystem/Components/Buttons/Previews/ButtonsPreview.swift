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
    VStack(spacing: 30) {
        Text("Standard Buttons")
            .font(.headline)
        
        HStack(spacing: 17) {
            DSButton(title: "Book Now", style: .primary, size: .large) { }
            DSButton(title: "Back", style: .secondary, size: .large) { }
        }
        
        DSButton(title: "Back to home", style: .outline, size: .large, fullWidth: true) { }
        
        Divider().padding(.vertical, 10)
        
        Text("Medium Buttons (42px)")
            .font(.headline)
        
        HStack {
            DSButton(title: "+100 Photos", style: .dark, size: .medium) { }
            DSButton(title: "See all +20 photos", style: .outline, size: .large) { }
        }
    }
    .padding()
    .background(Color(.blue))
}
#endif
#endif
