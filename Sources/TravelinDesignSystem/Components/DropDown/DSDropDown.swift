//
//  DSDropDown.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 27-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSDropDown
/**
A customizable dropdown component for the Travelin Design System.

**DSDropDown** allows the user to select an option from a list of displayable items.
The appearance can be customized through the nested `Configuration` type, and the
item structure defines what is shown when the dropdown is closed or opened.

- Generic Parameter: Item The type of items displayed by the dropdown. Must conform to
``DropDownDisplayable``.
 
For examples go to ``init(items:selectedItem:configuration:)``
 */
@available(iOS 17.0, macOS 13.0, *)
public struct DSDropDown<Item: DropDownDisplayable>: View {
    let items: [Item]
    @Binding var selectedItem: Item
    let configuration: Configuration

// MARK: - Custom style configuration
/// Configuration for styling the dropdown's visual appearance.
///
/// - Parameters:
///   - font: Font used for the text inside the dropdown.
///   - textColor: Color of the dropdown text and chevron.
///   - borderColor: Color of the dropdown border.
///   - borderWidth: Thickness of the border.
///   - cornerRadius: Corner radius of the dropdown container.
///   - verticalPadding: Vertical padding for the content inside.
///   - horizontalPadding: Horizontal padding for the content inside.
    public struct Configuration {
        var font: Font
        var textColor: Color
        var borderColor: Color
        var borderWidth: CGFloat
        var cornerRadius: CGFloat
        var verticalPadding: CGFloat
        var horizontalPadding: CGFloat

/// Creates a new configuration for customizing the dropdown’s appearance.
/// Each parameter has a predefined default value.
        public init(
            font: Font = DesignTokens.Typography.bodyLargeMedium,
            textColor: Color = DesignTokens.Colors.primaryText,
            borderColor: Color = DesignTokens.Colors.border,
            borderWidth: CGFloat = 1,
            cornerRadius: CGFloat = 15,
            verticalPadding: CGFloat = DesignTokens.Spacing.medium,
            horizontalPadding: CGFloat = DesignTokens.Spacing.medium
        ) {
            self.font = font
            self.textColor = textColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.cornerRadius = cornerRadius
            self.verticalPadding = verticalPadding
            self.horizontalPadding = horizontalPadding
        }

/// The default configuration used when none is provided.
        public static var `default`: Configuration {
            Configuration()
        }
    }

// MARK: - Initializer
/**
Creates a new dropdown with a list of selectable items.

 # Parameters
- items: The array of items to display in the dropdown menu.
- selectedItem: A binding to the currently selected item.
- configuration: The visual configuration. Defaults to ``Configuration/default``.


# Example
Example 1: Basic usage, Array of strings with default styling
```swift
DSDropDown(items: ["+569", "+343", "+423", "+122", "+579", "+560"], selectedItem: .constant("+569"))
```
Example 2: Items as Arrya of strings and custom styling
```swift
    DSDropDown(
     items: ["+569", "+343", "+423", "+122", "+579", "+560"],
     selectedItem: .constant("+569"),
     configuration: .init(
        font: DesignTokens.Typography.heading1,
        textColor: DesignTokens.Colors.error,
        borderColor: DesignTokens.Colors.error,
        )
    )
 ```
 
 Example 3: Custom item with custom views and default styling
 ```swift
 private struct DSDropDownCountryExample: View {
     @State private var selected = Country(name: "Chile", code: "+56", flag: "🇨🇱")

     let countries = [
         Country(name: "Chile", code: "+56", flag: "🇨🇱"),
         Country(name: "Argentina", code: "+54", flag: "🇦🇷"),
         Country(name: "Perú", code: "+51", flag: "🇵🇪"),
         Country(name: "Colombia", code: "+57", flag: "🇨🇴"),
         Country(name: "México", code: "+52", flag: "🇲🇽")
     ]

     var body: some View {
             DSDropDown(
                 items: countries,
                 selectedItem: $selected
             )
     }
 }
 ```
 */
    public init(
        items: [Item],
        selectedItem: Binding<Item>,
        configuration: Configuration = .default
    ) {
        self.items = items
        _selectedItem = selectedItem
        self.configuration = configuration
    }

// MARK: - Body
/// The visual representation of the dropdown component.
    public var body: some View {
        VStack {
            Menu {
                ForEach(items, id: \.self) { item in
                    Button(
                        action: { self.selectedItem = item },
                        label: { item.listView() }
                    )
                }

            } label: {
                HStack {
                    selectedItem.selectedView()
                        .font(configuration.font)
                        .foregroundColor(configuration.textColor)

                    Image(systemName: "chevron.down")
                        .foregroundColor(configuration.textColor)
                }
            }
            .padding(.vertical, configuration.verticalPadding)
            .padding(.horizontal, configuration.horizontalPadding)
            .overlay {
                RoundedRectangle(cornerRadius: configuration.cornerRadius)
                    .stroke(configuration.borderColor, lineWidth: configuration.borderWidth)
            }
        }
    }
}
#endif
