//
//  DSDropDown.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 27-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 13.0, *)
/// A customizable dropdown component for the Travelin Design System.
///
/// `DSDropDown` allows the user to select an option from a list of displayable items.
/// The appearance can be customized through the `Configuration` struct.
public struct DSDropDown<Item: DropDownDisplayable>: View {
    let items: [Item]
    @Binding var selectedItem: Item
    let configuration: Configuration

    //MARK: - Custom style configuration
    /// Configuration for styling DropDown aspect.
    public struct Configuration {
        var font: Font
        var textColor: Color
        var borderColor: Color
        var borderWidth: CGFloat
        var cornerRadius: CGFloat
        var verticalPadding: CGFloat
        var horizontalPadding: CGFloat
        
        /// Initializes a new configuration for the dropdown style.
        ///
        /// - Parameters:
        ///   - font: Font used for the text inside the dropdown.
        ///   - textColor: Color of the dropdown text and chevron.
        ///   - borderColor: Color of the dropdown border.
        ///   - borderWidth: Thickness of the border.
        ///   - cornerRadius: Corner radius of the dropdown container.
        ///   - verticalPadding: Vertical padding for the content inside.
        ///   - horizontalPadding: Horizontal padding for the content inside.
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


        /// Default configuration used when none is provided.
        public static var `default`: Configuration {
            Configuration()
        }
    }

    //MARK: - Initializer
    /// Creates a new dropdown with a list of selectable items.
    ///
    /// - Parameters:
    ///   - items: Array of items to display in the dropdown menu.
    ///   - selectedItem: Binding to the currently selected item.
    ///   - configuration: Optional visual configuration (defaults to `.default`).
    public init(
        items: [Item],
        selectedItem: Binding<Item>,
        configuration: Configuration = .default
    ) {
        self.items = items
        _selectedItem = selectedItem
        self.configuration = configuration
    }

    //MARK: - Body
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
                selectedItem.selectedView()
                    .font(configuration.font)
                    .foregroundColor(configuration.textColor)

                Image(systemName: "chevron.down")
                    .foregroundColor(configuration.textColor)
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
