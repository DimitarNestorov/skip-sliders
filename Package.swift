// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sliders",
    platforms: [
        .iOS(.v14), .macOS(.v11)
    ],
    products: [
        .library(name: "Sliders", targets: ["Sliders"])
    ],
    dependencies: [
		.package(url: "https://source.skip.tools/skip.git", from: "1.9.5"),
    ],
    targets: [
        .target(
            name: "Sliders",    
			plugins: [
				.plugin(name: "skipstone", package: "skip"),
			],
        ),
        .testTarget(name: "SlidersTests", dependencies: ["Sliders"])
    ]
)
