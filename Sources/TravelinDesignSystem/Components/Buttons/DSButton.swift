//
//  DSButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSButton
/// The standard and reusable Design System button.
///
/// Accepts a variant (primary, secondary, etc.) and a size (large, medium).
/// Can display text, icon, or both.
///
/// ```swift
/// // Text only
/// DSButton(title: "Book Now", variant: .primary, size: .large) { ... }
///
/// // Text with icon on the left
/// DSButton(title: "Book Now", icon: Image(systemName: "airplane"), variant: .primary) { ... }
///
/// // Text with icon on the right
/// DSButton(title: "Book Now", icon: Image(systemName: "arrow.right"), iconPosition: .trailing, variant: .primary) { ... }
///
/// // Icon only
/// DSButton(icon: Image(systemName: "heart"), variant: .ghost) { ... }
///
/// // Menu style with two icons
/// DSButton(title: "Edit profile", icon: Image(systemName: "person.circle"), trailingIcon: Image(systemName: "chevron.right"), variant: .transparent) { ... }
/// ```
@available(iOS 17.0, macOS 13.0, *)
public struct DSButton: View {
    private let title: String?
    private let icon: Image?
    private let iconPosition: IconPosition
    private let trailingIcon: Image?
    private let variant: DSButtonVariant
    private let size: DSButtonSize
    private let fullWidth: Bool
    private let fixedWidth: CGFloat?
    private let action: () -> Void
    
    public enum IconPosition {
        case leading
        case trailing
    }


    public init(
        title: String,
        icon: Image? = nil,
        iconPosition: IconPosition = .leading,
        trailingIcon: Image? = nil,
        variant: DSButtonVariant = .primary,
        size: DSButtonSize = .large,
        fullWidth: Bool = false,
        fixedWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.iconPosition = iconPosition
        self.trailingIcon = trailingIcon
        self.variant = variant
        self.size = size
        self.fullWidth = fullWidth
        self.fixedWidth = fixedWidth
        self.action = action
    }
    
    // Initializer for icon-only button
    public init(
        icon: Image,
        variant: DSButtonVariant = .primary,
        size: DSButtonSize = .large,
        fullWidth: Bool = false,
        fixedWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.title = nil
        self.icon = icon
        self.iconPosition = .leading
        self.trailingIcon = nil
        self.variant = variant
        self.size = size
        self.fullWidth = fullWidth
        self.fixedWidth = fixedWidth
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            buttonContent
        }
        .buttonStyle(DSButtonStyle(
            variant: self.variant,
            size: self.size,
            fullWidth: self.fullWidth,
            fixedWidth: self.fixedWidth
        ))
        .accessibility(label: Text(title ?? "Button"))
    }
    
    @ViewBuilder
    private var buttonContent: some View {
        if let trailingIcon = trailingIcon, let title = title, let icon = icon {
            // Left icon + Text + Right icon (menu style)
            HStack(spacing: 0) {
                icon.foregroundColor(iconColor)
                Spacer().frame(width: iconSpacing)
                Text(title)
                Spacer()
                trailingIcon.foregroundColor(iconColor)
            }
        } else if let title = title, let icon = icon {
            // Text with icon - Icon at left edge, text with spacing from icon
            HStack(spacing: 0) {
                if iconPosition == .leading {
                    icon.foregroundColor(iconColor)
                    Spacer().frame(width: iconSpacing)
                    Text(title)
                    Spacer()
                } else {
                    Spacer()
                    Text(title)
                    Spacer().frame(width: iconSpacing)
                    icon.foregroundColor(iconColor)
                }
            }
        } else if let title = title {
            // Text only
            Text(title)
        } else if let icon = icon {
            // Icon only
            icon.foregroundColor(iconColor)
        }
    }
    
    private var iconColor: Color {
        // Icon color based on button variant
        switch variant {
        case .transparent, .icon:
            return .black // Black for transparent and icon variants
        default:
            return Color(red: 0.14, green: 0.72, blue: 0.96) // Blue for other variants
        }
    }
    
    private var iconSpacing: CGFloat {
        switch size {
        case .large:
            return 8
        case .medium:
            return 8
        case .small:
            return 6
        case .compact:
            return 6
        case .menu:
            return 10
        }
    }
}
#endif
