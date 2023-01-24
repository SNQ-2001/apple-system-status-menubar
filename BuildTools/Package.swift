// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "BuildTools",
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", branch: "main"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.0"),
        .package(url: "https://github.com/SwiftGen/SwiftGen", from: "6.0.0")
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
