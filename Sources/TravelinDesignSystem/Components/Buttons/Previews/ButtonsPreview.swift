//
//  ButtonsPreview.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

// MARK: - Preview (development only)
// This lets you see the buttons in Xcode without running the app.
#if canImport(SwiftUI)
import SwiftUI

#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("Buttons") {
    VStack(spacing: 20) {
        DSPrimaryButton(title: "Book Now") { }
    }
    .padding()
}
#endif

#endif
