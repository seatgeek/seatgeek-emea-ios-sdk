// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SeatGeekEMEASDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SeatGeekEMEASDK",
            targets: ["SeatGeekEMEASDK"]),
    ],
    targets: [
        .binaryTarget(name: "SeatGeekEMEASDK",
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v0.0.4/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "b924e0f1ae8ecf6e3cf2716ee7da374da6f23f07ce6791d21bcdb3c6a89cd6c9"),
    ]
)