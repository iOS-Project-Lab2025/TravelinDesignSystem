#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 13.0, *)
public struct DSConfigurableButtonStyle: ButtonStyle {
    let style: DSButtonStyle
    let size: DSButtonSize
    let fullWidth: Bool
    let fixedWidth: CGFloat?

    // MARK: - Body
    public func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        
        frameModifier(configuration.label)
            .font(.custom("Poppins", size: 14).weight(.medium))
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
    
    private var verticalPadding: CGFloat {
        return 17 // Todos usan 17px según specs
    }
    
    private var horizontalPadding: CGFloat {
        return 20 // Todos usan 20px según specs
    }
    
    private var cornerRadius: CGFloat {
        return 15 // Todos usan 15px según specs
    }

    // MARK: - Lógica de Estilo (Tokens)

    private func backgroundColor(isPressed: Bool) -> Color {
        switch style {
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
        case .dark:
            let base = Color(red: 0.32, green: 0.32, blue: 0.32, opacity: 0.8)
            let pressed = Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 0.8)
            return isPressed ? pressed : base
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        switch style {
        case .primary:
            return .white // #FFFFFF
        case .secondary:
            return Color(red: 0.47, green: 0.47, blue: 0.47) // Gris medio según specs
        case .ghost:
            return .black // #000000
        case .dark:
            return .white
        }
    }
    
    private func borderColor(isPressed: Bool) -> Color {
        switch style {
        case .primary, .secondary, .dark, .ghost:
            return .clear
        }
    }
}
#endif
