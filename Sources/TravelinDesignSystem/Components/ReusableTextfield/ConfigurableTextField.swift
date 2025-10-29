//
//  ConfigurableTextField.swift
//  TestFormInput
//
//  Created by Rodolfo Gonzalez on 27-10-25.
//
import SwiftUI

// MARK: - Reusable Text Field Component

/// A highly configurable text field component with built-in styling and behavior options.
///
/// This view provides a comprehensive text input solution that combines keyboard configuration,
/// visual styling, secure input handling, and optional symbols. It encapsulates common text field
/// patterns into a single, reusable component.
///
/// ## Features
/// - Automatic keyboard type configuration based on input type
/// - Secure/visible password toggle functionality
/// - Optional leading or trailing search symbols
/// - Multiple visual style presets
/// - Support for labels and placeholders
/// - Configurable submit actions
///
/// ## Usage Example
/// ```swift
/// ConfigurableTextField(
/// placeHolder: "Enter your password",
/// type: .passwordLetters,
/// label: "Password",
/// style: .roundedGray,
/// text: $passwordLetters
/// ) {
/// focusedField = nil //.passwordLetter(pass focus to next Textfield )
/// }
/// .focused($focusedField, equals: .passwordLetter)
/// ```
///
/// - Note: Password fields automatically include a visibility toggle button.
/// - SeeAlso: `TextFieldType`, `TextFieldStyle`, `TextFieldConfig`
public struct ConfigurableTextField: View {
    // MARK: - Properties
    /// The position of an optional symbol (magnifying glass) relative to the text field.
    ///
    /// - `.left`: Symbol appears before the text input
    /// - `.right`: Symbol appears after the text input
    /// - `.none`: No symbol is displayed
    let symbolPosition: SymbolPosition
    /// The placeholder text displayed when the field is empty.
    ///
    /// Set to `nil` to display no placeholder text.
    let placeHolder: String?
    /// The input type that determines keyboard and behavior configuration.
    ///
    /// This type automatically configures keyboard layout, content type,
    /// capitalization, autocorrection, and submit button label.
    ///
    /// - SeeAlso: `TextFieldType`
    let type: TextFieldType
    /// An optional label displayed above the text field.
    ///
    /// When provided, appears as secondary text above the input field.
    /// Set to `nil` to omit the label.
    let label: String?
    /// The visual styling applied to the text field.
    ///
    /// Determines background color, borders, and corner radius.
    ///
    /// - SeeAlso: `TextFieldStyle`
    let style: TextFieldStyle
    /// Controls whether password-type fields display their content securely.
    ///
    /// When `true`, password fields show dots instead of characters.
    /// Automatically toggles when the user taps the eye/eye.slash button.
    ///
    /// - Note: Only affects `.passwordLetters` and `.passwordNumbersId` field types.
    @State private var isSecure = true
    /// A binding to the text field's current value.
    ///
    /// Updates bidirectionally as the user types or the value changes programmatically.
    @Binding var text: String
    /// An optional closure executed when the user submits the field.
    ///
    /// Triggered when:
    /// - The user taps the keyboard's submit button
    /// - The user taps the magnifying glass symbol (if present)
    ///
    /// Set to `nil` if no action should occur on submit.
    var onSubmit: (() -> Void)?
    /// The computed configuration based on the selected field type.
    ///
    /// Provides keyboard type, content type, capitalization, autocorrection,
    /// and submit label settings.
    ///
    /// - Returns: A `TextFieldConfig` instance matching the field type.
    private var config: TextFieldConfig {
        type.config
    }
    // MARK: - Initialization
    /// Creates a new configurable text field with the specified parameters.
    ///
    /// ## Parameter Descriptions
    /// Most parameters have default values to simplify common use cases.
    /// Only `type` and `text` are required.
    ///
    /// ## Usage Examples
    /// ```swift
    /// // Minimal email field
    /// ConfigurableTextField(
    ///     type: .email,
    ///     text: $email
    /// )
    ///
    /// // Search field with symbol
    /// ConfigurableTextField(
    ///     symbolPosition: .left,
    ///     placeHolder: "Search...",
    ///     type: .search,
    ///     text: $searchQuery,
    ///     onSubmit: { performSearch() }
    /// )
    ///
    /// // Password field with label
    /// ConfigurableTextField(
    ///     placeHolder: "Enter password",
    ///     type: .passwordLetters,
    ///     label: "Password",
    ///     style: .outlined,
    ///     text: $password
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - symbolPosition: Position of the magnifying glass symbol. Defaults to `.none`.
    ///   - placeHolder: Placeholder text when empty. Defaults to `nil`.
    ///   - type: The input type determining keyboard and behavior configuration.
    ///   - label: Optional label text displayed above the field. Defaults to `nil`.
    ///   - style: Visual styling preset. Defaults to `.default`.
    ///   - text: Binding to the text field's value.
    ///   - onSubmit: Optional closure called on submit. Defaults to `nil`.
    init(
        symbolPosition: SymbolPosition = .none,
        placeHolder: String? = nil,
        type: TextFieldType,
        label: String? = nil,
        style: TextFieldStyle = .default,
        text: Binding<String>,
        onSubmit: (() -> Void)? = nil
    ) {
        self.symbolPosition = symbolPosition
        self.placeHolder = placeHolder
        self.type = type
        self.label = label
        self.style = style
        self._text = text
        self.onSubmit = onSubmit
    }
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let label = label {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            style.apply(
                HStack {
                    Group {
                        if symbolPosition == .left {
                            Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .bold()
                                    .onTapGesture {
                                        onSubmit?()
                                    }
                        }
                        if isSecure && (self.type == .passwordLetters || self.type == .passwordNumbersId) {
                            SecureField(self.placeHolder ?? "", text: $text)
                                .keyboardType(config.keyboardType)
                                .textContentType(config.contentType)
                                .textInputAutocapitalization(config.textCapitalization)
                                .autocorrectionDisabled(!config.autocorrection)
                                .submitLabel(config.submitLabel)
                                .onSubmit {
                                    onSubmit?()
                                }
                        } else {
                            TextField(self.placeHolder ?? "", text: $text)
                                .keyboardType(config.keyboardType)
                                .textContentType(config.contentType)
                                .textInputAutocapitalization(config.textCapitalization)
                                .autocorrectionDisabled(!config.autocorrection)
                                .submitLabel(config.submitLabel)
                                .onSubmit {
                                    onSubmit?()
                                }
                        }
                        if self.type == .passwordNumbersId || self.type == .passwordLetters {
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: isSecure ? "eye" : "eye.slash")
                                    .foregroundColor(.secondary)
                            }
                        }
                        if symbolPosition == .right {
                            Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .bold()
                                    .onTapGesture {
                                        onSubmit?()
                                    }
                        }
                    }
                }
            )
        }
    }
}

#Preview {
    ZStack {
        Color.white
            .ignoresSafeArea()
        ConfigurableTextField(
            placeHolder: "Enter your phone",
            type: .phoneNumber,
            label: "Phone",
            style: .default,
            text: .constant("")
        )
        .padding()
    }
}
