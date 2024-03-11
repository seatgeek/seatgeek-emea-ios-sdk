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
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v1.0.0/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "2f76e9817e6d93fd9e1e34a449272fe28e982d7897a72ad502476d4491e000c6"),
    ]
)
