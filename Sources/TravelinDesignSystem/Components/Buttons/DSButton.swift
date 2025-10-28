//
//  DSButton.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

// MARK: - DSButton
/// El botón estándar y reutilizable del Design System.
///
/// Acepta una variante (primary, secondary, etc.) y un tamaño (large, medium).
/// Puede mostrar texto, ícono o ambos.
///
/// ```swift
/// // Solo texto
/// DSButton(title: "Book Now", variant: .primary, size: .large) { ... }
///
/// // Texto con ícono a la izquierda
/// DSButton(title: "Book Now", icon: Image(systemName: "airplane"), variant: .primary) { ... }
///
/// // Texto con ícono a la derecha
/// DSButton(title: "Book Now", icon: Image(systemName: "arrow.right"), iconPosition: .trailing, variant: .primary) { ... }
///
/// // Solo ícono
/// DSButton(icon: Image(systemName: "heart"), variant: .ghost) { ... }
/// ```
@available(iOS 17.0, macOS 13.0, *)
public struct DSButton: View {
    private let title: String?
    private let icon: Image?
    private let iconPosition: IconPosition
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
        variant: DSButtonVariant = .primary,
        size: DSButtonSize = .large,
        fullWidth: Bool = false,
        fixedWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.iconPosition = iconPosition
        self.variant = variant
        self.size = size
        self.fullWidth = fullWidth
        self.fixedWidth = fixedWidth
        self.action = action
    }
    
    // Inicializador para botón solo con ícono
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
        if let title = title, let icon = icon {
            // Texto con ícono
            HStack(spacing: iconSpacing) {
                if iconPosition == .leading {
                    icon.foregroundColor(iconColor)
                    Text(title)
                } else {
                    Text(title)
                    icon.foregroundColor(iconColor)
                }
            }
        } else if let title = title {
            // Solo texto
            Text(title)
        } else if let icon = icon {
            // Solo ícono
            icon.foregroundColor(iconColor)
        }
    }
    
    private var iconColor: Color {
        // Color específico para el ícono del botón Oversea (y similares)
        return Color(red: 0.14, green: 0.72, blue: 0.96)
    }
    
    private var iconSpacing: CGFloat {
        switch size {
        case .large:
            return 8
        case .medium:
            return 8
        case .small:
            return 6
        }
    }
}
#endif
