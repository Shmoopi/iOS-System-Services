iOS-System-Services
===================

iOS System Services is a class to gather all available information about a device.  There are over 75 methods to determine everything about a device, including: System Uptime, Network Information, Battery Usage, Accelerometer Data, Disk Usage, Running Processes, Memory Usage, and a complete UDID replacement based on unchanging device information.

Example Usage:

```
// System Information

// Get all System Information (All Methods)
+ (NSDictionary *)allSystemInformation;

/* Hardware Information */

// System Uptime (dd hh mm)
+ (NSString *)systemUptime;

// Model of Device
+ (NSString *)deviceModel;

// Device Name
+ (NSString *)deviceName;

// System Name
+ (NSString *)systemName;

// System Version
+ (NSString *)systemVersion;

// System Device Type (iPhone1,0) (Formatted = iPhone 1)
+ (NSString *)systemDeviceTypeFormatted:(BOOL)formatted;

// Get the Screen Width (X)
+ (NSInteger)screenWidth;

// Get the Screen Height (Y)
+ (NSInteger)screenHeight;

// Multitasking enabled?
+ (BOOL)multitaskingEnabled;

// Proximity sensor enabled?
+ (BOOL)proximitySensorEnabled;

// Debugger Attached?
+ (BOOL)debuggerAttached;

// Plugged In?
+ (BOOL)pluggedIn;

/* Jailbreak Check */

// Jailbroken?
+ (BOOL)jailbroken;

/* Processor Information */

// Number of processors
+ (NSInteger)numberProcessors;

// Number of Active Processors
+ (NSInteger)numberActiveProcessors;

// Processor Speed in MHz
+ (NSInteger)processorSpeed;

// Processor Bus Speed in MHz
+ (NSInteger)processorBusSpeed;

/* Accessory Information */

// Are any accessories attached?
+ (BOOL)accessoriesAttached;

// Are headphone attached?
+ (BOOL)headphonesAttached;

// Number of attached accessories
+ (NSInteger)numberAttachedAccessories;

// Name of attached accessory/accessories (seperated by , comma's)
+ (NSString *)nameAttachedAccessories;

/* Carrier Information */

// Carrier Name
+ (NSString *)carrierName;

// Carrier Country
+ (NSString *)carrierCountry;

// Carrier Mobile Country Code
+ (NSString *)carrierMobileCountryCode;

// Carrier ISO Country Code
+ (NSString *)carrierISOCountryCode;

// Carrier Mobile Network Code
+ (NSString *)carrierMobileNetworkCode;

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP;

/* Battery Information */

// Battery Level
+ (float)batteryLevel;

// Charging?
+ (BOOL)charging;

// Fully Charged?
+ (BOOL)fullyCharged;

/* Network Information */

// Get Current IP Address
+ (NSString *)currentIPAddress;

// Get Current MAC Address
+ (NSString *)currentMACAddress;

// Get Cell IP Address
+ (NSString *)cellIPAddress;

// Get Cell MAC Address
+ (NSString *)cellMACAddress;

// Get Cell Netmask Address
+ (NSString *)cellNetmaskAddress;

// Get Cell Broadcast Address
+ (NSString *)cellBroadcastAddress;

// Get WiFi IP Address
+ (NSString *)wiFiIPAddress;

// Get WiFi MAC Address
+ (NSString *)wiFiMACAddress;

// Get WiFi Netmask Address
+ (NSString *)wiFiNetmaskAddress;

// Get WiFi Broadcast Address
+ (NSString *)wiFiBroadcastAddress;

// Connected to WiFi?
+ (BOOL)connectedToWiFi;

// Connected to Cellular Network?
+ (BOOL)connectedToCellNetwork;

/* Process Information */

// Process ID
+ (int)processID;

// Process Name
+ (NSString *)processName;

// Process Status
+ (int)processStatus;

// Parent Process ID
+ (int)parentPID;

// Parent ID for a certain PID
+ (int)parentPIDForProcess:(int)pid;

// List of process information including PID's, Names, PPID's, and Status'
+ (NSMutableArray *)processesInformation;

/* Disk Information */

// Total Disk Space
+ (NSString *)diskSpace;

// Total Free Disk Space
+ (NSString *)freeDiskSpace:(BOOL)inPercent;

// Total Used Disk Space
+ (NSString *)usedDiskSpace:(BOOL)inPercent;

// Get the total disk space in long format
+ (long long)longDiskSpace;

// Get the total free disk space in long format
+ (long long)longFreeDiskSpace;

/* Memory Information */

// Total Memory
+ (double)totalMemory;

// Free Memory
+ (double)freeMemory:(BOOL)inPercent;

// Used Memory
+ (double)usedMemory:(BOOL)inPercent;

// Available Memory
+ (double)availableMemory:(BOOL)inPercent;

// Active Memory
+ (double)activeMemory:(BOOL)inPercent;

// Inactive Memory
+ (double)inactiveMemory:(BOOL)inPercent;

// Wired Memory
+ (double)wiredMemory:(BOOL)inPercent;

// Purgable Memory
+ (double)purgableMemory:(BOOL)inPercent;

/* Accelerometer Information */

// Device Orientation
+ (UIDeviceOrientation)deviceOrientation;

// Accelerometer X Value
+ (float)accelerometerXValue;

// Accelerometer Y Value
+ (float)accelerometerYValue;

// Accelerometer Z Value
+ (float)accelerometerZValue;

/* Localization Information */

// Country
+ (NSString *)country;

// Locale
+ (NSString *)locale;

// Language
+ (NSString *)language;

// TimeZone
+ (NSString *)timeZone;

// Currency Symbol
+ (NSString *)currency;

/* Application Information */

// Application Version
+ (NSString *)applicationVersion;

// Clipboard Content
+ (NSString *)clipboardContent;

/* Universal Unique Identifiers */

// Unique ID
+ (NSString *)uniqueID;

// Device Signature
+ (NSString *)deviceSignature;

// CFUUID
+ (NSString *)cfuuid;
```

Copyright © 2009-2013 Shmoopi LLC <shmoopillc@gmail.com> <http://www.shmoopi.net/>

This class and its usage is very intuitive and provides as simple an interface as possible for developers to plug into.  Please feel free to customize the class as much as you'd like, or use any of the code within your projects.
If you like what you see here, or on our website, please feel free to drop us a line or purchase one of our applications!

Thanks,
Shmoopi LLC
