# iOS-System-Services

<p align="center" >

<img src="./Sample Images/Screenshot1.png" alt="System Services Memory Screenshot" title="Memory Information">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="./Sample Images/Screenshot2.png" alt="System Services Disk Screenshot" title="Disk Information">

</p>

This is a singleton class to gather all available information about a device.  It gives you over 60 methods to determine everything about a device, including:

* Hardware Information
* Network Information
* Battery Usage
* Accelerometer Data
* Disk Usage
* Memory Usage

## Installation

[![Version](https://img.shields.io/cocoapods/v/SystemServices.svg?style=flat)](http://cocoapods.org/pods/SystemServices)
[![License](https://img.shields.io/cocoapods/l/SystemServices.svg?style=flat)](http://cocoapods.org/pods/SystemServices)
[![Platform](https://img.shields.io/cocoapods/p/SystemServices.svg?style=flat)](http://cocoapods.org/pods/SystemServices)

iOS System Services is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SystemServices', '~> 2.0.1'
```

## Usage

```objective-c
// Import System Services
#import "SystemServices.h"

// Log all System Information
NSLog(@"All System Information: %@", [SystemServices sharedServices].allSystemInformation);	
```

## Changes

1. Removed Older/Unavailable Methods
2. Updated Demo Project
3. Added CocoaPods Support
4. Fixed Bugs and Addressed Naming Issues
5. Deprecated Older/Unavailable Methods

## Available Device Information

```objective-c
// System Information

// Properties

/* All System Information in Dictionary Format */
NSDictionary *allSystemInformation;

/* Hardware Information */

// System Uptime (dd hh mm)
NSString *systemsUptime;

// Model of Device
NSString *deviceModel;

// Device Name
NSString *deviceName;

// System Name
NSString *systemName;

// System Version
NSString *systemsVersion;

// System Device Type (Not Formatted = iPhone1,0)
NSString *systemDeviceTypeNotFormatted;

// System Device Type (Formatted = iPhone 1)
NSString *systemDeviceTypeFormatted;

// Get the Screen Width (X)
NSInteger screenWidth;

// Get the Screen Height (Y)
NSInteger screenHeight;

// Get the Screen Brightness
float screenBrightness;

// Multitasking enabled?
BOOL multitaskingEnabled;

// Proximity sensor enabled?
BOOL proximitySensorEnabled;

// Debugger Attached?
BOOL debuggerAttached;

// Plugged In?
BOOL pluggedIn;

/* Jailbreak Check */

// Jailbroken?
int jailbroken;

/* Processor Information */

// Number of processors
NSInteger numberProcessors;

// Number of Active Processors
NSInteger numberActiveProcessors;

// Processor Usage Information
NSArray *processorsUsage;

/* Accessory Information */

// Are any accessories attached?
BOOL accessoriesAttached;

// Are headphone attached?
BOOL headphonesAttached;

// Number of attached accessories
NSInteger numberAttachedAccessories;

// Name of attached accessory/accessories (seperated by , comma's)
NSString *nameAttachedAccessories;

/* Carrier Information */

// Carrier Name
NSString *carrierName;

// Carrier Country
NSString *carrierCountry;

// Carrier Mobile Country Code
NSString *carrierMobileCountryCode;

// Carrier ISO Country Code
NSString *carrierISOCountryCode;

// Carrier Mobile Network Code
NSString *carrierMobileNetworkCode;

// Carrier Allows VOIP
BOOL carrierAllowsVOIP;

/* Battery Information */

// Battery Level
float batteryLevel;

// Charging?
BOOL charging;

// Fully Charged?
BOOL fullyCharged;

/* Network Information */

// Get Current IP Address
NSString *currentIPAddress;

// Get External IP Address
NSString *externalIPAddress;

// Get Cell IP Address
NSString *cellIPAddress;

// Get Cell Netmask Address
NSString *cellNetmaskAddress;

// Get Cell Broadcast Address
NSString *cellBroadcastAddress;

// Get WiFi IP Address
NSString *wiFiIPAddress;

// Get WiFi Netmask Address
NSString *wiFiNetmaskAddress;

// Get WiFi Broadcast Address
NSString *wiFiBroadcastAddress;

// Get WiFi Router Address
NSString *wiFiRouterAddress;

// Connected to WiFi?
BOOL connectedToWiFi;

// Connected to Cellular Network?
BOOL connectedToCellNetwork;

/* Process Information */

// Process ID
int processID;

/* Disk Information */

// Total Disk Space
NSString *diskSpace;

// Total Free Disk Space (Raw)
NSString *freeDiskSpaceinRaw;

// Total Free Disk Space (Percentage)
NSString *freeDiskSpaceinPercent;

// Total Used Disk Space (Raw)
NSString *usedDiskSpaceinRaw;

// Total Used Disk Space (Percentage)
NSString *usedDiskSpaceinPercent;

// Get the total disk space in long format
long long longDiskSpace;

// Get the total free disk space in long format
long long longFreeDiskSpace;

/* Memory Information */

// Total Memory
double totalMemory;

// Free Memory (Raw)
double freeMemoryinRaw;

// Free Memory (Percent)
double freeMemoryinPercent;

// Used Memory (Raw)
double usedMemoryinRaw;

// Used Memory (Percent)
double usedMemoryinPercent;

// Active Memory (Raw)
double activeMemoryinRaw;

// Active Memory (Percent)
double activeMemoryinPercent;

// Inactive Memory (Raw)
double inactiveMemoryinRaw;

// Inactive Memory (Percent)
double inactiveMemoryinPercent;

// Wired Memory (Raw)
double wiredMemoryinRaw;

// Wired Memory (Percent)
double wiredMemoryinPercent;

// Purgable Memory (Raw)
double purgableMemoryinRaw;

// Purgable Memory (Percent)
double purgableMemoryinPercent;

/* Accelerometer Information */

// Device Orientation
UIInterfaceOrientation deviceOrientation;

/* Localization Information */

// Country
NSString *country;

// Language
NSString *language;

// TimeZone
NSString *timeZoneSS;

// Currency Symbol
NSString *currency;

/* Application Information */

// Application Version
NSString *applicationVersion;

// Clipboard Content
NSString *clipboardContent;

// Application CPU Usage
float applicationCPUUsage;

/* Universal Unique Identifiers */

// CFUUID
NSString *cfuuid;
```

## Third-Party Plugins

A big thank you to the makers of:

* Annotated Gauge iOS Class here: <https://github.com/sabymike/MSSimpleGauge>
* Pie Chart iOS Class here: <https://github.com/honcheng/iOSPlot>
* NSObject+PerformBlockAfterDelay iOS Class here: <http://www.mikeash.com/pyblog/friday-qa-2009-08-14-practical-blocks.html>

## License

Copyright © 2012 Shmoopi LLC <shmoopillc@gmail.com> <http://www.shmoopi.net/>

If you like what you see here, or on our website, please feel free to drop us a line or purchase one of our applications!