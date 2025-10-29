//
//  SwiftUIView.swift
//  TravelinDesignSystem
//
//  Created by Ivan Pereira on 29-10-25.
//

#if canImport(SwiftUI)
import SwiftUI
#if DEBUG
@available(iOS 17.0, macOS 13.0, *)

// MARK: - Example: Country with code and flag
public struct Country: DropDownDisplayable {
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
            Text("\(name) (\(code))")
    }
}

struct DSDropDownCountryExample: View {
    @State private var selected = Country(name: "Chile", code: "+56", flag: "🇨🇱")

    let countries = [
        Country(name: "Chile", code: "+56", flag: "🇨🇱"),
        Country(name: "Argentina", code: "+54", flag: "🇦🇷"),
        Country(name: "Perú", code: "+51", flag: "🇵🇪"),
        Country(name: "Colombia", code: "+57", flag: "🇨🇴"),
        Country(name: "México", code: "+52", flag: "🇲🇽")
    ]

    var body: some View {
            DSDropDown(
                items: countries,
                selectedItem: $selected
            )
    }
}



#Preview("Drop Down Custom Items") {
    DSDropDownCountryExample()
}
#endif
#endif
