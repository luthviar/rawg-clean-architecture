// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RGHome",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RGHome",
            targets: ["RGHome"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "RGCore", path: "../RGCore"),
        .package(name: "RGAbout", path: "../RGAbout"),
        .package(name: "RGDetail", path: "../RGDetail"),
        .package(name: "RGFavorite", path: "../RGFavorite"),
        .package(name: "RGGameRow", path: "../RGGameRow")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RGHome",
            dependencies: [
                "RGCore",
                "RGAbout",
                "RGDetail",
                "RGFavorite",
                "RGGameRow"
            ]),
        .testTarget(
            name: "RGHomeTests",
            dependencies: ["RGHome"]),
    ]
)
