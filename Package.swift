// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Moof",
    products: [
        .library(name: "Moof", targets: ["Moof"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Moof", dependencies: []),
        .testTarget(name: "MoofTests", dependencies: ["Moof"]),
    ]
)
