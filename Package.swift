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


if Context.environment["SKIP_BRIDGE"] ?? "0" != "0" {
	package.dependencies += [.package(url: "https://source.skip.tools/skip-bridge.git", "0.0.0"..<"2.0.0")]
	package.targets.forEach({ target in
		target.dependencies += [.product(name: "SkipBridge", package: "skip-bridge")]
	})
	// All library types must be dynamic to support bridging
	package.products = package.products.map({ product in
		guard let libraryProduct = product as? Product.Library else { return product }
		return .library(name: libraryProduct.name, type: .dynamic, targets: libraryProduct.targets)
	})
}


