//
//  SwiftUIView.swift
//  TravelinDesignSystem
//
//  Created by NASH on 24-10-25.
//

import SwiftUI

public struct DSButton: View {
    
    // Propiedades básicas
        let title: String
        let action: () -> Void
        
        // Inicializador PÚBLICO
        public init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }
        
        // 2. El cuerpo PÚBLICO
        public var body: some View {
            Button(title, action: action)
                .font(DesignTokens.Typography.bodyLargeMedium)
                .padding()
                .frame(maxWidth: .infinity)
                .background(DesignTokens.Colors.primaryAction)
                .foregroundColor(DesignTokens.Colors.textOnAction)
                .clipShape(RoundedRectangle(cornerRadius: DesignTokens.CornerRadius.medium))
        }
}

// 4. EL PREVIEW (ARREGLADO)
// Esto te permite ver tu botón en el canvas de Xcode
#Preview {
    DSButton("Test Button", action: {
        print("Button tapped!")
    })
    .padding() // Añade padding al preview para que se vea mejor
    .background(Color.gray.opacity(0.1)) // Un fondo para el preview
}
