#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 13.0, *)
public struct DSButtonStyle: ButtonStyle {
    let variant: DSButtonVariant
    let size: DSButtonSize
    let fullWidth: Bool
    let fixedWidth: CGFloat?

    // MARK: - Body
    public func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        
        frameModifier(configuration.label)
            .font(.custom("Poppins", size: fontSize).weight(fontWeight))
            .multilineTextAlignment(.center)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .foregroundColor(self.foregroundColor(isPressed: isPressed))
            .background(self.backgroundColor(isPressed: isPressed))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(self.borderColor(isPressed: isPressed), lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.15), value: isPressed)
    }
    
    // MARK: - Modifiers
    
    @ViewBuilder
    private func frameModifier(_ label: Configuration.Label) -> some View {
        if let fixedWidth = fixedWidth {
            label
                .frame(width: fixedWidth, alignment: .center)
        } else if fullWidth {
            label.frame(maxWidth: .infinity, alignment: .top)
        } else {
            label.frame(maxWidth: .infinity, alignment: .top)
        }
    }
    
    // MARK: - Size Tokens Logic
    
    private var fontSize: CGFloat {
        switch size {
        case .large:
            return 14
        case .medium:
            return 14
        case .small:
            return 12
        case .compact:
            return 12
        case .menu:
            return 15
        }
    }
    
    private var fontWeight: Font.Weight {
        // Outline variant uses semibold, others use medium
        switch variant {
        case .outline:
            return .semibold
        default:
            return .medium
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .large:
            return DesignTokens.Spacing.buttonVertical
        case .medium:
            return DesignTokens.Spacing.mediumSmall
        case .small:
            return DesignTokens.Spacing.mediumSmall
        case .compact:
            return DesignTokens.Spacing.mediumSmall
        case .menu:
            return DesignTokens.Spacing.buttonHorizontal
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large:
            return DesignTokens.Spacing.buttonHorizontal
        case .medium:
            return DesignTokens.Spacing.buttonHorizontal
        case .small:
            return DesignTokens.Spacing.buttonHorizontalSmall
        case .compact:
            return DesignTokens.Spacing.buttonHorizontal
        case .menu:
            return DesignTokens.Spacing.buttonHorizontalSmall
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large:
            return DesignTokens.CornerRadius.large
        case .medium:
            return DesignTokens.CornerRadius.large
        case .small:
            return DesignTokens.CornerRadius.mediumLarge
        case .compact:
            return DesignTokens.CornerRadius.medium
        case .menu:
            return DesignTokens.CornerRadius.large
        }
    }
    
    // MARK: - Style Tokens Logic

    private func backgroundColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary:
            return isPressed ? DesignTokens.Colors.primaryActionPressed : DesignTokens.Colors.primaryAction
        case .secondary:
            return isPressed ? DesignTokens.Colors.secondaryButtonBackgroundPressed : DesignTokens.Colors.secondaryButtonBackground
        case .ghost, .outline:
            return isPressed ? DesignTokens.Colors.lightBackgroundPressed : DesignTokens.Colors.primaryBackground
        case .transparent:
            let pressed = Color(.sRGB, white: 0.95, opacity: 0.5)
            return isPressed ? pressed : .clear
        case .dark:
            return isPressed ? DesignTokens.Colors.darkButtonBackgroundPressed : DesignTokens.Colors.darkButtonBackground
        case .icon:
            return isPressed ? DesignTokens.Colors.lightBorder : .clear
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary:
            return DesignTokens.Colors.textOnAction
        case .secondary:
            return DesignTokens.Colors.secondaryButtonText
        case .ghost:
            return DesignTokens.Colors.primaryText
        case .outline:
            return DesignTokens.Colors.primaryText
        case .transparent:
            return DesignTokens.Colors.primaryText
        case .dark:
            return DesignTokens.Colors.textOnAction
        case .icon:
            return DesignTokens.Colors.primaryText
        }
    }
    
    private func borderColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary, .secondary, .dark, .ghost, .icon:
            return .clear
        case .outline:
            return DesignTokens.Colors.primaryText
        case .transparent:
            return DesignTokens.Colors.lightBorder
        }
    }
}
#endif
