//
//  DSButtonEnum.swift
//  TravelinDesignSystem
//
//  Created by Daniel Felipe Retamal Valenzuela on 23-10-25.
//

#if canImport(SwiftUI)
import SwiftUI

/// Defines the visual variant of the button
public enum DSButtonVariant {
    /// Blue background #0FA3E2, white text. (Book Now)
    case primary
    /// Gray background #F3F3F3, gray text #797979. (Back)
    case secondary
    /// White background, black text, no border. (Back to home)
    case ghost
    /// White background, black text, with black border. (See all +20 photos)
    case outline
    /// Transparent background, black text, with light gray border. (Edit profile)
    case transparent
    /// Dark gray background, white text. (+100 Photos)
    case dark
    /// Fully transparent background, black icon, no border. (Navigation icon buttons)
    case icon
}

/// Defines the size (height and padding) of the button
public enum DSButtonSize {
    /// 52px height, 15px radius, 17px vertical padding, 14px font.
    case large
    /// 42px height, 6px radius, 12px vertical padding.
    case medium
    /// Compact button, 14px radius, 12px vertical padding, 12px font. (Oversea)
    case small
    /// Very compact button, 6px radius, 12px vertical padding, 29px horizontal, 12px font. (+100 Photos)
    case compact
    /// Menu-style button, 15px radius, 20px vertical padding, 15px horizontal, 15px font. (Edit profile)
    case menu
}

#endif
