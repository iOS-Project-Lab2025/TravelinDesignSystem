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
    
    // MARK: - Modificadores
    
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
    
    // MARK: - Lógica de Tamaño (Tokens)
    
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
        }
    }
    
    private var fontWeight: Font.Weight {
        // Outline variant usa semibold, los demás medium
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
            return 17
        case .medium:
            return 12
        case .small:
            return 12
        case .compact:
            return 12
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large:
            return 20
        case .medium:
            return 20
        case .small:
            return 15
        case .compact:
            return 15
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large:
            return 15
        case .medium:
            return 15
        case .small:
            return 14
        case .compact:
            return 6
        }
    }

    // MARK: - Lógica de Estilo (Tokens)

    private func backgroundColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary:
            let base = Color(red: 0.06, green: 0.64, blue: 0.89) // Azul primario según specs
            let pressed = Color(red: 0.05, green: 0.58, blue: 0.82) // Estado pressed más oscuro
            return isPressed ? pressed : base
        case .secondary:
            let base = Color(red: 0.95, green: 0.95, blue: 0.95) // Gris claro según specs
            let pressed = Color(red: 0.85, green: 0.85, blue: 0.85) // Estado pressed más oscuro
            return isPressed ? pressed : base
        case .ghost:
            let pressed = Color(.sRGB, white: 0.95, opacity: 1)
            return isPressed ? pressed : .white
        case .outline:
            let pressed = Color(.sRGB, white: 0.95, opacity: 1)
            return isPressed ? pressed : .white
        case .dark:
            let base = Color(red: 0.32, green: 0.32, blue: 0.32, opacity: 0.8)
            let pressed = Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 0.8)
            return isPressed ? pressed : base
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary:
            return .white // #FFFFFF
        case .secondary:
            return Color(red: 0.47, green: 0.47, blue: 0.47) // Gris medio según specs
        case .ghost:
            return .black // #000000
        case .outline:
            return .black // #000000
        case .dark:
            return .white
        }
    }
    
    private func borderColor(isPressed: Bool) -> Color {
        switch variant {
        case .primary, .secondary, .dark, .ghost:
            return .clear
        case .outline:
            return .black
        }
    }
}
#endif
