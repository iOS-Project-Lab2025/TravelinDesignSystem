//
//  DSDropDown.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 27-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 13.0, *)
public struct DSDropDown: View {
    let items: [String]
    @Binding var selectedItem: String
    let configuration: Configuration
    
    public struct Configuration {
        var font: Font
        var textColor: Color
        var borderColor: Color
        var borderWidth: CGFloat
        var cornerRadius: CGFloat
        var verticalPadding: CGFloat
        var horizontalPadding: CGFloat
        
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
        
        public static var `default`: Configuration {
            Configuration()
        }
    }
    
    public init(
        items: [String],
        selectedItem: Binding<String>,
        configuration: Configuration = .default
    ) {
        self.items = items
        _selectedItem = selectedItem
        self.configuration = configuration
    }
    
    public var body: some View {
        VStack {
            Menu {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        self.selectedItem = item
                    }){
                        Text(item)
                    }
                }

            } label: {
                Text(selectedItem)
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
