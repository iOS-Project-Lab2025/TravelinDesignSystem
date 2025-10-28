//
//  DSButtonEnum.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

/// Define el estilo visual del botón
public enum DSButtonStyle {
    /// Fondo azul #0FA3E2, texto blanco. (Book Now)
    case primary
    /// Fondo gris #F3F3F3, texto gris #797979. (Back)
    case secondary
    /// Fondo blanco, texto negro, sin borde. (Back to home)
    case ghost
    /// Fondo gris oscuro, texto blanco. (+100 Photos)
    case dark
}

/// Define el tamaño (altura y padding) del botón
public enum DSButtonSize {
    /// 52px de altura, 15px radius, 17px padding vertical, 14px font.
    case large
    /// 42px de altura, 6px radius, 12px padding vertical.
    case medium
    /// Botón compacto, 14px radius, 12px padding vertical, 12px font. (Oversea)
    case small
}

#endif
