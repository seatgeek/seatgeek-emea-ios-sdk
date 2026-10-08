// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SeatGeekEMEASDK",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SeatGeekEMEASDK",
            targets: ["SeatGeekEMEASDK"]),
    ],
    targets: [
        .binaryTarget(name: "SeatGeekEMEASDK",
                      url: "https://seatgeek.jfrog.io/artifactory/emea-sdk-ios/v1.7.0/SeatGeekEMEASDK.xcframework.zip",
                      checksum: "483fda44a3709b9dce102a4f8bbfd0f0cb83d78d6841f1caed3af9b79e05815d"),
    ]
)
