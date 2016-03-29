//
//  SystemServices.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServices.h"

@interface SystemServices () {
    // Private
    
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
    
    // Processor Speed in MHz
    NSInteger processorSpeed;
    
    // Processor Bus Speed in MHz
    NSInteger processorBusSpeed;
    
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
    
    // Get Current MAC Address
    NSString *currentMACAddress;
    
    // Get External IP Address
    NSString *externalIPAddress;
    
    // Get Cell IP Address
    NSString *cellIPAddress;
    
    // Get Cell MAC Address
    NSString *cellMACAddress;
    
    // Get Cell Netmask Address
    NSString *cellNetmaskAddress;
    
    // Get Cell Broadcast Address
    NSString *cellBroadcastAddress;
    
    // Get WiFi IP Address
    NSString *wiFiIPAddress;
    
    // Get WiFi MAC Address
    NSString *wiFiMACAddress;
    
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
    
    // Process Name
    NSString *processName;
    
    // Process Status
    int processStatus;
    
    // Parent Process ID
    int parentPID;
    
    // List of process information including PID's, Names, PPID's, and Status'
    NSMutableArray *processesInformation;
    
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
    
    /* Universal Unique Identifiers */
    
    // Unique ID
    NSString *uniqueID;
    
    // Device Signature
    NSString *deviceSignature;
    
    // CFUUID
    NSString *cfuuid;
    
    // CPU Usage
    float cpuUsage;
}

// Get all System Information (All Methods)
- (NSDictionary *)getAllSystemInformation;

@end

@implementation SystemServices

@dynamic allSystemInformation, systemsUptime, deviceModel, deviceName, systemName, systemsVersion, systemDeviceTypeNotFormatted, systemDeviceTypeFormatted, screenWidth, screenHeight, screenBrightness, multitaskingEnabled, proximitySensorEnabled, debuggerAttached, pluggedIn, jailbroken, numberProcessors, numberActiveProcessors, processorSpeed, processorBusSpeed, accessoriesAttached, headphonesAttached, numberAttachedAccessories, nameAttachedAccessories, carrierName, carrierCountry, carrierMobileCountryCode, carrierISOCountryCode, carrierMobileNetworkCode, carrierAllowsVOIP, batteryLevel, charging, fullyCharged, currentIPAddress, currentMACAddress, externalIPAddress, cellIPAddress, cellMACAddress, cellNetmaskAddress, cellBroadcastAddress, wiFiIPAddress, wiFiMACAddress, wiFiNetmaskAddress, wiFiBroadcastAddress, wiFiRouterAddress, connectedToWiFi, connectedToCellNetwork, processID, processName, processStatus, parentPID, processesInformation, diskSpace, freeDiskSpaceinRaw, freeDiskSpaceinPercent, usedDiskSpaceinRaw, usedDiskSpaceinPercent, longDiskSpace, longFreeDiskSpace, totalMemory, freeMemoryinRaw, freeMemoryinPercent, usedMemoryinRaw, usedMemoryinPercent, activeMemoryinRaw, activeMemoryinPercent, inactiveMemoryinRaw, inactiveMemoryinPercent, wiredMemoryinRaw, wiredMemoryinPercent, purgableMemoryinRaw, purgableMemoryinPercent, deviceOrientation, country, language, timeZoneSS, currency, applicationVersion, clipboardContent, uniqueID, deviceSignature, cfuuid, cpuUsage;

// Singleton
+ (id)sharedServices {
    static SystemServices *sharedSystemServices = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSystemServices = [[self alloc] init];
    });
    return sharedSystemServices;
}

// Init
- (id)init {
    if (self = [super init]) {
        // Initialize variables
        //[self refreshValues];
    }
    
    return self;
}

// System Information

- (NSString *)systemsUptime {
    return [SSHardwareInfo systemUptime];
}

- (NSString *)deviceModel {
    return [SSHardwareInfo deviceModel];
}

- (NSString *)deviceName {
    return [SSHardwareInfo deviceName];
}

- (NSString *)systemName {
    return [SSHardwareInfo systemName];
}

- (NSString *)systemsVersion {
    return [SSHardwareInfo systemVersion];
}

- (NSString *)systemDeviceTypeNotFormatted {
    return [SSHardwareInfo systemDeviceTypeFormatted:NO];
}

- (NSString *)systemDeviceTypeFormatted {
    return [SSHardwareInfo systemDeviceTypeFormatted:YES];
}

- (NSInteger)screenWidth {
    return [SSHardwareInfo screenWidth];
}

- (NSInteger)screenHeight {
    return [SSHardwareInfo screenHeight];
}

- (float)screenBrightness {
    return [SSHardwareInfo screenBrightness];
}

- (BOOL)multitaskingEnabled {
    return [SSHardwareInfo multitaskingEnabled];
}

- (BOOL)proximitySensorEnabled {
    return [SSHardwareInfo proximitySensorEnabled];
}

- (BOOL)debuggerAttached {
    return [SSHardwareInfo debuggerAttached];
}

