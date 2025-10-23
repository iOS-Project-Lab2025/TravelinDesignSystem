#if canImport(SwiftUI)
import SwiftUI

// MARK: - ¿Qué es este archivo?
// Aquí definimos un botón reutilizable para nuestro Design System.
// Está hecho con SwiftUI.
// Es una sola variación: un botón azul, redondeado, con texto blanco.

// MARK: - DSPrimaryButton
/// El botón de nuestro Design System.
///
/// Cómo usarlo (ejemplo):
/// ```swift
/// DSPrimaryButton(title: "Next") {
///     // Aquí pones lo que pasa cuando tocas el botón
/// }
/// ```
///
/// Notas:
/// - Por ahora los colores están "hardcodeados" (escritos a mano).
/// - Más adelante, coordinamos para cambiar por "tokens" del Design System.
@available(iOS 17.0, macOS 13.0, *)
public struct DSPrimaryButton: View {
    private let title: String
    private let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.white)
                .padding(.vertical, 17)
                .padding(.horizontal, 20)
                .frame(width: 173.5, height: 52)
                .contentShape(Rectangle())
        }
        .buttonStyle(PrimaryCapsuleStyle())
        .accessibility(label: Text(title))
    }
}

// MARK: - Estilo del botón
/// `ButtonStyle` usado junto a PrimaryCapsuleStyle para darle estilo específico al botón
@available(iOS 17.0, macOS 13.0, *)
private struct PrimaryCapsuleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor(isPressed: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    private func backgroundColor(isPressed: Bool) -> Color {
        let base = Color(red: 0.0588, green: 0.6392, blue: 0.8863)
        let pressed = Color(red: 0.0, green: 0.58, blue: 0.82)
        return isPressed ? pressed : base
    }
}

// MARK: - Vista previa (solo en desarrollo)
// Esto sirve para ver el botón en Xcode sin correr la app.
#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("DSPrimaryButton") {
    VStack(spacing: 20) {
        DSPrimaryButton(title: "Book Now") { }
    }
    .padding()
}
#endif

#endif


