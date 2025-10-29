//
//  TextFieldStyle.swift
//  TestFormInput
//
//  Created by Rodolfo Gonzalez on 27-10-25.
//

import SwiftUI

// MARK: - Text Field Styles

/// Defines visual styling options for text fields throughout the application.
///
/// This enumeration provides consistent, reusable styling patterns for text input fields.
/// Each style includes predefined padding, background colors, corner radius, and borders
/// to maintain a cohesive design language.
///
/// ## Usage Example
/// ```swift
/// TextFieldStyle.roundedGray.apply(
///     TextField("Enter text", text: $text)
/// )
/// ```
///
/// ## Available Styles
/// - Use `.default` for primary input fields with white backgrounds
/// - Use `.roundedGray` for secondary inputs with subtle gray backgrounds
/// - Use `.outlined` for emphasized fields requiring clear visual boundaries
///
/// - Note: All styles include a corner radius of 12 points for consistency.
/// - SeeAlso: `TextFieldType` for keyboard and input configurations
enum TextFieldStyle {    /// Standard white background style.
    ///
    /// A clean, minimal style with white background and rounded corners.
    /// Ideal for primary text fields on colored or image backgrounds.
    ///
    /// **Visual Characteristics:**
    /// - Background: White
    /// - Corner radius: 12pt
    /// - Border: None
    case `default`
    /// Subtle gray background style.
    ///
    /// A low-contrast style using the system gray background color.
    /// Best suited for secondary inputs or forms on white backgrounds.
    ///
    /// **Visual Characteristics:**
    /// - Background: System gray (.systemGray6)
    /// - Corner radius: 12pt
    /// - Border: None
    case outlined
    /// Applies the selected style to the provided content view.
    ///
    /// This method wraps the given content with the appropriate styling modifiers,
    /// including padding, background color, corner radius, and optional borders.
    ///
    /// ## Implementation Details
    /// The method uses SwiftUI's `@ViewBuilder` to dynamically construct the styled view
    /// based on the selected case. All styles include consistent padding and corner radius
    /// for visual uniformity.
    ///
    /// ## Usage Example
    /// ```
    /// style.apply(
    /// HStack {
    /// Content: View
    /// }
    /// )
    /// ```
    ///
    /// - Parameter content: The view to be styled, typically a `TextField` or `SecureField`.
    /// - Returns: A styled view with the applied visual modifications.
    ///
    /// - Note: The `@ViewBuilder` attribute allows this method to return different view types
    ///   while maintaining type safety.
    @ViewBuilder
    func apply<Content: View>(_ content: Content) -> some View {
        switch self {
        case .default:
            content
                .padding()
                .background(DesignTokens.Colors.primaryBackground)
                .cornerRadius(DesignTokens.CornerRadius.large)

        case .outlined:
            content
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: DesignTokens.CornerRadius.large)
                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                )
                .cornerRadius(DesignTokens.CornerRadius.large)
        }
    }
}
