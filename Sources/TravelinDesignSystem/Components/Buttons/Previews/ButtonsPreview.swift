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
        
        Divider().padding(.vertical,2)
        
        Text("Icon Buttons")
            .font(.headline)
        
        DSButton(
            title: "Oversea",
            icon: Image(systemName: "airplane"),
            style: .ghost,
            size: .small,
            fixedWidth: 131
        ) { }
    }
    .padding()
    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
}
#endif
#endif
