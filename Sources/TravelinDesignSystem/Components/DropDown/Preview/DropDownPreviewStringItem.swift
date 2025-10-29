//
//  DropDownPreview.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 27-10-25.
//

#if canImport(SwiftUI)
import SwiftUI
#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("Drop Down String Items") {
    VStack {
        DSDropDown(items: ["+569", "+343", "+423", "+122", "+579", "+560"], selectedItem: .constant("+569"))
    }
}
#endif
#endif
