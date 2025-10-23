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
/// Acepta un estilo (primary, secondary, etc.) y un tamaño (large, medium).
///
/// ```swift
/// DSButton(
///     title: "Book Now",
///     style: .primary,
///     size: .large,
///     fullWidth: false
/// ) { ... }
/// ```
@available(iOS 17.0, macOS 13.0, *)
public struct DSButton: View {
    private let title: String
    private let style: DSButtonStyle
    private let size: DSButtonSize
    private let fullWidth: Bool
    private let action: () -> Void

    public init(
        title: String,
        style: DSButtonStyle = .primary,
        size: DSButtonSize = .large,
        fullWidth: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.fullWidth = fullWidth
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(DSConfigurableButtonStyle(
            style: self.style,
            size: self.size,
            fullWidth: self.fullWidth
        ))
        .accessibility(label: Text(title))
    }
}
#endif