- (BOOL)pluggedIn {
    return [SSHardwareInfo pluggedIn];
}

- (int)jailbroken {
    return [SSJailbreakCheck jailbroken];
}

- (NSInteger)numberProcessors {
    return [SSProcessorInfo numberProcessors];
}

- (NSInteger)numberActiveProcessors {
    return [SSProcessorInfo numberActiveProcessors];
}

- (NSInteger)processorSpeed {
    return [SSProcessorInfo processorSpeed];
}

- (NSInteger)processorBusSpeed {
    return [SSProcessorInfo processorBusSpeed];
}

- (BOOL)accessoriesAttached {
    return [SSAccessoryInfo accessoriesAttached];
}

- (BOOL)headphonesAttached {
    return [SSAccessoryInfo headphonesAttached];
}

- (NSInteger)numberAttachedAccessories {
    return [SSAccessoryInfo numberAttachedAccessories];
}

- (NSString *)nameAttachedAccessories {
    return [SSAccessoryInfo nameAttachedAccessories];
}

- (NSString *)carrierName {
    return [SSCarrierInfo carrierName];
}

- (NSString *)carrierCountry {
    return [SSCarrierInfo carrierCountry];
}

- (NSString *)carrierMobileCountryCode {
    return [SSCarrierInfo carrierMobileCountryCode];
}

- (NSString *)carrierISOCountryCode {
    return [SSCarrierInfo carrierISOCountryCode];
}

- (NSString *)carrierMobileNetworkCode {
    return [SSCarrierInfo carrierMobileNetworkCode];
}

- (BOOL)carrierAllowsVOIP {
    return [SSCarrierInfo carrierAllowsVOIP];
}

- (float)batteryLevel {
    return [SSBatteryInfo batteryLevel];
}

- (BOOL)charging {
    return [SSBatteryInfo charging];
}

- (BOOL)fullyCharged {
    return [SSBatteryInfo fullyCharged];
}

- (nullable NSString *)currentIPAddress {
    return [SSNetworkInfo currentIPAddress];
}

- (nullable NSString *)currentMACAddress{
    return [SSNetworkInfo currentMACAddress];
}

- (nullable NSString *)externalIPAddress {
    return [SSNetworkInfo externalIPAddress];
}

- (nullable NSString *)cellIPAddress {
    return [SSNetworkInfo cellIPAddress];
}

- (nullable NSString *)cellMACAddress {
    return [SSNetworkInfo cellMACAddress];
}

- (nullable NSString *)cellNetmaskAddress {
    return [SSNetworkInfo cellNetmaskAddress];
}

- (nullable NSString *)cellBroadcastAddress {
    return [SSNetworkInfo cellBroadcastAddress];
}

- (nullable NSString *)wiFiIPAddress {
    return [SSNetworkInfo wiFiIPAddress];
}

- (nullable NSString *)wiFiMACAddress {
    return [SSNetworkInfo wiFiMACAddress];
}

- (nullable NSString *)wiFiNetmaskAddress {
    return [SSNetworkInfo wiFiNetmaskAddress];
}

- (nullable NSString *)wiFiBroadcastAddress {
    return [SSNetworkInfo wiFiBroadcastAddress];
}

- (nullable NSString *)wiFiRouterAddress {
    return [SSNetworkInfo wiFiRouterAddress];
}

- (BOOL)connectedToWiFi {
    return [SSNetworkInfo connectedToWiFi];
}

- (BOOL)connectedToCellNetwork {
    return [SSNetworkInfo connectedToCellNetwork];
}

- (int)processID {
    return [SSProcessInfo processID];
}

- (NSString *)processName {
    return [SSProcessInfo processName];
}

- (int)processStatus {
    return [SSProcessInfo processStatus];
}

- (int)parentPID {
    return [SSProcessInfo parentPID];
}

- (NSMutableArray *)processesInformation {
    return [SSProcessInfo processesInformation];
}

- (NSString *)diskSpace {
    return [SSDiskInfo diskSpace];
}

- (NSString *)freeDiskSpaceinRaw {
    return [SSDiskInfo freeDiskSpace:NO];
}

- (NSString *)freeDiskSpaceinPercent {
    return [SSDiskInfo freeDiskSpace:YES];
}

- (NSString *)usedDiskSpaceinRaw {
    return [SSDiskInfo usedDiskSpace:NO];
}

- (NSString *)usedDiskSpaceinPercent {
    return [SSDiskInfo usedDiskSpace:YES];
}

- (long long)longDiskSpace {
    return [SSDiskInfo longDiskSpace];
}

- (long long)longFreeDiskSpace {
    return [SSDiskInfo longFreeDiskSpace];
}

- (double)totalMemory {
    return [SSMemoryInfo totalMemory];
}

- (double)freeMemoryinRaw {
    return [SSMemoryInfo freeMemory:NO];
}

- (double)freeMemoryinPercent {
    return [SSMemoryInfo freeMemory:YES];
}

