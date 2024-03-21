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
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v1.0.1/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "5c759a80f91236af42acd3b7f8f8f7a2b7f78eef143b60a4d097f8edbfbe48fe"),
    ]
)
