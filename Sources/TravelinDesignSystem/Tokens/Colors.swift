//
//  Colors.swift
//  TravelinDesignSystem
//
//  Created by NASH on 23-10-25.
//

import SwiftUI

public extension DesignTokens {
    
    enum Colors {
        
        // --- Brand / Action ---
        
        /// The primary interactive color for buttons and main actions.
        public static let primaryAction: Color = Color("primaryAction", bundle: .module)
        
        /// The secondary interactive color for less prominent actions (e.g., secondary buttons).
        public static let secondaryAction: Color = Color("secondaryAction", bundle: .module)
        
        /// A color for text and icons placed on top of a `primaryAction` background.
        public static let textOnAction: Color = Color("textOnAction", bundle: .module)

        // --- Text ---
        
        /// The main color for body text, headings.
        public static let primaryText: Color = Color("primaryText", bundle: .module)
        
        /// A subdued color for subtitles, captions, or helper text.
        public static let secondaryText: Color = Color("secondaryText", bundle: .module)
        
        /// The lightest text color, often for placeholders or disabled text.
        public static let tertiaryText: Color = Color("tertiaryText", bundle: .module)
        
        /// The color for tappable link text.
        public static let linkText: Color = Color("linkText", bundle: .module)
        
        // --- Backgrounds / Surfaces ---
        
        public static let primaryBackground: Color = Color("primaryBackground", bundle: .module)
        
        public static let secondaryBackground: Color = Color("secondaryBackground", bundle: .module)
        
        public static let tertiaryBackground: Color = Color("tertiaryBackground", bundle: .module)
        
        // --- UI / Borders ---

        public static let border: Color = Color("border", bundle: .module)
        
        public static let separator: Color = Color("separator", bundle: .module)

        
        // --- Semantic / Status ---
        
        public static let success: Color = Color("success", bundle: .module)
        
        public static let warning: Color = Color("warning", bundle: .module)
        
        public static let error: Color = Color("error", bundle: .module)
        
        public static let info: Color = Color("info", bundle: .module)
        
        // --- Button Specific Colors ---
        
        /// Secondary button background color (Light gray #F3F3F3)
        public static let secondaryButtonBackground: Color = Color("secondaryButtonBackground", bundle: .module)
        
        /// Secondary button text color (Medium gray #797979)
        public static let secondaryButtonText: Color = Color("secondaryButtonText", bundle: .module)
        
        /// Dark button background (Gray with opacity)
        public static let darkButtonBackground: Color = Color("darkButtonBackground", bundle: .module)
        
        /// Favorite/Heart fill color (Red/Pink)
        public static let favoriteColor: Color = Color("favoriteColor", bundle: .module)
        
        /// Icon color for buttons (Light blue)
        public static let iconColor: Color = Color("iconColor", bundle: .module)
        
        /// Light border color for transparent buttons
        public static let lightBorder: Color = Color("lightBorder", bundle: .module)
        
        // --- Button Pressed States ---
        
        /// Primary button pressed state (Darker blue)
        public static let primaryActionPressed: Color = Color("primaryActionPressed", bundle: .module)
        
        /// Secondary button pressed state (Darker gray)
        public static let secondaryButtonBackgroundPressed: Color = Color("secondaryButtonBackgroundPressed", bundle: .module)
        
        /// Light background pressed state (Light gray for ghost/outline buttons)
        public static let lightBackgroundPressed: Color = Color("lightBackgroundPressed", bundle: .module)
        
        /// Dark button pressed state (Darker gray with opacity)
        public static let darkButtonBackgroundPressed: Color = Color("darkButtonBackgroundPressed", bundle: .module)
    }
    
}
