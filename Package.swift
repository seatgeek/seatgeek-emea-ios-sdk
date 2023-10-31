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
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v0.1.0/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "7240b8d910df13bc3e84782e57cc460347c8d244c57dd2b8347bbe57d810daa1"),
    ]
)