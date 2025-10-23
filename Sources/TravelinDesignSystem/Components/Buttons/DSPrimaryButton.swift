//
//  DSPrimaryButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSPrimaryButton
/// The button from our Design System.
///
/// How to use it (example):
/// ```swift
/// DSPrimaryButton(title: "Next") {
///     // Put here what should happen when the button is tapped
/// }
/// ```
///
/// Notes:
/// - For now, colors are hardcoded.
/// - Later, we will switch to Design System tokens.
@available(iOS 17.0, macOS 13.0, *)
public struct DSPrimaryButton: View {
    private let title: String
    private let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.white)
                .padding(.vertical, 17)
                .padding(.horizontal, 20)
                .frame(width: 173.5, height: 52)
                .contentShape(Rectangle())
        }
        .buttonStyle(DSPrimaryButtonStyle())
        .accessibility(label: Text(title))
    }
}

#endif
