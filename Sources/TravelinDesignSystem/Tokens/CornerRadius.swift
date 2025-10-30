//
//  CornerRadius.swift
//  TravelinDesignSystem
//
//  Created by NASH on 23-10-25.
//

import CoreGraphics

public extension DesignTokens {

    enum CornerRadius {
        /// 6 pt (For tiny elements or specific sections)
        public static let medium: CGFloat = 6.0
        /// 14 pt (For small buttons like Oversea)
        public static let mediumLarge: CGFloat = 14.0
        /// 15 pt (Standard for buttons y principal cards, según Figma)
        public static let large: CGFloat = 15.0
        /// For creating circular elements
        public static let full: CGFloat = 9999.0
    }
    
}
