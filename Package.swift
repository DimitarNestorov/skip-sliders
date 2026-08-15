// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sliders",
    platforms: [
        .iOS(.v16), .macOS(.v14)
    ],
    products: [
        .library(name: "Sliders", targets: ["Sliders"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Sliders",
        ),
        .testTarget(name: "SlidersTests", dependencies: ["Sliders"])
    ]
)
