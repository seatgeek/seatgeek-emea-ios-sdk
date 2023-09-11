# SeatGeek EMEA iOS SDK

SeatGeek EMEA SDK allows client integrators to bring ticketing experience into their iOS apps.

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## Contents
- [Requirements](https://github.com/seatgeek/seatgeek-ios-sdk#requirements)
- [Installation](https://github.com/seatgeek/seatgeek-ios-sdk#installation)
- [Usage](https://github.com/seatgeek/seatgeek-ios-sdk#usage)

## Requirements
- iOS 15.0+
- Xcode 14.3+

## Installation

### Credentials
In order to fetch the SDK, you must have SeatGeek authorisation credentials. Please reach out to your SeatGeek EMEA client services representative to acquire it.

### Add SeatGeek Artifactory credentials
You need to configue your .netrc file.
Paste the following text and replace your login and password with the proper values that were provided to you.
```
machine seatgeek.jfrog.io
login your_login_here
password your_password_here
```

### Steps:
1) Launch Xcode and open your existing Swift application project or create a new one.
2) Go to the "File" menu at the top-left corner of the Xcode window. Select "Add Packages..."
3) You will be prompted to enter the URL of the Swift Package repository. Enter the package repository URL: https://github.com/seatgeek/seatgeek-emea-ios-sdk
4) Choose the package version requirement. You can enter a specific version number (e.g., 1.0.0), use a range (e.g., 1.0.0..<2.0.0), or even specify a branch or commit hash.
5) In "Add to project" section, select the project you want to add the package to.
6) Click the "Add package" button at the right-bottom corner of the window. Xcode will fetch the package from the specified repository.
7) After adding the package, you can start using its modules in your code. Import the module using `import SeatGeekEMEASDK`.

## Usage
```
    let sdk = SeatGeekSDK.instance
    let esroURL = URL(string: "https://esro_environment_url")!
    sdk.configure(clientID: "cliend_id", clientSecret: "client_secret", esroURL: esroURL)
    Task {
        do {
            try await sdk.authenticate(ssoToken: "sso_token")
        } catch {
            await MainActor.run {
                print("🚨 [Error]: \(error.localizedDescription)")
            }
        }
    }
```