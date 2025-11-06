//
//  Typography.swift
//  TravelinDesignSystem
//
//  Created by NASH on 23-10-25.
//

import SwiftUI

public extension DesignTokens {
    
    enum Typography {
        // --- Headings ---
        /// 36pt, Bold. (Used for large screen titles)
        public static let heading1: Font = .system(size: 36, weight: .bold)
        
        /// 22pt, Bold. (Used for primary page headings)
        public static let heading2: Font = .system(size: 22, weight: .bold)
        
        // --- Titles ---
        /// 20pt, Semibold. (Used for subtitles or section titles)
        public static let title1: Font = .system(size: 20, weight: .semibold)
        
        /// 16pt, Semibold. (Used for card titles or list item titles)
        public static let title2: Font = .system(size: 16, weight: .semibold)
        
        // --- Body (Large) ---
        /// 14pt, Regular.
        public static let bodyLargeRegular: Font = .system(size: 14, weight: .regular)
        
        /// 14pt, Medium.
        public static let bodyLargeMedium: Font = .system(size: 14, weight: .medium)

        // --- Body (Small/Default) ---
        /// 12pt, Regular. (For default body text)
        public static let body: Font = .system(size: 12, weight: .regular)
        
        /// 12pt, Bold. (For emphasized body text)
        public static let bodyBold: Font = .system(size: 12, weight: .bold)
        
        // --- Other ---
        /// 12pt, Medium. (Used for links)
        public static let link: Font = .system(size: 12, weight: .medium)
        
        /// 15pt, Medium. (Used for menu buttons)
        public static let buttonMenu: Font = .system(size: 15, weight: .medium)
        
        /// 12pt, Semibold. (Used for outline buttons)
        public static let buttonOutline: Font = .system(size: 12, weight: .semibold)
    }
    
}
