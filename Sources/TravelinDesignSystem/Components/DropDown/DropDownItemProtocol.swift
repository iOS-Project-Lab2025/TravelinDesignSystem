//
//  SwiftUIView.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 29-10-25.
//

import SwiftUI

// MARK: - Protocol for DropDown Item

/**
 A protocol that describes an item that can be displayed and selected in ``DSDropDown`` component.
 
 # Overview
 Conforming types provide two SwiftUI views:
 - A view rendered when the item is currently selected (shown in the dropdown's closed state).
 - A view rendered for each row in the dropdown list (shown when the menu is open).

 **DropDownDisplayable** conforms to **Identifiable** and **Hashable**, so each item can be uniquely tracked and used in ForEach..
 
# Example
 ```swift
 struct Country: DropDownDisplayable {
     public let id = UUID()
     public let name: String
     public let code: String
     public let flag: String

     public init(name: String, code: String, flag: String) {
         self.name = name
         self.code = code
         self.flag = flag
     }

     // View when the dropdown is closed
     public func selectedView() -> some View {
         HStack {
             Text(flag)
             Text(code)
         }
     }

     // View when the dropdown is opened
     public func listView() -> some View {
             Text("\(flag) (\(code))")
     }
 }
 */
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
