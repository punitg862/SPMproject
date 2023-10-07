// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMproject",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMproject",
            targets: ["SPMproject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/adobe/aepsdk-core-ios.git", .upToNextMajor(from: "4.1.0")),
        .package(url: "https://github.com/adobe/aepsdk-assurance-ios.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SPMproject",
            dependencies: [.product(name: "AEPCore", package: "aepsdk-core-ios"),
                            .product(name: "AEPIdentity", package: "aepsdk-core-ios"),
                            .product(name: "AEPSignal", package: "aepsdk-core-ios"),
                            .product(name: "AEPLifecycle", package: "aepsdk-core-ios"),
                            .product(name: "AEPServices", package: "aepsdk-core-ios"),
                            .product(name: "AEPAssurance", package: "aepsdk-assurance-ios")]
        ),
        .testTarget(
            name: "SPMprojectTests",
            dependencies: ["SPMproject"]),
    ],
    swiftLanguageVersions: [.v5]
)
