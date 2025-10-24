//
//  Colors.swift
//  TravelinDesignSystem
//
//  Created by NASH on 23-10-25.
//

import SwiftUI

public extension DesignTokens {
    
    enum Colors {
        // --- Brand / Action Colors ---
                
        /// The primary interactive color.
        /// (Loaded from Asset Catalog)
        public static let primaryAction: Color = Color("primaryAction", bundle: .module)
        
        /// The color for text placed on top of a `primaryAction` background.
        public static let textOnAction: Color = .white

        
        // --- Neutral Colors ---

        /// The primary background color for main views.
        public static let primaryBackground: Color = .white
        
        /// The main color for body text, headings.
        public static let primaryText: Color = .black
        
        /// A subdued color for subtitles, captions, or helper text.
        /// (Loaded from Asset Catalog)
        public static let secondaryText: Color = Color("secondaryText", bundle: .module)

        
        // --- Standard System Colors (Aliases) ---
        
        /// Pure white.
        public static let white: Color = .white
        
        /// Pure black.
        public static let black: Color = .black
        
        /// Alias for primaryAction.
        public static let primaryBlueSky: Color = Color("primaryAction", bundle: .module)
        
        /// Alias for secondaryText.
        public static let grey: Color = Color("secondaryText", bundle: .module)
    }
    
}
