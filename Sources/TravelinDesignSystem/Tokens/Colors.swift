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
    }
    
}
