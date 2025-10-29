//
//  TextFieldConfig.swift
//  TestFormInput
//
//  Created by Rodolfo Gonzalez on 27-10-25.
//

import SwiftUI

// MARK: - Text Field Configuration

/// A configuration entity that encapsulates all input behavior settings for text fields.
///
/// This structure provides a centralized way to define keyboard type, content type,
/// capitalization rules, autocorrection preferences, and submit button labels for text input fields.
/// It promotes consistency and reusability across the application's form elements.
///
/// ## Usage Example
/// ```swift
/// let emailConfig = TextFieldConfig(
///     keyboardType: .emailAddress,
///     contentType: .emailAddress,
///     textCapitalization: .never,
///     autocorrection: false,
///     submitLabel: .next
/// )
///
/// TextField("Email", text: $email)
///     .keyboardType(emailConfig.keyboardType)
///     .textContentType(emailConfig.contentType)
///     .textInputAutocapitalization(emailConfig.textCapitalization)
///     .autocorrectionDisabled(!emailConfig.autocorrection)
///     .submitLabel(emailConfig.submitLabel)
/// ```
///
/// ## Design Pattern
/// This configuration struct is typically used in conjunction with `TextFieldType` enum,
/// which provides preconfigured instances for common input scenarios.
///
/// - Note: All properties are immutable to ensure configuration consistency.
/// - SeeAlso: `TextFieldType`
struct TextFieldConfig {
    
    // MARK: - Properties
    
    /// The keyboard type to display for text input.
    ///
    /// Determines which keyboard layout appears when the text field becomes active.
    /// Common values include `.default`, `.emailAddress`, `.numberPad`, and `.phonePad`.
    ///
    /// - SeeAlso: `UIKeyboardType`
    let keyboardType: UIKeyboardType
    
    /// The semantic meaning of the text input content.
    ///
    /// Enables AutoFill, password management, and predictive text features by indicating
    /// the type of information expected (e.g., email, password, name).
    ///
    /// Set to `nil` when no specific content type applies.
    ///
    /// - SeeAlso: `UITextContentType`
    let contentType: UITextContentType?
    
    /// The automatic capitalization behavior for text input.
    ///
    /// Controls when and how text is automatically capitalized:
    /// - `.never`: No automatic capitalization
    /// - `.words`: Capitalizes the first letter of each word
    /// - `.sentences`: Capitalizes the first letter of each sentence
    /// - `.characters`: Capitalizes all characters
    ///
    /// - SeeAlso: `TextInputAutocapitalization`
    let textCapitalization: TextInputAutocapitalization
    
    /// Indicates whether autocorrection should be enabled.
    ///
    /// When `true`, the system suggests corrections and replacements as the user types.
    /// When `false`, autocorrection is disabled for precise input (e.g., passwords, codes).
    let autocorrection: Bool
    
    /// The label displayed on the keyboard's return/submit button.
    ///
    /// Provides contextual feedback about what happens when the user taps the return key.
    /// Common values include `.done`, `.next`, `.search`, and `.continue`.
    ///
    /// - SeeAlso: `SubmitLabel`
    let submitLabel: SubmitLabel
    
    // MARK: - Initialization
    
    /// Creates a new text field configuration with the specified input behavior settings.
    ///
    /// All parameters have sensible defaults suitable for general text input.
    /// Override specific parameters to customize behavior for specialized input scenarios.
    ///
    /// ## Default Values
    /// - `keyboardType`: `.default` - Standard QWERTY keyboard
    /// - `contentType`: `nil` - No specific content type
    /// - `textCapitalization`: `.sentences` - Capitalize first letter of sentences
    /// - `autocorrection`: `true` - Autocorrection enabled
    /// - `submitLabel`: `.done` - "Done" button label
    ///
    /// ## Usage Examples
    /// ```swift
    /// // Using all defaults
    /// let defaultConfig = TextFieldConfig()
    ///
    /// // Customizing for email input
    /// let emailConfig = TextFieldConfig(
    ///     keyboardType: .emailAddress,
    ///     contentType: .emailAddress,
    ///     textCapitalization: .never,
    ///     autocorrection: false
    /// )
    ///
    /// // Customizing for search
    /// let searchConfig = TextFieldConfig(
    ///     submitLabel: .search
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - keyboardType: The type of keyboard to display. Defaults to `.default`.
    ///   - contentType: The semantic content type for AutoFill support. Defaults to `nil`.
    ///   - textCapitalization: The automatic capitalization behavior. Defaults to `.sentences`.
    ///   - autocorrection: Whether to enable autocorrection. Defaults to `true`.
    ///   - submitLabel: The label for the keyboard's submit button. Defaults to `.done`.
    init(
        keyboardType: UIKeyboardType = .default,
        contentType: UITextContentType? = nil,
        textCapitalization: TextInputAutocapitalization = .sentences,
        autocorrection: Bool = true,
        submitLabel: SubmitLabel = .done
    ) {
        self.keyboardType = keyboardType
        self.contentType = contentType
        self.textCapitalization = textCapitalization
        self.autocorrection = autocorrection
        self.submitLabel = submitLabel
    }
}
