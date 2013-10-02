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
}

// Get all System Information (All Methods)
- (NSDictionary *)getAllSystemInformation;

@end

@implementation SystemServices

@dynamic allSystemInformation, systemsUptime, deviceModel, deviceName, systemName, systemsVersion, systemDeviceTypeNotFormatted, systemDeviceTypeFormatted, screenWidth, screenHeight, screenBrightness, multitaskingEnabled, proximitySensorEnabled, debuggerAttached, pluggedIn, jailbroken, numberProcessors, numberActiveProcessors, processorSpeed, processorBusSpeed, accessoriesAttached, headphonesAttached, numberAttachedAccessories, nameAttachedAccessories, carrierName, carrierCountry, carrierMobileCountryCode, carrierISOCountryCode, carrierMobileNetworkCode, carrierAllowsVOIP, batteryLevel, charging, fullyCharged, currentIPAddress, currentMACAddress, externalIPAddress, cellIPAddress, cellMACAddress, cellNetmaskAddress, cellBroadcastAddress, wiFiIPAddress, wiFiMACAddress, wiFiNetmaskAddress, wiFiBroadcastAddress, connectedToWiFi, connectedToCellNetwork, processID, processName, processStatus, parentPID, processesInformation, diskSpace, freeDiskSpaceinRaw, freeDiskSpaceinPercent, usedDiskSpaceinRaw, usedDiskSpaceinPercent, longDiskSpace, longFreeDiskSpace, totalMemory, freeMemoryinRaw, freeMemoryinPercent, usedMemoryinRaw, usedMemoryinPercent, activeMemoryinRaw, activeMemoryinPercent, inactiveMemoryinRaw, inactiveMemoryinPercent, wiredMemoryinRaw, wiredMemoryinPercent, purgableMemoryinRaw, purgableMemoryinPercent, deviceOrientation, country, language, timeZoneSS, currency, applicationVersion, clipboardContent, uniqueID, deviceSignature, cfuuid;

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

- (NSString *)currentIPAddress {
    return [SSNetworkInfo currentIPAddress];
}

- (NSString *)currentMACAddress{
    return [SSNetworkInfo currentMACAddress];
}

- (NSString *)externalIPAddress {
    return [SSNetworkInfo externalIPAddress];
}

- (NSString *)cellIPAddress {
    return [SSNetworkInfo cellIPAddress];
}

- (NSString *)cellMACAddress {
    return [SSNetworkInfo cellMACAddress];
}

- (NSString *)cellNetmaskAddress {
    return [SSNetworkInfo cellNetmaskAddress];
}

- (NSString *)cellBroadcastAddress {
    return [SSNetworkInfo cellBroadcastAddress];
}

- (NSString *)wiFiIPAddress {
    return [SSNetworkInfo wiFiIPAddress];
}

- (NSString *)wiFiMACAddress {
    return [SSNetworkInfo wiFiMACAddress];
}

- (NSString *)wiFiNetmaskAddress {
    return [SSNetworkInfo wiFiNetmaskAddress];
}

- (NSString *)wiFiBroadcastAddress {
    return [SSNetworkInfo wiFiBroadcastAddress];
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
    NSString *ScreenWidth = [NSString stringWithFormat:@"%d", [self screenWidth]];
    NSString *ScreenHeight = [NSString stringWithFormat:@"%d", [self screenHeight]];
    NSString *ScreenBrightness = [NSString stringWithFormat:@"%f", [self screenBrightness]];
    NSString *MultitaskingEnabled = ([self multitaskingEnabled]) ? @"Yes" : @"No";
    NSString *ProximitySensorEnabled = ([self proximitySensorEnabled]) ? @"Yes" : @"No";
    NSString *DebuggerAttached = ([self debuggerAttached]) ? @"Yes" : @"No";
    NSString *PluggedIn = ([self pluggedIn]) ? @"Yes" : @"No";
    NSString *Jailbroken = [NSString stringWithFormat:@"%d", [self jailbroken]];
    NSString *NumberProcessors = [NSString stringWithFormat:@"%d", [self numberProcessors]];
    NSString *NumberActiveProcessors = [NSString stringWithFormat:@"%d", [self numberActiveProcessors]];
    NSString *ProcessorSpeed = [NSString stringWithFormat:@"%d", [self processorSpeed]];
    NSString *ProcessorBusSpeed = [NSString stringWithFormat:@"%d", [self processorBusSpeed]];
    NSString *AccessoriesAttached = ([self accessoriesAttached]) ? @"Yes" : @"No";
    NSString *HeadphonesAttached = ([self headphonesAttached]) ? @"Yes" : @"No";
    NSString *NumberAttachedAccessories = [NSString stringWithFormat:@"%d", [self numberAttachedAccessories]];
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
    NSString *DeviceOrientation = [NSString stringWithFormat:@"%d", [self deviceOrientation]];
    NSString *Country = [self country];
    NSString *Language = [self language];
    NSString *TimeZone = [self timeZoneSS];
    NSString *Currency = [self currency];
    NSString *ApplicationVersion = [self applicationVersion];
    NSString *ClipboardContent = [self clipboardContent];
    NSString *UniqueID = [self uniqueID];
    NSString *DeviceSignature = [self deviceSignature];
    NSString *CFUUID = [self cfuuid];
    
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