- (double)usedMemoryinRaw {
    return [SSMemoryInfo usedMemory:NO];
}

- (double)usedMemoryinPercent {
    return [SSMemoryInfo usedMemory:YES];
}

- (double)activeMemoryinRaw {
    return [SSMemoryInfo activeMemory:NO];
}

- (double)activeMemoryinPercent {
    return [SSMemoryInfo activeMemory:YES];
}

- (double)inactiveMemoryinRaw {
    return [SSMemoryInfo inactiveMemory:NO];
}

- (double)inactiveMemoryinPercent {
    return [SSMemoryInfo inactiveMemory:YES];
}

- (double)wiredMemoryinRaw {
    return [SSMemoryInfo wiredMemory:NO];
}

- (double)wiredMemoryinPercent {
    return [SSMemoryInfo wiredMemory:YES];
}

- (double)purgableMemoryinRaw {
    return [SSMemoryInfo purgableMemory:NO];
}

- (double)purgableMemoryinPercent {
    return [SSMemoryInfo purgableMemory:YES];
}

- (UIInterfaceOrientation)deviceOrientation {
    return [SSAccelerometerInfo deviceOrientation];
}

- (NSString *)country {
    return [SSLocalizationInfo country];
}

- (NSString *)language {
    return [SSLocalizationInfo language];
}

- (NSString *)timeZoneSS {
    return [SSLocalizationInfo timeZone];
}

- (NSString *)currency {
    return [SSLocalizationInfo currency];
}

- (NSString *)applicationVersion {
    return [SSApplicationInfo applicationVersion];
}

- (NSString *)clipboardContent {
    return [SSApplicationInfo clipboardContent];
}

- (NSString *)uniqueID {
    return [SSUUID uniqueID];
}

- (NSString *)deviceSignature {
    return [SSUUID deviceSignature];
}

- (NSString *)cfuuid {
    return [SSUUID cfuuid];
}

- (float)cpuUsage {
    return [SSApplicationInfo cpuUsage];
}

- (NSDictionary *)allSystemInformation {
    return [self getAllSystemInformation];
}

