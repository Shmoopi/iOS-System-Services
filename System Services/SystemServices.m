//
//  SystemServices.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServices.h"

@interface SystemServices ()

// Get all System Information (All Methods)
- (nullable NSDictionary *)getAllSystemInformation;

@end

@implementation SystemServices

@dynamic allSystemInformation, systemsUptime, deviceModel, deviceName, systemName, systemsVersion, systemDeviceTypeNotFormatted, systemDeviceTypeFormatted, screenWidth, screenHeight, screenBrightness, multitaskingEnabled, proximitySensorEnabled, debuggerAttached, pluggedIn, jailbroken, numberProcessors, numberActiveProcessors, processorsUsage, accessoriesAttached, headphonesAttached, numberAttachedAccessories, nameAttachedAccessories, carrierName, carrierCountry, carrierMobileCountryCode, carrierISOCountryCode, carrierMobileNetworkCode, carrierAllowsVOIP, batteryLevel, charging, fullyCharged, currentIPAddress, externalIPAddress, cellIPAddress, cellNetmaskAddress, cellBroadcastAddress, wiFiIPAddress, wiFiNetmaskAddress, wiFiBroadcastAddress, wiFiRouterAddress, connectedToWiFi, connectedToCellNetwork, processID, diskSpace, freeDiskSpaceinRaw, freeDiskSpaceinPercent, usedDiskSpaceinRaw, usedDiskSpaceinPercent, longDiskSpace, longFreeDiskSpace, totalMemory, freeMemoryinRaw, freeMemoryinPercent, usedMemoryinRaw, usedMemoryinPercent, activeMemoryinRaw, activeMemoryinPercent, inactiveMemoryinRaw, inactiveMemoryinPercent, wiredMemoryinRaw, wiredMemoryinPercent, purgableMemoryinRaw, purgableMemoryinPercent, deviceOrientation, country, language, timeZoneSS, currency, applicationVersion, clipboardContent, cfuuid, applicationCPUUsage, stepCountingAvailable, distanceAvailable, floorCountingAvailable;

// Singleton
+ (nonnull instancetype)sharedServices {
    static SystemServices *sharedSystemServices = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSystemServices = [[self alloc] init];
    });
    return sharedSystemServices;
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

- (BOOL)stepCountingAvailable {
    return [SSHardwareInfo stepCountingAvailable];
}

- (BOOL)distanceAvailable {
    return [SSHardwareInfo distanceAvailable];
}

