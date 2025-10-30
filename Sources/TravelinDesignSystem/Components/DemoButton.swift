//
//  SwiftUIView.swift
//  TravelinDesignSystem
//
//  Created by NASH on 24-10-25.
//

import SwiftUI

public struct DemoButton: View {
        let title: String
        let action: () -> Void

        public init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

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

#Preview {
    DemoButton("Test Button", action: {
        print("Button tapped!")
    })
    .padding()
}
