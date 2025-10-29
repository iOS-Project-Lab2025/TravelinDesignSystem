//
//  SwiftUIView.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 29-10-25.
//

import SwiftUI

// MARK: - Protocol for DropDown Item

/// Protocol for DropDown Item
public protocol DropDownDisplayable: Identifiable, Hashable {
    associatedtype SelectedContent: View
    associatedtype ListContent: View

    /// View for the item selected
    @ViewBuilder
    func selectedView() -> SelectedContent

    /// View for items in the list
    @ViewBuilder
    func listView() -> ListContent
}

// MARK: - String implementation (backward compatibility)

extension String: @retroactive Identifiable {}
extension String: DropDownDisplayable {
    public var id: String { self }
    public func selectedView() -> some View { Text(self) }
    public func listView() -> some View { Text(self) }
}
