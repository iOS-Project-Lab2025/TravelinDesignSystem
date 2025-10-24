// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TravelinDesignSystem",
    platforms: [
        .iOS(.v17),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "TravelinDesignSystem",
            targets: ["TravelinDesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins.git", from: "0.62.1"),
    ],
    targets: [
        .target(
            name: "TravelinDesignSystem",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "swiftlintplugins")]
        ),
    ]
)
