# SeatGeek EMEA iOS SDK

SeatGeek EMEA SDK allows client integrators to bring ticketing experience into their iOS apps.

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## Contents
- [Requirements](https://github.com/seatgeek/seatgeek-emea-ios-sdk#requirements)
- [Installation](https://github.com/seatgeek/seatgeek-emea-ios-sdk#installation)
- [Getting Started](https://github.com/seatgeek/seatgeek-emea-ios-sdk#getting-started)

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

## Getting Started

1) Import the Swift SDK into your project:
```
import SeatGeekEMEASDK
```
2) Configure the SDK with your credentials, eSRO URL and API URL (optional) by calling the `SeatGeekSDK.instance.configure` function with a `SeatGeekSDKConfiguration` parameter.

Optionally, you can add `loggingEnabled: true` parameter to collect application logs to a file for debugging purposes.
By default this flag is set to `false` and if you do not provide it - logging feature will not be enabled.
*! Be careful, make sure that you set it to `true` only for non-production builds.*

When this flag is set to `true`, you will be able to share the SDK logs document by clicking "document with arrow" icon on the right side of the navigation bar on the `SeatGeekView` screen.

You must do this before using any of the SDK's features:
```swift
    let esroURL = URL(string: "https://esro_environment_url")!
    let config = SeatGeekSDKConfiguration(clientID: "cliend_id", clientSecret: "client_secret", esroURL: esroURL, loggingEnabled: true)
    SeatGeekSDK.instance.configure(with: config)

    Task {
        do {
            try await sdk.authenticate(ssoToken: "sso_token")
        } catch SeatGeekError.requestFailed(let httpStatusCode, let data) {
            var errorMessage = "Status code: \(httpStatusCode)."
            if let data,
            let message = String(data: data, encoding: .utf8) {
                errorMessage += "Message: \(message)."
            }
            print("🚨 [Error] Network Request Failed. \(errorMessage)")
        } catch {
            await MainActor.run {
                print("🚨 [Error]: \(error.localizedDescription)")
            }
        }
    }
```
This configuration step is necessary for the SDK to communicate with backend services. Ensure that you provide the correct values for `clientID`, `clientSecret`, `eSRO URL`, and `API URL`.

3) Using SeatGeekView with SwiftUI

The Swift SDK provides a public SwiftUI View called SeatGeekView that you can use in your application. To use it, simply add it to your SwiftUI views:
```swift
struct ExampleView: View {
    var body: some View {
        SeatGeekView()
    }
}
```
Optionally, you can add the `backButton` parameter to `SeatGeekView` or `SeatGeekViewController` initializer. It is a structure of a `SeatGeekBackButton` type that gives you the ability to display the "Back" button in the navigation bar. `title` is optional, if it is not set, it will fall back to a default "Back" value. `action` is a closure that will be executed on the button click.

Usage examples:
```swift
1.  SeatGeekView(backButton: SeatGeekBackButton() { print("Back button click!") })

2.  let rootViewController = SeatGeekViewController()
    rootViewController.backButton = SeatGeekBackButton(title: "", action: { print("Back button clicked!") }) // This will show Back button without title


```

Both `SeatGeekView` and `SeatGeekViewController` come with their own navigation stacks, so you don't need to wrap them in a `NavigationView` or `UINavigationController`.

4) Using SeatGeekViewController with UIKit

To use SeatGeekViewController, either from a storyboard or programmatically, you don't need to wrap it in a UINavigationController. It comes with its own navigation stack.

### From a Storyboard

1) In your storyboard, add a new View Controller.
2) Set the Custom Class of the View Controller to SeatGeekViewController.
3) Link this View Controller to your app's flow as needed.

### Programmatically

```swift
let seatGeekViewController = SeatGeekViewController()
```