// Get all System Information (All Methods)
- (NSDictionary *)getAllSystemInformation {
    // Create an array
    NSDictionary *SystemInformationDict;
    
    // Set up all System Values
    NSString *SystemUptime = [self systemsUptime];
    NSString *DeviceModel = [self deviceModel];
    NSString *DeviceName = [self deviceName];
    NSString *SystemName = [self systemName];
    NSString *SystemVersion = [self systemsVersion];
    NSString *SystemDeviceTypeFormattedNO = [self systemDeviceTypeNotFormatted];
    NSString *SystemDeviceTypeFormattedYES = [self systemDeviceTypeFormatted];
    NSString *ScreenWidth = [NSString stringWithFormat:@"%ld", (long)[self screenWidth]];
    NSString *ScreenHeight = [NSString stringWithFormat:@"%ld", (long)[self screenHeight]];
    NSString *ScreenBrightness = [NSString stringWithFormat:@"%f", [self screenBrightness]];
    NSString *MultitaskingEnabled = ([self multitaskingEnabled]) ? @"Yes" : @"No";
    NSString *ProximitySensorEnabled = ([self proximitySensorEnabled]) ? @"Yes" : @"No";
    NSString *DebuggerAttached = ([self debuggerAttached]) ? @"Yes" : @"No";
    NSString *PluggedIn = ([self pluggedIn]) ? @"Yes" : @"No";
    NSString *Jailbroken = [NSString stringWithFormat:@"%d", [self jailbroken]];
    NSString *NumberProcessors = [NSString stringWithFormat:@"%ld", (long)[self numberProcessors]];
    NSString *NumberActiveProcessors = [NSString stringWithFormat:@"%ld", (long)[self numberActiveProcessors]];
    NSString *ProcessorSpeed = [NSString stringWithFormat:@"%ld", (long)[self processorSpeed]];
    NSString *ProcessorBusSpeed = [NSString stringWithFormat:@"%ld", (long)[self processorBusSpeed]];
    NSString *AccessoriesAttached = ([self accessoriesAttached]) ? @"Yes" : @"No";
    NSString *HeadphonesAttached = ([self headphonesAttached]) ? @"Yes" : @"No";
    NSString *NumberAttachedAccessories = [NSString stringWithFormat:@"%ld", (long)[self numberAttachedAccessories]];
    NSString *NameAttachedAccessories = [self nameAttachedAccessories];
    NSString *CarrierName = [self carrierName];
    NSString *CarrierCountry = [self carrierCountry];
    NSString *CarrierMobileCountryCode = [self carrierMobileCountryCode];
    NSString *CarrierISOCountryCode = [self carrierISOCountryCode];
    NSString *CarrierMobileNetworkCode = [self carrierMobileNetworkCode];
    NSString *CarrierAllowsVOIP = ([self carrierAllowsVOIP]) ? @"Yes" : @"No";
    NSString *BatteryLevel = [NSString stringWithFormat:@"%f", [self batteryLevel]];
    NSString *Charging = ([self charging]) ? @"Yes" : @"No";
    NSString *FullyCharged = ([self fullyCharged]) ? @"Yes" : @"No";
    NSString *CurrentIPAddress = [self currentIPAddress];
    NSString *CurrentMACAddress = [self currentMACAddress];
    NSString *ExternalIPAddress = [self externalIPAddress];
    NSString *CellIPAddress = [self cellIPAddress];
    NSString *CellMACAddress = [self cellMACAddress];
    NSString *CellNetmaskAddress = [self cellNetmaskAddress];
    NSString *CellBroadcastAddress = [self cellBroadcastAddress];
    NSString *WiFiIPAddress = [self wiFiIPAddress];
    NSString *WiFiMACAddress = [self wiFiMACAddress];
    NSString *WiFiNetmaskAddress = [self wiFiNetmaskAddress];
    NSString *WiFiBroadcastAddress = [self wiFiBroadcastAddress];
    NSString *WiFiRouterAddress = [self wiFiRouterAddress];
    NSString *ConnectedToWiFi = ([self connectedToWiFi]) ? @"Yes" : @"No";
    NSString *ConnectedToCellNetwork = ([self connectedToCellNetwork]) ? @"Yes" : @"No";
    NSString *ProcessID = [NSString stringWithFormat:@"%d", [self processID]];
    NSString *ProcessName = [self processName];
    NSString *ProcessStatus = [NSString stringWithFormat:@"%d", [self processStatus]];
    NSString *ParentPID = [NSString stringWithFormat:@"%d", [self parentPID]];
    NSMutableArray *ProcessesInformation = [self processesInformation];
    NSString *DiskSpace = [self diskSpace];
    NSString *FreeDiskSpaceNO = [self freeDiskSpaceinRaw];
    NSString *FreeDiskSpaceYES = [self freeDiskSpaceinPercent];
    NSString *UsedDiskSpaceNO = [self usedDiskSpaceinRaw];
    NSString *UsedDiskSpaceYES = [self usedDiskSpaceinPercent];
    NSString *LongDiskSpace = [NSString stringWithFormat:@"%lld", [self longDiskSpace]];
    NSString *LongFreeDiskSpace = [NSString stringWithFormat:@"%lld", [self longFreeDiskSpace]];
    NSString *TotalMemory = [NSString stringWithFormat:@"%f", [self totalMemory]];
    NSString *FreeMemoryNO = [NSString stringWithFormat:@"%f", [self freeMemoryinRaw]];
    NSString *FreeMemoryYES = [NSString stringWithFormat:@"%f", [self freeMemoryinPercent]];
    NSString *UsedMemoryNO = [NSString stringWithFormat:@"%f", [self usedMemoryinRaw]];
    NSString *UsedMemoryYES = [NSString stringWithFormat:@"%f", [self usedMemoryinPercent]];
    NSString *ActiveMemoryNO = [NSString stringWithFormat:@"%f", [self activeMemoryinRaw]];
    NSString *ActiveMemoryYES = [NSString stringWithFormat:@"%f", [self activeMemoryinPercent]];
    NSString *InactiveMemoryNO = [NSString stringWithFormat:@"%f", [self inactiveMemoryinRaw]];
    NSString *InactiveMemoryYES = [NSString stringWithFormat:@"%f", [self inactiveMemoryinPercent]];
    NSString *WiredMemoryNO = [NSString stringWithFormat:@"%f", [self wiredMemoryinRaw]];
    NSString *WiredMemoryYES = [NSString stringWithFormat:@"%f", [self wiredMemoryinPercent]];
    NSString *PurgableMemoryNO = [NSString stringWithFormat:@"%f", [self purgableMemoryinRaw]];
    NSString *PurgableMemoryYES = [NSString stringWithFormat:@"%f", [self purgableMemoryinPercent]];
    NSString *DeviceOrientation = [NSString stringWithFormat:@"%ld", [self deviceOrientation]];
    NSString *Country = [self country];
    NSString *Language = [self language];
    NSString *TimeZone = [self timeZoneSS];
    NSString *Currency = [self currency];
    NSString *ApplicationVersion = [self applicationVersion];
    NSString *ClipboardContent = [self clipboardContent];
    NSString *UniqueID = [self uniqueID];
    NSString *DeviceSignature = [self deviceSignature];
    NSString *CFUUID = [self cfuuid];
    NSString *CPUUsage = [NSString stringWithFormat:@"%f", [self cpuUsage]];
    
    // Check to make sure all values are valid (if not, make them)
    if (SystemUptime == nil || SystemUptime.length <= 0) {
        // Invalid value
        SystemUptime = @"Unknown";
    }
    if (DeviceModel == nil || DeviceModel.length <= 0) {
        // Invalid value
        DeviceModel = @"Unknown";
    }
    if (DeviceName == nil || DeviceName.length <= 0) {
        // Invalid value
        DeviceName = @"Unknown";
    }
    if (SystemName == nil || SystemName.length <= 0) {
        // Invalid value
        SystemName = @"Unknown";
    }
    if (SystemVersion == nil || SystemVersion.length <= 0) {
        // Invalid value
        SystemVersion = @"Unknown";
    }
    if (SystemDeviceTypeFormattedNO == nil || SystemDeviceTypeFormattedNO.length <= 0) {
        // Invalid value
        SystemDeviceTypeFormattedNO = @"Unknown";
    }
    if (SystemDeviceTypeFormattedYES == nil || SystemDeviceTypeFormattedYES.length <= 0) {
        // Invalid value
        SystemDeviceTypeFormattedYES = @"Unknown";
    }
    if (ScreenWidth == nil || ScreenWidth.length <= 0) {
        // Invalid value
        ScreenWidth = @"Unknown";
    }
    if (ScreenHeight == nil || ScreenHeight.length <= 0) {
        // Invalid value
        ScreenHeight = @"Unknown";
    }
    if (ScreenBrightness == nil || ScreenBrightness.length <= 0) {
        // Invalid value
        ScreenBrightness = @"Unknown";
    }
    if (MultitaskingEnabled == nil || MultitaskingEnabled.length <= 0) {
        // Invalid value
        MultitaskingEnabled = @"Unknown";
    }
    if (ProximitySensorEnabled == nil || ProximitySensorEnabled.length <= 0) {
        // Invalid value
        ProximitySensorEnabled = @"Unknown";
    }
    if (DebuggerAttached == nil || DebuggerAttached.length <= 0) {
        // Invalid value
        DebuggerAttached = @"Unknown";
    }
    if (PluggedIn == nil || PluggedIn.length <= 0) {
        // Invalid value
        PluggedIn = @"Unknown";
    }
    if (Jailbroken == nil || Jailbroken.length <= 0) {
        // Invalid value
        Jailbroken = @"Unknown";
    }
    if (NumberProcessors == nil || NumberProcessors.length <= 0) {
        // Invalid value
        NumberProcessors = @"Unknown";
    }
    if (NumberActiveProcessors == nil || NumberActiveProcessors.length <= 0) {
        // Invalid value
        NumberActiveProcessors = @"Unknown";
    }
    if (ProcessorSpeed == nil || ProcessorSpeed.length <= 0) {
        // Invalid value
        ProcessorSpeed = @"Unknown";
    }
    if (ProcessorBusSpeed == nil || ProcessorBusSpeed.length <= 0) {
        // Invalid value
        ProcessorBusSpeed = @"Unknown";
    }
    if (AccessoriesAttached == nil || AccessoriesAttached.length <= 0) {
        // Invalid value
        AccessoriesAttached = @"Unknown";
    }
    if (HeadphonesAttached == nil || HeadphonesAttached.length <= 0) {
        // Invalid value
        HeadphonesAttached = @"Unknown";
    }
    if (NumberAttachedAccessories == nil || NumberAttachedAccessories.length <= 0) {
        // Invalid value
        NumberAttachedAccessories = @"Unknown";
    }
    if (NameAttachedAccessories == nil || NameAttachedAccessories.length <= 0) {
        // Invalid value
        NameAttachedAccessories = @"Unknown";
    }
    if (CarrierName == nil || CarrierName.length <= 0) {
        // Invalid value
        CarrierName = @"Unknown";
    }
    if (CarrierCountry == nil || CarrierCountry.length <= 0) {
        // Invalid value
        CarrierCountry = @"Unknown";
    }
    if (CarrierMobileCountryCode == nil || CarrierMobileCountryCode.length <= 0) {
        // Invalid value
        CarrierMobileCountryCode = @"Unknown";
    }
    if (CarrierISOCountryCode == nil || CarrierISOCountryCode.length <= 0) {
        // Invalid value
        CarrierISOCountryCode = @"Unknown";
    }
    if (CarrierMobileNetworkCode == nil || CarrierMobileNetworkCode.length <= 0) {
        // Invalid value
        CarrierMobileNetworkCode = @"Unknown";
    }
    if (CarrierAllowsVOIP == nil || CarrierAllowsVOIP.length <= 0) {
        // Invalid value
        CarrierAllowsVOIP = @"Unknown";
    }
    if (BatteryLevel == nil || BatteryLevel.length <= 0) {
        // Invalid value
        BatteryLevel = @"Unknown";
    }
    if (Charging == nil || Charging.length <= 0) {
        // Invalid value
        Charging = @"Unknown";
    }
    if (FullyCharged == nil || FullyCharged.length <= 0) {
        // Invalid value
        FullyCharged = @"Unknown";
    }
    if (CurrentIPAddress == nil || CurrentIPAddress.length <= 0) {
        // Invalid value
        CurrentIPAddress = @"Unknown";
    }
    if (CurrentMACAddress == nil || CurrentMACAddress.length <= 0) {
        // Invalid value
        CurrentMACAddress = @"Unknown";
    }
    if (ExternalIPAddress == nil || ExternalIPAddress.length <= 0) {
        // Invalid value
        ExternalIPAddress = @"Unknown";
    }
    if (CellIPAddress == nil || CellIPAddress.length <= 0) {
        // Invalid value
        CellIPAddress = @"Unknown";
    }
    if (CellMACAddress == nil || CellMACAddress.length <= 0) {
        // Invalid value
        CellMACAddress = @"Unknown";
    }
    if (CellNetmaskAddress == nil || CellNetmaskAddress.length <= 0) {
        // Invalid value
        CellNetmaskAddress = @"Unknown";
    }
    if (CellBroadcastAddress == nil || CellBroadcastAddress.length <= 0) {
        // Invalid value
        CellBroadcastAddress = @"Unknown";
    }
    if (WiFiIPAddress == nil || WiFiIPAddress.length <= 0) {
        // Invalid value
        WiFiIPAddress = @"Unknown";
    }
    if (WiFiMACAddress == nil || WiFiMACAddress.length <= 0) {
        // Invalid value
        WiFiMACAddress = @"Unknown";
    }
    if (WiFiNetmaskAddress == nil || WiFiNetmaskAddress.length <= 0) {
        // Invalid value
        WiFiNetmaskAddress = @"Unknown";
    }
    if (WiFiBroadcastAddress == nil || WiFiBroadcastAddress.length <= 0) {
        // Invalid value
        WiFiBroadcastAddress = @"Unknown";
    }
    if (WiFiRouterAddress == nil || WiFiRouterAddress.length <= 0) {
        // Invalid value
        WiFiRouterAddress = @"Unknown";
    }
    if (ConnectedToWiFi == nil || ConnectedToWiFi.length <= 0) {
        // Invalid value
        ConnectedToWiFi = @"Unknown";
    }
    if (ConnectedToCellNetwork == nil || ConnectedToCellNetwork.length <= 0) {
        // Invalid value
        ConnectedToCellNetwork = @"Unknown";
    }
    if (ProcessID == nil || ProcessID.length <= 0) {
        // Invalid value
        ProcessID = @"Unknown";
    }
    if (ProcessName == nil || ProcessName.length <= 0) {
        // Invalid value
        ProcessName = @"Unknown";
    }
    if (ProcessStatus == nil || ProcessStatus.length <= 0) {
        // Invalid value
        ProcessStatus = @"Unknown";
    }
    if (ParentPID == nil || ParentPID.length <= 0) {
        // Invalid value
        ParentPID = @"Unknown";
    }
    if (ProcessesInformation == nil || ProcessesInformation.count <= 0) {
        // Invalid value
        ProcessesInformation = [NSMutableArray arrayWithObject:@"Unknown"];
    }
    if (DiskSpace == nil || DiskSpace.length <= 0) {
        // Invalid value
        DiskSpace = @"Unknown";
    }
    if (FreeDiskSpaceNO == nil || FreeDiskSpaceNO.length <= 0) {
        // Invalid value
        FreeDiskSpaceNO = @"Unknown";
    }
    if (FreeDiskSpaceYES == nil || FreeDiskSpaceYES.length <= 0) {
        // Invalid value
        FreeDiskSpaceYES = @"Unknown";
    }
    if (UsedDiskSpaceNO == nil || UsedDiskSpaceNO.length <= 0) {
        // Invalid value
        UsedDiskSpaceNO = @"Unknown";
    }
    if (UsedDiskSpaceYES == nil || UsedDiskSpaceYES.length <= 0) {
        // Invalid value
        UsedDiskSpaceYES = @"Unknown";
    }
    if (LongDiskSpace == nil || LongDiskSpace.length <= 0) {
        // Invalid value
        LongDiskSpace = @"Unknown";
    }
    if (LongFreeDiskSpace == nil || LongFreeDiskSpace.length <= 0) {
        // Invalid value
        LongFreeDiskSpace = @"Unknown";
    }
    if (TotalMemory == nil || TotalMemory.length <= 0) {
        // Invalid value
        TotalMemory = @"Unknown";
    }
    if (FreeMemoryNO == nil || FreeMemoryNO.length <= 0) {
        // Invalid value
        FreeMemoryNO = @"Unknown";
    }
    if (FreeMemoryYES == nil || FreeMemoryYES.length <= 0) {
        // Invalid value
        FreeMemoryYES = @"Unknown";
    }
    if (UsedMemoryNO == nil || UsedMemoryNO.length <= 0) {
        // Invalid value
        UsedMemoryNO = @"Unknown";
    }
    if (UsedMemoryYES == nil || UsedMemoryYES.length <= 0) {
        // Invalid value
        UsedMemoryYES = @"Unknown";
    }
    if (ActiveMemoryNO == nil || ActiveMemoryNO.length <= 0) {
        // Invalid value
        ActiveMemoryNO = @"Unknown";
    }
    if (ActiveMemoryYES == nil || ActiveMemoryYES.length <= 0) {
        // Invalid value
        ActiveMemoryYES = @"Unknown";
    }
    if (InactiveMemoryNO == nil || InactiveMemoryNO.length <= 0) {
        // Invalid value
        InactiveMemoryNO = @"Unknown";
    }
    if (InactiveMemoryYES == nil || InactiveMemoryYES.length <= 0) {
        // Invalid value
        InactiveMemoryYES = @"Unknown";
    }
    if (WiredMemoryNO == nil || WiredMemoryNO.length <= 0) {
        // Invalid value
        WiredMemoryNO = @"Unknown";
    }
    if (WiredMemoryYES == nil || WiredMemoryYES.length <= 0) {
        // Invalid value
        WiredMemoryYES = @"Unknown";
    }
    if (PurgableMemoryNO == nil || PurgableMemoryNO.length <= 0) {
        // Invalid value
        PurgableMemoryNO = @"Unknown";
    }
    if (PurgableMemoryYES == nil || PurgableMemoryYES.length <= 0) {
        // Invalid value
        PurgableMemoryYES = @"Unknown";
    }
    if (DeviceOrientation == nil || DeviceOrientation.length <= 0) {
        // Invalid value
        DeviceOrientation = @"Unknown";
    }
    if (Country == nil || Country.length <= 0) {
        // Invalid value
        Country = @"Unknown";
    }
    if (Language == nil || Language.length <= 0) {
        // Invalid value
        Language = @"Unknown";
    }
    if (TimeZone == nil || TimeZone.length <= 0) {
        // Invalid value
        TimeZone = @"Unknown";
    }
    if (Currency == nil || Currency.length <= 0) {
        // Invalid value
        Currency = @"Unknown";
    }
    if (ApplicationVersion == nil || ApplicationVersion.length <= 0) {
        // Invalid value
        ApplicationVersion = @"Unknown";
    }
    if (ClipboardContent == nil || ClipboardContent.length <= 0) {
        // Invalid value
        ClipboardContent = @"Unknown";
    }
    if (UniqueID == nil || UniqueID.length <= 0) {
        // Invalid value
        UniqueID = @"Unknown";
    }
    if (DeviceSignature == nil || DeviceSignature.length <= 0) {
        // Invalid value
        DeviceSignature = @"Unknown";
    }
    if (CFUUID == nil || CFUUID.length <= 0) {
        // Invalid value
        CFUUID = @"Unknown";
    }
    if (CPUUsage == nil || CPUUsage.length <= 0) {
        // Invalid value
        CPUUsage = @"Unknown";
    }
    
    // Get all Information in a dictionary
    SystemInformationDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                 SystemUptime,
                                                                 DeviceModel,
                                                                 DeviceName,
                                                                 SystemName,
                                                                 SystemVersion,
                                                                 SystemDeviceTypeFormattedNO,
                                                                 SystemDeviceTypeFormattedYES,
                                                                 ScreenWidth,
                                                                 ScreenHeight,
                                                                 ScreenBrightness,
                                                                 MultitaskingEnabled,
                                                                 ProximitySensorEnabled,
                                                                 DebuggerAttached,
                                                                 PluggedIn,
                                                                 Jailbroken,
                                                                 NumberProcessors,
                                                                 NumberActiveProcessors,
                                                                 ProcessorSpeed,
                                                                 ProcessorBusSpeed,
                                                                 AccessoriesAttached,
                                                                 HeadphonesAttached,
                                                                 NumberAttachedAccessories,
                                                                 NameAttachedAccessories,
                                                                 CarrierName,
                                                                 CarrierCountry,
                                                                 CarrierMobileCountryCode,
                                                                 CarrierISOCountryCode,
                                                                 CarrierMobileNetworkCode,
                                                                 CarrierAllowsVOIP,
                                                                 BatteryLevel,
                                                                 Charging,
                                                                 FullyCharged,
                                                                 CurrentIPAddress,
                                                                 CurrentMACAddress,
                                                                 ExternalIPAddress,
                                                                 CellIPAddress,
                                                                 CellMACAddress,
                                                                 CellNetmaskAddress,
                                                                 CellBroadcastAddress,
                                                                 WiFiIPAddress,
                                                                 WiFiMACAddress,
                                                                 WiFiNetmaskAddress,
                                                                 WiFiBroadcastAddress,
                                                                 WiFiRouterAddress,
                                                                 ConnectedToWiFi,
                                                                 ConnectedToCellNetwork,
                                                                 ProcessID,
                                                                 ProcessName,
                                                                 ProcessStatus,
                                                                 ParentPID,
                                                                 ProcessesInformation,
                                                                 DiskSpace,
                                                                 FreeDiskSpaceNO,
                                                                 FreeDiskSpaceYES,
                                                                 UsedDiskSpaceNO,
                                                                 UsedDiskSpaceYES,
                                                                 LongDiskSpace,
                                                                 LongFreeDiskSpace,
                                                                 TotalMemory,
                                                                 FreeMemoryNO,
                                                                 FreeMemoryYES,
                                                                 UsedMemoryNO,
                                                                 UsedMemoryYES,
                                                                 ActiveMemoryNO,
                                                                 ActiveMemoryYES,
                                                                 InactiveMemoryNO,
                                                                 InactiveMemoryYES,
                                                                 WiredMemoryNO,
                                                                 WiredMemoryYES,
                                                                 PurgableMemoryNO,
                                                                 PurgableMemoryYES,
                                                                 DeviceOrientation,
                                                                 Country,
                                                                 Language,
                                                                 TimeZone,
                                                                 Currency,
                                                                 ApplicationVersion,
                                                                 ClipboardContent,
                                                                 UniqueID,
                                                                 DeviceSignature,
                                                                 CFUUID,
                                                                 CPUUsage,
                                                                 nil]
                                                        forKeys:[NSArray arrayWithObjects:
                                                                 @"Uptime (dd hh mm)",
                                                                 @"DeviceModel",
                                                                 @"DeviceName",
                                                                 @"SystemName",
                                                                 @"SystemVersion",
                                                                 @"SystemDeviceType",
                                                                 @"SystemDeviceType Formatted",
                                                                 @"ScreenWidth",
                                                                 @"ScreenHeight",
                                                                 @"ScreenBrightness",
                                                                 @"MultitaskingEnabled",
                                                                 @"ProximitySensorEnabled",
                                                                 @"DebuggerAttached",
                                                                 @"PluggedIn",
                                                                 @"Jailbroken",
                                                                 @"NumberProcessors",
                                                                 @"NumberActiveProcessors",
                                                                 @"ProcessorSpeed",
                                                                 @"ProcessorBusSpeed",
                                                                 @"AccessoriesAttached",
                                                                 @"HeadphonesAttached",
                                                                 @"NumberAttachedAccessories",
                                                                 @"NameAttachedAccessories",
                                                                 @"CarrierName",
                                                                 @"CarrierCountry",
                                                                 @"CarrierMobileCountryCode",
                                                                 @"CarrierISOCountryCode",
                                                                 @"CarrierMobileNetworkCode",
                                                                 @"CarrierAllowsVOIP",
                                                                 @"BatteryLevel",
                                                                 @"Charging",
                                                                 @"FullyCharged",
                                                                 @"CurrentIPAddress",
                                                                 @"CurrentMACAddress",
                                                                 @"External IP Address",
                                                                 @"CellIPAddress",
                                                                 @"CellMACAddress",
                                                                 @"CellNetmaskAddress",
                                                                 @"CellBroadcastAddress",
                                                                 @"WiFiIPAddress",
                                                                 @"WiFiMACAddress",
                                                                 @"WiFiNetmaskAddress",
                                                                 @"WiFiBroadcastAddress",
                                                                 @"WiFiRouterAddress",
                                                                 @"ConnectedToWiFi",
                                                                 @"ConnectedToCellNetwork",
                                                                 @"ProcessID",
                                                                 @"ProcessName",
                                                                 @"ProcessStatus",
                                                                 @"ParentPID",
                                                                 @"ProcessesInformation",
                                                                 @"DiskSpace",
                                                                 @"FreeDiskSpace (Not Formatted)",
                                                                 @"FreeDiskSpace (Formatted)",
                                                                 @"UsedDiskSpace (Not Formatted)",
                                                                 @"UsedDiskSpace (Formatted)",
                                                                 @"LongDiskSpace",
                                                                 @"LongFreeDiskSpace",
                                                                 @"TotalMemory",
                                                                 @"FreeMemory (Not Formatted)",
                                                                 @"FreeMemory (Formatted)",
                                                                 @"UsedMemory (Not Formatted)",
                                                                 @"UsedMemory (Formatted)",
                                                                 @"ActiveMemory (Not Formatted)",
                                                                 @"ActiveMemory (Formatted)",
                                                                 @"InactiveMemory (Not Formatted)",
                                                                 @"InactiveMemory (Formatted)",
                                                                 @"WiredMemory (Not Formatted)",
                                                                 @"WiredMemory (Formatted)",
                                                                 @"PurgableMemory (Not Formatted)",
                                                                 @"PurgableMemory (Formatted)",
                                                                 @"DeviceOrientation",
                                                                 @"Country",
                                                                 @"Language",
                                                                 @"TimeZone",
                                                                 @"Currency",
                                                                 @"ApplicationVersion",
                                                                 @"ClipboardContent",
                                                                 @"UniqueID",
                                                                 @"DeviceSignature",
                                                                 @"CFUUID",
                                                                 @"CPUUsage",
                                                                 nil]];
    
    // Check if Dictionary is populated
    if (SystemInformationDict.count <= 0) {
        // Error, Dictionary is empty
        return nil;
    }
    
    // Successful
    return SystemInformationDict;
}

// Parent ID for a certain PID
- (int)parentPIDForProcess:(int)pid {
    // Get the Parent Process ID For a process
    int Number = [SSProcessInfo parentPIDForProcess:pid];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

@end
