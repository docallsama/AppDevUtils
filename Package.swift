// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "AppDevUtils",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8),
  ],
  products: [
    .library(name: "AppDevUtils", targets: ["AppDevUtils"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "0.49.2"),
    .package(url: "https://github.com/yannickl/DynamicColor.git", from: "5.0.1"),
  ],
  targets: [
    .target(
      name: "AppDevUtils",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        .product(name: "DynamicColor", package: "DynamicColor"),
      ]
    ),
    .testTarget(
      name: "AppDevUtilsTests",
      dependencies: ["AppDevUtils"]
    ),
  ]
)