- (BOOL)floorCountingAvailable {
    return [SSHardwareInfo floorCountingAvailable];
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

- (nullable NSArray *)processorsUsage {
    return [SSProcessorInfo processorsUsage];
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

- (nullable NSString *)externalIPAddress {
    return [SSNetworkInfo externalIPAddress];
}

- (nullable NSString *)cellIPAddress {
    return [SSNetworkInfo cellIPAddress];
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

- (NSString *)cfuuid {
    return [SSUUID cfuuid];
}

- (float)applicationCPUUsage {
    return [SSApplicationInfo cpuUsage];
}

- (NSDictionary *)allSystemInformation {
    return [self getAllSystemInformation];
}

// Private //

// Get all System Information (All Methods)
- (NSDictionary *)getAllSystemInformation {
    
    // Create a dictionary
    NSDictionary *systemInformationDict;
    
    // Set up all System Values
    NSString *systemUptime = [self systemsUptime];
    NSString *deviceModel = [self deviceModel];
    NSString *deviceName = [self deviceName];
    NSString *systemName = [self systemName];
    NSString *systemVersion = [self systemsVersion];
    NSString *systemDeviceTypeFormattedNO = [self systemDeviceTypeNotFormatted];
    NSString *systemDeviceTypeFormattedYES = [self systemDeviceTypeFormatted];
    NSString *screenWidth = [NSString stringWithFormat:@"%ld", (long)[self screenWidth]];
    NSString *screenHeight = [NSString stringWithFormat:@"%ld", (long)[self screenHeight]];
    NSString *screenBrightness = [NSString stringWithFormat:@"%f", [self screenBrightness]];
    NSString *multitaskingEnabled = ([self multitaskingEnabled]) ? @"Yes" : @"No";
    NSString *proximitySensorEnabled = ([self proximitySensorEnabled]) ? @"Yes" : @"No";
    NSString *debuggerAttached = ([self debuggerAttached]) ? @"Yes" : @"No";
    NSString *pluggedIn = ([self pluggedIn]) ? @"Yes" : @"No";
    NSString *stepCountingAvailable = ([self stepCountingAvailable]) ? @"Yes" : @"No";
    NSString *distanceAvailable = ([self distanceAvailable]) ? @"Yes" : @"No";
    NSString *floorCountingAvailable = ([self floorCountingAvailable]) ? @"Yes" : @"No";
    NSString *jailbroken = [NSString stringWithFormat:@"%d", [self jailbroken]];
    NSString *numberProcessors = [NSString stringWithFormat:@"%ld", (long)[self numberProcessors]];
    NSString *numberActiveProcessors = [NSString stringWithFormat:@"%ld", (long)[self numberActiveProcessors]];
    NSString *processorsUsage = [NSString stringWithFormat:@"%@", [self processorsUsage]];
    NSString *accessoriesAttached = ([self accessoriesAttached]) ? @"Yes" : @"No";
    NSString *headphonesAttached = ([self headphonesAttached]) ? @"Yes" : @"No";
    NSString *numberAttachedAccessories = [NSString stringWithFormat:@"%ld", (long)[self numberAttachedAccessories]];
    NSString *nameAttachedAccessories = [self nameAttachedAccessories];
    NSString *carrierName = [self carrierName];
    NSString *carrierCountry = [self carrierCountry];
    NSString *carrierMobileCountryCode = [self carrierMobileCountryCode];
    NSString *carrierISOCountryCode = [self carrierISOCountryCode];
    NSString *carrierMobileNetworkCode = [self carrierMobileNetworkCode];
    NSString *carrierAllowsVOIP = ([self carrierAllowsVOIP]) ? @"Yes" : @"No";
    NSString *batteryLevel = [NSString stringWithFormat:@"%f", [self batteryLevel]];
    NSString *charging = ([self charging]) ? @"Yes" : @"No";
    NSString *fullyCharged = ([self fullyCharged]) ? @"Yes" : @"No";
    NSString *currentIPAddress = [self currentIPAddress];
    NSString *externalIPAddress = [self externalIPAddress];
    NSString *cellIPAddress = [self cellIPAddress];
    NSString *cellNetmaskAddress = [self cellNetmaskAddress];
    NSString *cellBroadcastAddress = [self cellBroadcastAddress];
    NSString *wiFiIPAddress = [self wiFiIPAddress];
    NSString *wiFiNetmaskAddress = [self wiFiNetmaskAddress];
    NSString *wiFiBroadcastAddress = [self wiFiBroadcastAddress];
    NSString *wiFiRouterAddress = [self wiFiRouterAddress];
    NSString *connectedToWiFi = ([self connectedToWiFi]) ? @"Yes" : @"No";
    NSString *connectedToCellNetwork = ([self connectedToCellNetwork]) ? @"Yes" : @"No";
    NSString *processID = [NSString stringWithFormat:@"%d", [self processID]];
    NSString *diskSpace = [self diskSpace];
    NSString *freeDiskSpaceNO = [self freeDiskSpaceinRaw];
    NSString *freeDiskSpaceYES = [self freeDiskSpaceinPercent];
    NSString *usedDiskSpaceNO = [self usedDiskSpaceinRaw];
    NSString *usedDiskSpaceYES = [self usedDiskSpaceinPercent];
    NSString *longDiskSpace = [NSString stringWithFormat:@"%lld", [self longDiskSpace]];
    NSString *longFreeDiskSpace = [NSString stringWithFormat:@"%lld", [self longFreeDiskSpace]];
    NSString *totalMemory = [NSString stringWithFormat:@"%f", [self totalMemory]];
    NSString *freeMemoryNO = [NSString stringWithFormat:@"%f", [self freeMemoryinRaw]];
    NSString *freeMemoryYES = [NSString stringWithFormat:@"%f", [self freeMemoryinPercent]];
    NSString *usedMemoryNO = [NSString stringWithFormat:@"%f", [self usedMemoryinRaw]];
    NSString *usedMemoryYES = [NSString stringWithFormat:@"%f", [self usedMemoryinPercent]];
    NSString *activeMemoryNO = [NSString stringWithFormat:@"%f", [self activeMemoryinRaw]];
    NSString *activeMemoryYES = [NSString stringWithFormat:@"%f", [self activeMemoryinPercent]];
    NSString *inactiveMemoryNO = [NSString stringWithFormat:@"%f", [self inactiveMemoryinRaw]];
    NSString *inactiveMemoryYES = [NSString stringWithFormat:@"%f", [self inactiveMemoryinPercent]];
    NSString *wiredMemoryNO = [NSString stringWithFormat:@"%f", [self wiredMemoryinRaw]];
    NSString *wiredMemoryYES = [NSString stringWithFormat:@"%f", [self wiredMemoryinPercent]];
    NSString *purgableMemoryNO = [NSString stringWithFormat:@"%f", [self purgableMemoryinRaw]];
    NSString *purgableMemoryYES = [NSString stringWithFormat:@"%f", [self purgableMemoryinPercent]];
    NSString *deviceOrientation = [NSString stringWithFormat:@"%ld", (long)[self deviceOrientation]];
    NSString *country = [self country];
    NSString *language = [self language];
    NSString *timeZone = [self timeZoneSS];
    NSString *currency = [self currency];
    NSString *applicationVersion = [self applicationVersion];
    NSString *clipboardContent = [self clipboardContent];
    NSString *cFUUID = [self cfuuid];
    NSString *cPUUsage = [NSString stringWithFormat:@"%f", [self applicationCPUUsage]];
    
    // Check to make sure all values are valid (if not, make them)
    if (systemUptime == nil || systemUptime.length <= 0) {
        // Invalid value
        systemUptime = @"Unknown";
    }
    if (deviceModel == nil || deviceModel.length <= 0) {
        // Invalid value
        deviceModel = @"Unknown";
    }
    if (deviceName == nil || deviceName.length <= 0) {
        // Invalid value
        deviceName = @"Unknown";
    }
    if (systemName == nil || systemName.length <= 0) {
        // Invalid value
        systemName = @"Unknown";
    }
    if (systemVersion == nil || systemVersion.length <= 0) {
        // Invalid value
        systemVersion = @"Unknown";
    }
    if (systemDeviceTypeFormattedNO == nil || systemDeviceTypeFormattedNO.length <= 0) {
        // Invalid value
        systemDeviceTypeFormattedNO = @"Unknown";
    }
    if (systemDeviceTypeFormattedYES == nil || systemDeviceTypeFormattedYES.length <= 0) {
        // Invalid value
        systemDeviceTypeFormattedYES = @"Unknown";
    }
    if (screenWidth == nil || screenWidth.length <= 0) {
        // Invalid value
        screenWidth = @"Unknown";
    }
    if (screenHeight == nil || screenHeight.length <= 0) {
        // Invalid value
        screenHeight = @"Unknown";
    }
    if (screenBrightness == nil || screenBrightness.length <= 0) {
        // Invalid value
        screenBrightness = @"Unknown";
    }
    if (multitaskingEnabled == nil || multitaskingEnabled.length <= 0) {
        // Invalid value
        multitaskingEnabled = @"Unknown";
    }
    if (proximitySensorEnabled == nil || proximitySensorEnabled.length <= 0) {
        // Invalid value
        proximitySensorEnabled = @"Unknown";
    }
    if (debuggerAttached == nil || debuggerAttached.length <= 0) {
        // Invalid value
        debuggerAttached = @"Unknown";
    }
    if (pluggedIn == nil || pluggedIn.length <= 0) {
        // Invalid value
        pluggedIn = @"Unknown";
    }
    if (stepCountingAvailable == nil || stepCountingAvailable.length <= 0) {
        // Invalid value
        stepCountingAvailable = @"Unknown";
    }
    if (distanceAvailable == nil || distanceAvailable.length <= 0) {
        // Invalid value
        distanceAvailable = @"Unknown";
    }
    if (floorCountingAvailable == nil || floorCountingAvailable.length <= 0) {
        // Invalid value
        floorCountingAvailable = @"Unknown";
    }
    if (jailbroken == nil || jailbroken.length <= 0) {
        // Invalid value
        jailbroken = @"Unknown";
    }
    if (numberProcessors == nil || numberProcessors.length <= 0) {
        // Invalid value
        numberProcessors = @"Unknown";
    }
    if (numberActiveProcessors == nil || numberActiveProcessors.length <= 0) {
        // Invalid value
        numberActiveProcessors = @"Unknown";
    }
    if (processorsUsage == nil || processorsUsage.length <= 0) {
        // Invalid value
        processorsUsage = @"Unknown";
    }
    if (accessoriesAttached == nil || accessoriesAttached.length <= 0) {
        // Invalid value
        accessoriesAttached = @"Unknown";
    }
    if (headphonesAttached == nil || headphonesAttached.length <= 0) {
        // Invalid value
        headphonesAttached = @"Unknown";
    }
    if (numberAttachedAccessories == nil || numberAttachedAccessories.length <= 0) {
        // Invalid value
        numberAttachedAccessories = @"Unknown";
    }
    if (nameAttachedAccessories == nil || nameAttachedAccessories.length <= 0) {
        // Invalid value
        nameAttachedAccessories = @"Unknown";
    }
    if (carrierName == nil || carrierName.length <= 0) {
        // Invalid value
        carrierName = @"Unknown";
    }
    if (carrierCountry == nil || carrierCountry.length <= 0) {
        // Invalid value
        carrierCountry = @"Unknown";
    }
    if (carrierMobileCountryCode == nil || carrierMobileCountryCode.length <= 0) {
        // Invalid value
        carrierMobileCountryCode = @"Unknown";
    }
    if (carrierISOCountryCode == nil || carrierISOCountryCode.length <= 0) {
        // Invalid value
        carrierISOCountryCode = @"Unknown";
    }
    if (carrierMobileNetworkCode == nil || carrierMobileNetworkCode.length <= 0) {
        // Invalid value
        carrierMobileNetworkCode = @"Unknown";
    }
    if (carrierAllowsVOIP == nil || carrierAllowsVOIP.length <= 0) {
        // Invalid value
        carrierAllowsVOIP = @"Unknown";
    }
    if (batteryLevel == nil || batteryLevel.length <= 0) {
        // Invalid value
        batteryLevel = @"Unknown";
    }
    if (charging == nil || charging.length <= 0) {
        // Invalid value
        charging = @"Unknown";
    }
    if (fullyCharged == nil || fullyCharged.length <= 0) {
        // Invalid value
        fullyCharged = @"Unknown";
    }
    if (currentIPAddress == nil || currentIPAddress.length <= 0) {
        // Invalid value
        currentIPAddress = @"Unknown";
    }
    if (externalIPAddress == nil || externalIPAddress.length <= 0) {
        // Invalid value
        externalIPAddress = @"Unknown";
    }
    if (cellIPAddress == nil || cellIPAddress.length <= 0) {
        // Invalid value
        cellIPAddress = @"Unknown";
    }
    if (cellNetmaskAddress == nil || cellNetmaskAddress.length <= 0) {
        // Invalid value
        cellNetmaskAddress = @"Unknown";
    }
    if (cellBroadcastAddress == nil || cellBroadcastAddress.length <= 0) {
        // Invalid value
        cellBroadcastAddress = @"Unknown";
    }
    if (wiFiIPAddress == nil || wiFiIPAddress.length <= 0) {
        // Invalid value
        wiFiIPAddress = @"Unknown";
    }
    if (wiFiNetmaskAddress == nil || wiFiNetmaskAddress.length <= 0) {
        // Invalid value
        wiFiNetmaskAddress = @"Unknown";
    }
    if (wiFiBroadcastAddress == nil || wiFiBroadcastAddress.length <= 0) {
        // Invalid value
        wiFiBroadcastAddress = @"Unknown";
    }
    if (wiFiRouterAddress == nil || wiFiRouterAddress.length <= 0) {
        // Invalid value
        wiFiRouterAddress = @"Unknown";
    }
    if (connectedToWiFi == nil || connectedToWiFi.length <= 0) {
        // Invalid value
        connectedToWiFi = @"Unknown";
    }
    if (connectedToCellNetwork == nil || connectedToCellNetwork.length <= 0) {
        // Invalid value
        connectedToCellNetwork = @"Unknown";
    }
    if (processID == nil || processID.length <= 0) {
        // Invalid value
        processID = @"Unknown";
    }
    if (diskSpace == nil || diskSpace.length <= 0) {
        // Invalid value
        diskSpace = @"Unknown";
    }
    if (freeDiskSpaceNO == nil || freeDiskSpaceNO.length <= 0) {
        // Invalid value
        freeDiskSpaceNO = @"Unknown";
    }
    if (freeDiskSpaceYES == nil || freeDiskSpaceYES.length <= 0) {
        // Invalid value
        freeDiskSpaceYES = @"Unknown";
    }
    if (usedDiskSpaceNO == nil || usedDiskSpaceNO.length <= 0) {
        // Invalid value
        usedDiskSpaceNO = @"Unknown";
    }
    if (usedDiskSpaceYES == nil || usedDiskSpaceYES.length <= 0) {
        // Invalid value
        usedDiskSpaceYES = @"Unknown";
    }
    if (longDiskSpace == nil || longDiskSpace.length <= 0) {
        // Invalid value
        longDiskSpace = @"Unknown";
    }
    if (longFreeDiskSpace == nil || longFreeDiskSpace.length <= 0) {
        // Invalid value
        longFreeDiskSpace = @"Unknown";
    }
    if (totalMemory == nil || totalMemory.length <= 0) {
        // Invalid value
        totalMemory = @"Unknown";
    }
    if (freeMemoryNO == nil || freeMemoryNO.length <= 0) {
        // Invalid value
        freeMemoryNO = @"Unknown";
    }
    if (freeMemoryYES == nil || freeMemoryYES.length <= 0) {
        // Invalid value
        freeMemoryYES = @"Unknown";
    }
    if (usedMemoryNO == nil || usedMemoryNO.length <= 0) {
        // Invalid value
        usedMemoryNO = @"Unknown";
    }
    if (usedMemoryYES == nil || usedMemoryYES.length <= 0) {
        // Invalid value
        usedMemoryYES = @"Unknown";
    }
    if (activeMemoryNO == nil || activeMemoryNO.length <= 0) {
        // Invalid value
        activeMemoryNO = @"Unknown";
    }
    if (activeMemoryYES == nil || activeMemoryYES.length <= 0) {
        // Invalid value
        activeMemoryYES = @"Unknown";
    }
    if (inactiveMemoryNO == nil || inactiveMemoryNO.length <= 0) {
        // Invalid value
        inactiveMemoryNO = @"Unknown";
    }
    if (inactiveMemoryYES == nil || inactiveMemoryYES.length <= 0) {
        // Invalid value
        inactiveMemoryYES = @"Unknown";
    }
    if (wiredMemoryNO == nil || wiredMemoryNO.length <= 0) {
        // Invalid value
        wiredMemoryNO = @"Unknown";
    }
    if (wiredMemoryYES == nil || wiredMemoryYES.length <= 0) {
        // Invalid value
        wiredMemoryYES = @"Unknown";
    }
    if (purgableMemoryNO == nil || purgableMemoryNO.length <= 0) {
        // Invalid value
        purgableMemoryNO = @"Unknown";
    }
    if (purgableMemoryYES == nil || purgableMemoryYES.length <= 0) {
        // Invalid value
        purgableMemoryYES = @"Unknown";
    }
    if (deviceOrientation == nil || deviceOrientation.length <= 0) {
        // Invalid value
        deviceOrientation = @"Unknown";
    }
    if (country == nil || country.length <= 0) {
        // Invalid value
        country = @"Unknown";
    }
    if (language == nil || language.length <= 0) {
        // Invalid value
        language = @"Unknown";
    }
    if (timeZone == nil || timeZone.length <= 0) {
        // Invalid value
        timeZone = @"Unknown";
    }
    if (currency == nil || currency.length <= 0) {
        // Invalid value
        currency = @"Unknown";
    }
    if (applicationVersion == nil || applicationVersion.length <= 0) {
        // Invalid value
        applicationVersion = @"Unknown";
    }
    if (clipboardContent == nil || clipboardContent.length <= 0) {
        // Invalid value
        clipboardContent = @"Unknown";
    }
    if (cFUUID == nil || cFUUID.length <= 0) {
        // Invalid value
        cFUUID = @"Unknown";
    }
    if (cPUUsage == nil || cPUUsage.length <= 0) {
        // Invalid value
        cPUUsage = @"Unknown";
    }
    
    // Get all Information in a dictionary
    systemInformationDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                 systemUptime,
                                                                 deviceModel,
                                                                 deviceName,
                                                                 systemName,
                                                                 systemVersion,
                                                                 systemDeviceTypeFormattedNO,
                                                                 systemDeviceTypeFormattedYES,
                                                                 screenWidth,
                                                                 screenHeight,
                                                                 screenBrightness,
                                                                 multitaskingEnabled,
                                                                 proximitySensorEnabled,
                                                                 debuggerAttached,
                                                                 pluggedIn,
                                                                 stepCountingAvailable,
                                                                 distanceAvailable,
                                                                 floorCountingAvailable,
                                                                 jailbroken,
                                                                 numberProcessors,
                                                                 numberActiveProcessors,
                                                                 processorsUsage,
                                                                 accessoriesAttached,
                                                                 headphonesAttached,
                                                                 numberAttachedAccessories,
                                                                 nameAttachedAccessories,
                                                                 carrierName,
                                                                 carrierCountry,
                                                                 carrierMobileCountryCode,
                                                                 carrierISOCountryCode,
                                                                 carrierMobileNetworkCode,
                                                                 carrierAllowsVOIP,
                                                                 batteryLevel,
                                                                 charging,
                                                                 fullyCharged,
                                                                 currentIPAddress,
                                                                 externalIPAddress,
                                                                 cellIPAddress,
                                                                 cellNetmaskAddress,
                                                                 cellBroadcastAddress,
                                                                 wiFiIPAddress,
                                                                 wiFiNetmaskAddress,
                                                                 wiFiBroadcastAddress,
                                                                 wiFiRouterAddress,
                                                                 connectedToWiFi,
                                                                 connectedToCellNetwork,
                                                                 processID,
                                                                 diskSpace,
                                                                 freeDiskSpaceNO,
                                                                 freeDiskSpaceYES,
                                                                 usedDiskSpaceNO,
                                                                 usedDiskSpaceYES,
                                                                 longDiskSpace,
                                                                 longFreeDiskSpace,
                                                                 totalMemory,
                                                                 freeMemoryNO,
                                                                 freeMemoryYES,
                                                                 usedMemoryNO,
                                                                 usedMemoryYES,
                                                                 activeMemoryNO,
                                                                 activeMemoryYES,
                                                                 inactiveMemoryNO,
                                                                 inactiveMemoryYES,
                                                                 wiredMemoryNO,
                                                                 wiredMemoryYES,
                                                                 purgableMemoryNO,
                                                                 purgableMemoryYES,
                                                                 deviceOrientation,
                                                                 country,
                                                                 language,
                                                                 timeZone,
                                                                 currency,
                                                                 applicationVersion,
                                                                 clipboardContent,
                                                                 cFUUID,
                                                                 cPUUsage,
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
                                                                 @"StepCountingAvailable",
                                                                 @"DistanceAvailable",
                                                                 @"FloorCountingAvailable",
                                                                 @"Jailbroken",
                                                                 @"NumberProcessors",
                                                                 @"NumberActiveProcessors",
                                                                 @"ProcessorsUsage",
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
                                                                 @"External IP Address",
                                                                 @"CellIPAddress",
                                                                 @"CellNetmaskAddress",
                                                                 @"CellBroadcastAddress",
                                                                 @"WiFiIPAddress",
                                                                 @"WiFiNetmaskAddress",
                                                                 @"WiFiBroadcastAddress",
                                                                 @"WiFiRouterAddress",
                                                                 @"ConnectedToWiFi",
                                                                 @"ConnectedToCellNetwork",
                                                                 @"ProcessID",
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
                                                                 @"CFUUID",
                                                                 @"CPUUsage",
                                                                 nil]];
    
    // Check if Dictionary is populated
    if (systemInformationDict.count <= 0) {
        // Error, Dictionary is empty
        return nil;
    }
    
    // Successful
    return systemInformationDict;
}

@end
