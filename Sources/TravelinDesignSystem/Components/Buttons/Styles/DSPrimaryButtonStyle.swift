//
//  DSPrimaryButtonStyle.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

// MARK: - Button style
/// `ButtonStyle` used with PrimaryCapsuleStyle to give the button its specific style
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 13.0, *)
public struct DSPrimaryButtonStyle: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor(isPressed: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        let base = Color(red: 0.0588, green: 0.6392, blue: 0.8863)
        let pressed = Color(red: 0.0, green: 0.58, blue: 0.82)
        return isPressed ? pressed : base
    }
}

#endif
