//
//  SystemServices.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSAccelerometerInfo.h"
#import "SSAccessoryInfo.h"
#import "SSApplicationInfo.h"
#import "SSBatteryInfo.h"
#import "SSCarrierInfo.h"
#import "SSDiskInfo.h"
#import "SSHardwareInfo.h"
#import "SSJailbreakCheck.h"
#import "SSLocalizationInfo.h"
#import "SSMemoryInfo.h"
#import "SSNetworkInfo.h"
#import "SSProcessInfo.h"
#import "SSProcessorInfo.h"
#import "SSUUID.h"

@interface SystemServices : NSObject

// Shared Manager
+ (nonnull instancetype)sharedServices;

// Properties

/* All System Information in Dictionary Format */
@property (nonatomic, readonly, nullable) NSDictionary *allSystemInformation;

/* Hardware Information */

// System Uptime (dd hh mm)
@property (nonatomic, readonly, nullable) NSString *systemsUptime;

// Model of Device
@property (nonatomic, readonly, nullable) NSString *deviceModel;

// Device Name
@property (nonatomic, readonly, nullable) NSString *deviceName;

// System Name
@property (nonatomic, readonly, nullable) NSString *systemName;

// System Version
@property (nonatomic, readonly, nullable) NSString *systemsVersion;

// System Device Type (Not Formatted = iPhone1,0)
@property (nonatomic, readonly, nullable) NSString *systemDeviceTypeNotFormatted;

// System Device Type (Formatted = iPhone 1)
@property (nonatomic, readonly, nullable) NSString *systemDeviceTypeFormatted;

// Get the Screen Width (X)
@property (nonatomic, readonly) NSInteger screenWidth;

// Get the Screen Height (Y)
@property (nonatomic, readonly) NSInteger screenHeight;

// Get the Screen Brightness
@property (nonatomic, readonly) float screenBrightness;

// Multitasking enabled?
@property (nonatomic, readonly) BOOL multitaskingEnabled;

// Proximity sensor enabled?
@property (nonatomic, readonly) BOOL proximitySensorEnabled;

// Debugger Attached?
@property (nonatomic, readonly) BOOL debuggerAttached;

// Plugged In?
@property (nonatomic, readonly) BOOL pluggedIn;

// Step-Counting Available?
@property (nonatomic, readonly) BOOL stepCountingAvailable;

// Distance Available
@property (nonatomic, readonly) BOOL distanceAvailable;

// Floor Counting Available
@property (nonatomic, readonly) BOOL floorCountingAvailable;

/* Jailbreak Check */

// Jailbroken?
@property (nonatomic, readonly) int jailbroken;

/* Processor Information */

// Number of processors
@property (nonatomic, readonly) NSInteger numberProcessors;

// Number of Active Processors
@property (nonatomic, readonly) NSInteger numberActiveProcessors;

// Processor Usage Information
@property (nonatomic, readonly, nullable) NSArray *processorsUsage;

/* Accessory Information */

// Are any accessories attached?
@property (nonatomic, readonly) BOOL accessoriesAttached;

// Are headphone attached?
@property (nonatomic, readonly) BOOL headphonesAttached;

// Number of attached accessories
@property (nonatomic, readonly) NSInteger numberAttachedAccessories;

// Name of attached accessory/accessories (seperated by , comma's)
@property (nonatomic, readonly, nullable) NSString *nameAttachedAccessories;

/* Carrier Information */

// Carrier Name
@property (nonatomic, readonly, nullable) NSString *carrierName;

// Carrier Country
@property (nonatomic, readonly, nullable) NSString *carrierCountry;

// Carrier Mobile Country Code
@property (nonatomic, readonly, nullable) NSString *carrierMobileCountryCode;

// Carrier ISO Country Code
@property (nonatomic, readonly, nullable) NSString *carrierISOCountryCode;

// Carrier Mobile Network Code
@property (nonatomic, readonly, nullable) NSString *carrierMobileNetworkCode;

// Carrier Allows VOIP
@property (nonatomic, readonly) BOOL carrierAllowsVOIP;

/* Battery Information */

// Battery Level
@property (nonatomic, readonly) float batteryLevel;

// Charging?
@property (nonatomic, readonly) BOOL charging;

// Fully Charged?
@property (nonatomic, readonly) BOOL fullyCharged;

/* Network Information */

