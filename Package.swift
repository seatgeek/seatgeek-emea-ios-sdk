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
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v0.0.5/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "c7c02cad4c416b2fae2edf8a0557f907426ce3e875f67ae3e000420d5e2c4cf4"),
    ]
)