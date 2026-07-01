# iOS System Services

[![CocoaPods](https://img.shields.io/cocoapods/v/SystemServices.svg?style=flat)](https://cocoapods.org/pods/SystemServices)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/cocoapods/p/SystemServices.svg?style=flat)](https://cocoapods.org/pods/SystemServices)
[![Language](https://img.shields.io/badge/language-Objective--C-blue.svg?style=flat)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)
[![License](https://img.shields.io/cocoapods/l/SystemServices.svg?style=flat)](LICENSE)

**One singleton. 70+ read-only properties. Everything you can know about an iOS device.**

`SystemServices` is a lightweight Objective-C library that gathers hardware,
network, battery, motion, disk, memory, processor, carrier, accessory,
localization and application information behind a single, well-documented API —
no boilerplate, no setup.

<p align="center">
  <img src="./Sample Images/Hardware.png" alt="Hardware information" width="23%">
  <img src="./Sample Images/Network.png"  alt="Network information"  width="23%">
  <img src="./Sample Images/Memory.png"   alt="Memory information"   width="23%">
  <img src="./Sample Images/Disk.png"     alt="Disk information"     width="23%">
</p>

## Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick start](#quick-start)
- [API reference](#api-reference)
- [Demo app](#demo-app)
- [Notes & limitations](#notes--limitations)
- [Contributing](#contributing)
- [Credits](#credits)
- [License](#license)

## Features

- **Single facade** — `[SystemServices sharedServices]` exposes everything.
- **Drop-in** — install with CocoaPods, Swift Package Manager, or by copying
  the `System Services` folder.
- **One snapshot** — `allSystemInformation` returns a dictionary of (almost)
  everything in one call.
- **Up to date** — device identifiers are mapped through the latest iPhone,
  iPad, iPod touch and Apple TV models.

## Requirements

| | |
|---|---|
| **iOS** | 15.0+ |
| **Language** | Objective-C (ARC) |
| **Xcode** | 15+ |

## Installation

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'SystemServices', '~> 3.0'
```

then run `pod install`.

### Swift Package Manager

In Xcode: **File → Add Package Dependencies…** and enter

```
https://github.com/Shmoopi/iOS-System-Services.git
```

or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Shmoopi/iOS-System-Services.git", from: "3.0.0")
]
```

### Manual

Drag the `System Services` folder into your project. The library uses
`AVFoundation`, `CoreTelephony`, `CoreMotion`, `ExternalAccessory`, `Security`,
`UIKit` and `Foundation` — all part of the iOS SDK.

## Quick start

```objective-c
// Import System Services
#import "SystemServices.h"

// Read a single value
NSLog(@"Device model: %@", [SystemServices sharedServices].deviceModel);

// Or grab everything at once
NSLog(@"All system information: %@", [SystemServices sharedServices].allSystemInformation);
```

> Using it from a Swift target? Add `#import "SystemServices.h"` to your bridging
> header (CocoaPods / manual) or `import SystemServices` (Swift Package Manager),
> then call `SystemServices.shared()`.

## API reference

All properties are `readonly` on `[SystemServices sharedServices]`.

### Hardware

| Property | Type | Description |
|---|---|---|
| `systemsUptime` | `NSString *` | Uptime formatted as `dd hh mm` |
| `deviceModel` | `NSString *` | e.g. `iPhone` |
| `deviceName` | `NSString *` | User-assigned device name |
| `systemName` | `NSString *` | e.g. `iOS` |
| `systemsVersion` | `NSString *` | e.g. `18.0` |
| `systemDeviceTypeNotFormatted` | `NSString *` | Raw identifier, e.g. `iPhone17,1` |
| `systemDeviceTypeFormatted` | `NSString *` | Friendly name, e.g. `iPhone 16 Pro` |
| `screenWidth` / `screenHeight` | `NSInteger` | Screen size in points |
| `screenBrightness` | `float` | 0–100 |
| `multitaskingEnabled` | `BOOL` | |
| `proximitySensorEnabled` | `BOOL` | |
| `debuggerAttached` | `BOOL` | |
| `pluggedIn` | `BOOL` | |
| `stepCountingAvailable` | `BOOL` | |
| `distanceAvailable` | `BOOL` | |
| `floorCountingAvailable` | `BOOL` | |

### Jailbreak

| Property | Type | Description |
|---|---|---|
| `jailbroken` | `int` | Non-`NOTJAIL` when the device appears jailbroken |

### Processor

| Property | Type | Description |
|---|---|---|
| `numberProcessors` | `NSInteger` | |
| `numberActiveProcessors` | `NSInteger` | |
| `processorsUsage` | `NSArray *` | Per-core usage (0.0–1.0) |

### Accessories

| Property | Type | Description |
|---|---|---|
| `accessoriesAttached` | `BOOL` | |
| `headphonesAttached` | `BOOL` | |
| `numberAttachedAccessories` | `NSInteger` | |
| `nameAttachedAccessories` | `NSString *` | Comma-separated |

### Carrier

| Property | Type | Description |
|---|---|---|
| `carrierName` | `NSString *` | |
| `carrierCountry` | `NSString *` | |
| `carrierMobileCountryCode` | `NSString *` | |
| `carrierISOCountryCode` | `NSString *` | |
| `carrierMobileNetworkCode` | `NSString *` | |
| `carrierAllowsVOIP` | `BOOL` | |

> ⚠️ Apple deprecated `CTCarrier` and stopped returning real carrier data to
> third-party apps in iOS 16; these properties now degrade to `nil` /
> placeholder values on modern systems. See [Notes & limitations](#notes--limitations).

### Battery

| Property | Type | Description |
|---|---|---|
| `batteryLevel` | `float` | 0–100 (`-1` if unavailable, e.g. on Simulator) |
| `charging` | `BOOL` | |
| `fullyCharged` | `BOOL` | |

### Network

| Property | Type | Description |
|---|---|---|
| `currentIPAddress` | `NSString *` | Active interface IP |
| `externalIPAddress` | `NSString *` | Public IP (synchronous network call) |
| `cellIPAddress` / `cellNetmaskAddress` / `cellBroadcastAddress` | `NSString *` | Cellular interface |
| `wiFiIPAddress` / `wiFiNetmaskAddress` / `wiFiBroadcastAddress` / `wiFiRouterAddress` | `NSString *` | Wi-Fi interface |
| `connectedToWiFi` | `BOOL` | |
| `connectedToCellNetwork` | `BOOL` | |

### Process

| Property | Type | Description |
|---|---|---|
| `processID` | `int` | |

### Disk

| Property | Type | Description |
|---|---|---|
| `diskSpace` | `NSString *` | Total, human-readable |
| `freeDiskSpaceinRaw` / `freeDiskSpaceinPercent` | `NSString *` | Free space |
| `usedDiskSpaceinRaw` / `usedDiskSpaceinPercent` | `NSString *` | Used space |
| `longDiskSpace` / `longFreeDiskSpace` | `long long` | Raw byte counts |

### Memory

| Property | Type | Description |
|---|---|---|
| `totalMemory` | `double` | Physical RAM (MB) |
| `freeMemoryinRaw` / `freeMemoryinPercent` | `double` | |
| `usedMemoryinRaw` / `usedMemoryinPercent` | `double` | |
| `activeMemoryinRaw` / `activeMemoryinPercent` | `double` | |
| `inactiveMemoryinRaw` / `inactiveMemoryinPercent` | `double` | |
| `wiredMemoryinRaw` / `wiredMemoryinPercent` | `double` | |
| `purgableMemoryinRaw` / `purgableMemoryinPercent` | `double` | |

### Accelerometer / Motion

| Property | Type | Description |
|---|---|---|
| `deviceOrientation` | `UIInterfaceOrientation` | From the active window scene |

`SSAccelerometerInfo` also offers instance methods (`startLoggingMotionData` /
`stopLoggingMotionData`) for raw accelerometer, gyroscope and device-motion
streams.

### Localization

| Property | Type | Description |
|---|---|---|
| `country` | `NSString *` | Locale identifier |
| `language` | `NSString *` | Preferred language |
| `timeZoneSS` | `NSString *` | System time zone name |
| `currency` | `NSString *` | Currency symbol |

### Application

| Property | Type | Description |
|---|---|---|
| `applicationVersion` | `NSString *` | `CFBundleShortVersionString` |
| `clipboardContent` | `NSString *` | General pasteboard text (see privacy note) |
| `applicationCPUUsage` | `float` | This app's CPU usage |

### Identifiers

| Property | Type | Description |
|---|---|---|
| `cfuuid` | `NSString *` | A freshly generated `CFUUID` (random each call) |

### Everything at once

| Property | Type | Description |
|---|---|---|
| `allSystemInformation` | `NSDictionary *` | Snapshot of (almost) every value as strings |

## Demo app

Open `SystemServicesDemo/SystemServicesDemo.xcodeproj` and run. The app shows
the library output across four tabs — Hardware, Network, Memory and Disk — with
a live pie chart and gauge.

```bash
cd SystemServicesDemo
xcodebuild -project SystemServicesDemo.xcodeproj \
  -scheme SystemServicesDemo \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  build CODE_SIGNING_ALLOWED=NO
```

## Notes & limitations

- **Carrier data** — `CTCarrier` and `-subscriberCellularProvider` were
  deprecated by Apple in iOS 12 and return placeholder values for third-party
  apps from iOS 16 onward. There is no replacement API; these properties return
  `nil` where data is unavailable.
- **Clipboard privacy** — `clipboardContent` reads the general pasteboard
  (which triggers the system paste notification on modern iOS). It is
  deliberately **excluded** from `allSystemInformation` so a bulk snapshot can't
  silently capture pasteboard contents.
- **Simulator** — battery and some sensor APIs are unavailable on the Simulator
  and return sentinel values. Device-model detection uses
  `SIMULATOR_MODEL_IDENTIFIER` so the simulated model name is still reported
  correctly.
- **External IP** — `externalIPAddress` performs a synchronous HTTPS request;
  call it from a background queue in production.

## Contributing

Issues and pull requests are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

A big thank you to the makers of the components used by the **demo app**:

- Annotated Gauge — [MSSimpleGauge](https://github.com/sabymike/MSSimpleGauge)
- Pie Chart — [iOSPlot](https://github.com/honcheng/iOSPlot)

## License

Released under the MIT License. Copyright © 2012–2026 Shmoopi LLC
&lt;shmoopillc@gmail.com&gt;. See [LICENSE](LICENSE) for details.