// Get Current IP Address
@property (nonatomic, readonly, nullable) NSString *currentIPAddress;

// Get External IP Address
@property (nonatomic, readonly, nullable) NSString *externalIPAddress;

// Get Cell IP Address
@property (nonatomic, readonly, nullable) NSString *cellIPAddress;

// Get Cell Netmask Address
@property (nonatomic, readonly, nullable) NSString *cellNetmaskAddress;

// Get Cell Broadcast Address
@property (nonatomic, readonly, nullable) NSString *cellBroadcastAddress;

// Get WiFi IP Address
@property (nonatomic, readonly, nullable) NSString *wiFiIPAddress;

// Get WiFi Netmask Address
@property (nonatomic, readonly, nullable) NSString *wiFiNetmaskAddress;

// Get WiFi Broadcast Address
@property (nonatomic, readonly, nullable) NSString *wiFiBroadcastAddress;

// Get WiFi Router Address
@property (nonatomic, readonly, nullable) NSString *wiFiRouterAddress;

// Connected to WiFi?
@property (nonatomic, readonly) BOOL connectedToWiFi;

// Connected to Cellular Network?
@property (nonatomic, readonly) BOOL connectedToCellNetwork;

/* Process Information */

// Process ID
@property (nonatomic, readonly) int processID;

/* Disk Information */

// Total Disk Space
@property (nonatomic, readonly, nullable) NSString *diskSpace;

// Total Free Disk Space (Raw)
@property (nonatomic, readonly, nullable) NSString *freeDiskSpaceinRaw;

// Total Free Disk Space (Percentage)
@property (nonatomic, readonly, nullable) NSString *freeDiskSpaceinPercent;

// Total Used Disk Space (Raw)
@property (nonatomic, readonly, nullable) NSString *usedDiskSpaceinRaw;

// Total Used Disk Space (Percentage)
@property (nonatomic, readonly, nullable) NSString *usedDiskSpaceinPercent;

// Get the total disk space in long format
@property (nonatomic, readonly) long long longDiskSpace;

// Get the total free disk space in long format
@property (nonatomic, readonly) long long longFreeDiskSpace;

/* Memory Information */

// Total Memory
@property (nonatomic, readonly) double totalMemory;

// Free Memory (Raw)
@property (nonatomic, readonly) double freeMemoryinRaw;

// Free Memory (Percent)
@property (nonatomic, readonly) double freeMemoryinPercent;

// Used Memory (Raw)
@property (nonatomic, readonly) double usedMemoryinRaw;

// Used Memory (Percent)
@property (nonatomic, readonly) double usedMemoryinPercent;

// Active Memory (Raw)
@property (nonatomic, readonly) double activeMemoryinRaw;

// Active Memory (Percent)
@property (nonatomic, readonly) double activeMemoryinPercent;

// Inactive Memory (Raw)
@property (nonatomic, readonly) double inactiveMemoryinRaw;

// Inactive Memory (Percent)
@property (nonatomic, readonly) double inactiveMemoryinPercent;

// Wired Memory (Raw)
@property (nonatomic, readonly) double wiredMemoryinRaw;

// Wired Memory (Percent)
@property (nonatomic, readonly) double wiredMemoryinPercent;

// Purgable Memory (Raw)
@property (nonatomic, readonly) double purgableMemoryinRaw;

// Purgable Memory (Percent)
@property (nonatomic, readonly) double purgableMemoryinPercent;

/* Accelerometer Information */

// Device Orientation
@property (nonatomic, readonly) UIInterfaceOrientation deviceOrientation;

/* Localization Information */

// Country
@property (nonatomic, readonly, nullable) NSString *country;

// Language
@property (nonatomic, readonly, nullable) NSString *language;

// TimeZone
@property (nonatomic, readonly, nullable) NSString *timeZoneSS;

// Currency Symbol
@property (nonatomic, readonly, nullable) NSString *currency;

/* Application Information */

// Application Version
@property (nonatomic, readonly, nullable) NSString *applicationVersion;

// Clipboard Content
@property (nonatomic, readonly, nullable) NSString *clipboardContent;

// Application CPU Usage
@property (nonatomic, readonly) float applicationCPUUsage;

/* Universal Unique Identifiers */

// CFUUID
@property (nonatomic, readonly, nullable) NSString *cfuuid;

@end
