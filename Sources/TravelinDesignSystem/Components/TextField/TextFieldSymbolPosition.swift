//
//  SymbolPosition.swift
//  TestFormInput
//
//  Created by Rodolfo Gonzalez on 28-10-25.
//

import Foundation

// MARK: - Symbol Position

/// Defines the placement of an optional symbol within a text field.
///
/// Used with `DSTextField` to add visual indicators (such as a magnifying glass)
/// before or after the text input area.
///
/// ## Usage Example
/// ```swift
/// DSTextField(
///     symbolPosition: .left,
///     type: .search,
///     text: $searchText
/// )
/// ```
///
/// - Note: Currently supports magnifying glass symbols for search functionality.
/// - SeeAlso: `DSTextField`
public enum SymbolPosition {
    /// Symbol appears on the left side, before the text input.
    ///
    /// Commonly used for search fields where the icon precedes the input area.
    case left
    /// Symbol appears on the right side, after the text input.
    ///
    /// Alternative placement for search icons or action buttons.
    case right
    /// No symbol is displayed.
    ///
    /// Default option for text fields that don't require visual indicators.
    case none
}
