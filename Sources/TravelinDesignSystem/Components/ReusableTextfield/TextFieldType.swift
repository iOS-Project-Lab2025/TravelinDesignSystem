//
//  TextFieldType.swift
//  TestFormInput
//
//  Created by Rodolfo Gonzalez on 27-10-25.
//

import SwiftUI

// MARK: - Text Field Types

/// Defines the available text field types with their corresponding keyboard and input configurations.
///
/// This enumeration provides preconfigured settings for common text input scenarios,
/// ensuring consistent behavior across the application. Each case returns a `TextFieldConfig`
/// with appropriate keyboard type, content type, capitalization, autocorrection, and submit label.
///
/// ## Usage Example
/// ```
/// ConfigurableTextField(
/// placeHolder: "Enter your first name",
/// type: .givenName,
/// label: "First name",
/// style: .roundedGray,
/// text: $firstName
/// ) {
/// focusedField = .lastName
/// }
/// .focused($focusedField, equals: .firstName)
/// ```
/// - Note: All configurations are optimized for iOS native input behavior.
/// - SeeAlso: `TextFieldConfig`
enum TextFieldType {
    /// Email address input configuration.
    ///
    /// Optimized for email entry with email keyboard layout and autocomplete support.
    /// - Keyboard: Email address keyboard with @ and . keys
    /// - Capitalization: None
    /// - Autocorrection: Disabled
    case email
    /// Numeric password or ID input configuration.
    ///
    /// Designed for numeric-only credentials such as PIN codes or numeric IDs.
    /// - Keyboard: Numeric keypad
    /// - Capitalization: None
    /// - Autocorrection: Disabled
    case passwordNumbersId
    /// Alphanumeric password input configuration.
    ///
    /// Configured for secure password entry with full keyboard access.
    /// - Keyboard: Default keyboard
    /// - Capitalization: None
    /// - Autocorrection: Disabled
    case passwordLetters
    /// Given name (first name) input configuration.
    ///
    /// Optimized for entering the user's first name with appropriate capitalization.
    /// - Keyboard: Default keyboard
    /// - Capitalization: Words (capitalizes first letter of each word)
    /// - Autocorrection: Disabled
    case givenName
    /// Family name (last name) input configuration.
    ///
    /// Optimized for entering the user's last name with appropriate capitalization.
    /// - Keyboard: Default keyboard
    /// - Capitalization: Words (capitalizes first letter of each word)
    /// - Autocorrection: Disabled
    case familyName
    /// Phone number input configuration.
    ///
    /// Designed for telephone number entry with numeric keypad.
    /// - Keyboard: Phone pad with numeric and special characters
    /// - Capitalization: None
    /// - Autocorrection: Disabled
    case phoneNumber
    /// Generic numeric input configuration.
    ///
    /// Used for general numeric input such as ages, years, or quantities.
    /// - Keyboard: Numeric keypad
    /// - Capitalization: None
    /// - Autocorrection: Disabled
    case number
    /// Search query input configuration.
    ///
    /// Optimized for search functionality with location-aware suggestions.
    /// - Keyboard: Default keyboard
    /// - Capitalization: Sentences (capitalizes first letter of sentences)
    /// - Autocorrection: Enabled
    case search
    /// Returns the text field configuration for the selected type.
    ///
    /// This computed property provides a complete `TextFieldConfig` instance
    /// with all necessary settings for the text field type.
    ///
    /// ## Implementation Details
    /// Each configuration includes:
    /// - Keyboard type optimized for the input
    /// - Content type for AutoFill and password management
    /// - Capitalization rules
    /// - Autocorrection preferences
    /// - Submit button label
    ///
    /// - Returns: A `TextFieldConfig` instance with the appropriate settings.
    var config: TextFieldConfig {
        switch self {
        case .email:
            return TextFieldConfig(
                keyboardType: .emailAddress,
                contentType: .emailAddress,
                textCapitalization: .never,
                autocorrection: false,
                submitLabel: .next
            )

        case .passwordNumbersId:
            return TextFieldConfig(
                keyboardType: .numberPad,
                contentType: .username,
                textCapitalization: .never,
                autocorrection: false,
                submitLabel: .done
            )

        case .passwordLetters:
            return TextFieldConfig(
                keyboardType: .default,
                contentType: .password,
                textCapitalization: .never,
                autocorrection: false,
                submitLabel: .done
            )

        case .givenName:
            return TextFieldConfig(
                keyboardType: .default,
                contentType: .givenName,
                textCapitalization: .words,
                autocorrection: false,
                submitLabel: .next
            )

        case .familyName:
            return TextFieldConfig(
                keyboardType: .default,
                contentType: .familyName,
                textCapitalization: .words,
                autocorrection: false,
                submitLabel: .next
            )

        case .phoneNumber:
            return TextFieldConfig(
                keyboardType: .phonePad,
                contentType: .telephoneNumber,
                textCapitalization: .never,
                autocorrection: false,
                submitLabel: .continue
            )

        case .number:
            return TextFieldConfig(
                keyboardType: .numberPad,
                contentType: .birthdateYear,
                textCapitalization: .never,
                autocorrection: false,
                submitLabel: .continue
            )

        case .search:
            return TextFieldConfig(
                keyboardType: .default,
                contentType: .location,
                textCapitalization: .sentences,
                autocorrection: true,
                submitLabel: .search
            )
        }
    }
}
