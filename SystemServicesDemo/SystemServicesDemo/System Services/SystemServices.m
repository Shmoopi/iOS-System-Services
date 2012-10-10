//
//  SystemServices.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServices.h"

@implementation SystemServices

// System Information

// Get all System Information (All Methods)
+ (NSDictionary *)allSystemInformation {
    // Create an array
    NSDictionary *SystemInformationDict;
    
    // Set up all System Values
    NSString *SystemUptime = [self systemUptime];
    NSString *DeviceModel = [self deviceModel];
    NSString *DeviceName = [self deviceName];
    NSString *SystemName = [self systemName];
    NSString *SystemVersion = [self systemVersion];
    NSString *SystemDeviceTypeFormattedNO = [self systemDeviceTypeFormatted:NO];
    NSString *SystemDeviceTypeFormattedYES = [self systemDeviceTypeFormatted:YES];
    NSString *ScreenWidth = [NSString stringWithFormat:@"%d", [self screenWidth]];
    NSString *ScreenHeight = [NSString stringWithFormat:@"%d", [self screenHeight]];
    NSString *MultitaskingEnabled = [NSString stringWithFormat:@"%d", [self multitaskingEnabled]];
    NSString *ProximitySensorEnabled = [NSString stringWithFormat:@"%d", [self proximitySensorEnabled]];
    NSString *DebuggerAttached = [NSString stringWithFormat:@"%d", [self debuggerAttached]];
    NSString *PluggedIn = [NSString stringWithFormat:@"%d", [self pluggedIn]];
    NSString *Jailbroken = [NSString stringWithFormat:@"%d", [self jailbroken]];
    NSString *NumberProcessors = [NSString stringWithFormat:@"%d", [self numberProcessors]];
    NSString *NumberActiveProcessors = [NSString stringWithFormat:@"%d", [self numberActiveProcessors]];
    NSString *ProcessorSpeed = [NSString stringWithFormat:@"%d", [self processorSpeed]];
    NSString *ProcessorBusSpeed = [NSString stringWithFormat:@"%d", [self processorBusSpeed]];
    NSString *AccessoriesAttached = [NSString stringWithFormat:@"%d", [self accessoriesAttached]];
    NSString *HeadphonesAttached = [NSString stringWithFormat:@"%d", [self headphonesAttached]];
    NSString *NumberAttachedAccessories = [NSString stringWithFormat:@"%d", [self numberAttachedAccessories]];
    NSString *NameAttachedAccessories = [self nameAttachedAccessories];
    NSString *CarrierName = [self carrierName];
    NSString *CarrierCountry = [self carrierCountry];
    NSString *CarrierMobileCountryCode = [self carrierMobileCountryCode];
    NSString *CarrierISOCountryCode = [self carrierISOCountryCode];
    NSString *CarrierMobileNetworkCode = [self carrierMobileNetworkCode];
    NSString *CarrierAllowsVOIP = [NSString stringWithFormat:@"%d", [self carrierAllowsVOIP]];
    NSString *BatteryLevel = [NSString stringWithFormat:@"%f", [self batteryLevel]];
    NSString *Charging = [NSString stringWithFormat:@"%d", [self charging]];
    NSString *FullyCharged = [NSString stringWithFormat:@"%d", [self fullyCharged]];
    NSString *CurrentIPAddress = [self currentIPAddress];
    NSString *CurrentMACAddress = [self currentMACAddress];
    NSString *CellIPAddress = [self cellIPAddress];
    NSString *CellMACAddress = [self cellMACAddress];
    NSString *CellNetmaskAddress = [self cellNetmaskAddress];
    NSString *CellBroadcastAddress = [self cellBroadcastAddress];
    NSString *WiFiIPAddress = [self wiFiIPAddress];
    NSString *WiFiMACAddress = [self wiFiMACAddress];
    NSString *WiFiNetmaskAddress = [self wiFiNetmaskAddress];
    NSString *WiFiBroadcastAddress = [self wiFiBroadcastAddress];
    NSString *ConnectedToWiFi = [NSString stringWithFormat:@"%d", [self connectedToWiFi]];
    NSString *ConnectedToCellNetwork = [NSString stringWithFormat:@"%d", [self connectedToCellNetwork]];
    NSString *ProcessID = [NSString stringWithFormat:@"%d", [self processID]];
    NSString *ProcessName = [self processName];
    NSString *ProcessStatus = [NSString stringWithFormat:@"%d", [self processStatus]];
    NSString *ParentPID = [NSString stringWithFormat:@"%d", [self parentPID]];
    NSMutableArray *ProcessesInformation = [self processesInformation];
    NSString *DiskSpace = [self diskSpace];
    NSString *FreeDiskSpaceNO = [self freeDiskSpace:NO];
    NSString *FreeDiskSpaceYES = [self freeDiskSpace:YES];
    NSString *UsedDiskSpaceNO = [self usedDiskSpace:NO];
    NSString *UsedDiskSpaceYES = [self usedDiskSpace:YES];
    NSString *LongDiskSpace = [NSString stringWithFormat:@"%lld", [self longDiskSpace]];
    NSString *LongFreeDiskSpace = [NSString stringWithFormat:@"%lld", [self longFreeDiskSpace]];
    NSString *TotalMemory = [NSString stringWithFormat:@"%f", [self totalMemory]];
    NSString *FreeMemoryNO = [NSString stringWithFormat:@"%f", [self freeMemory:NO]];
    NSString *FreeMemoryYES = [NSString stringWithFormat:@"%f", [self freeMemory:YES]];
    NSString *UsedMemoryNO = [NSString stringWithFormat:@"%f", [self usedMemory:NO]];
    NSString *UsedMemoryYES = [NSString stringWithFormat:@"%f", [self usedMemory:YES]];
    NSString *AvailableMemoryNO = [NSString stringWithFormat:@"%f", [self availableMemory:NO]];
    NSString *AvailableMemoryYES = [NSString stringWithFormat:@"%f", [self availableMemory:YES]];
    NSString *ActiveMemoryNO = [NSString stringWithFormat:@"%f", [self activeMemory:NO]];
    NSString *ActiveMemoryYES = [NSString stringWithFormat:@"%f", [self activeMemory:YES]];
    NSString *InactiveMemoryNO = [NSString stringWithFormat:@"%f", [self inactiveMemory:NO]];
    NSString *InactiveMemoryYES = [NSString stringWithFormat:@"%f", [self inactiveMemory:YES]];
    NSString *WiredMemoryNO = [NSString stringWithFormat:@"%f", [self wiredMemory:NO]];
    NSString *WiredMemoryYES = [NSString stringWithFormat:@"%f", [self wiredMemory:YES]];
    NSString *PurgableMemoryNO = [NSString stringWithFormat:@"%f", [self purgableMemory:NO]];
    NSString *PurgableMemoryYES = [NSString stringWithFormat:@"%f", [self purgableMemory:YES]];
    NSString *DeviceOrientation = [NSString stringWithFormat:@"%d", [self deviceOrientation]];
    NSString *AccelerometerXValue = [NSString stringWithFormat:@"%f", [self accelerometerXValue]];
    NSString *AccelerometerYValue = [NSString stringWithFormat:@"%f", [self accelerometerYValue]];
    NSString *AccelerometerZValue = [NSString stringWithFormat:@"%f", [self accelerometerZValue]];
    NSString *Country = [self country];
    NSString *Locale = [self locale];
    NSString *Language = [self language];
    NSString *TimeZone = [self timeZone];
    NSString *Currency = [self currency];
    NSString *ApplicationVersion = [self applicationVersion];
    NSString *ClipboardContent = [self clipboardContent];
    NSString *UniqueID = [self uniqueID];
    NSString *DeviceSignature = [self deviceSignature];
    NSString *CFUUID = [self cfuuid];
    
    // Check to make sure all values are valid (if not, make them)
    if (SystemUptime == nil || SystemUptime.length <= 0) {
        // Invalid value
        SystemUptime = @"Unkown";
    }
    if (DeviceModel == nil || DeviceModel.length <= 0) {
        // Invalid value
        DeviceModel = @"Unkown";
    }
    if (DeviceName == nil || DeviceName.length <= 0) {
        // Invalid value
        DeviceName = @"Unkown";
    }
    if (SystemName == nil || SystemName.length <= 0) {
        // Invalid value
        SystemName = @"Unkown";
    }
    if (SystemVersion == nil || SystemVersion.length <= 0) {
        // Invalid value
        SystemVersion = @"Unkown";
    }
    if (SystemDeviceTypeFormattedNO == nil || SystemDeviceTypeFormattedNO.length <= 0) {
        // Invalid value
        SystemDeviceTypeFormattedNO = @"Unkown";
    }
    if (SystemDeviceTypeFormattedYES == nil || SystemDeviceTypeFormattedYES.length <= 0) {
        // Invalid value
        SystemDeviceTypeFormattedYES = @"Unkown";
    }
    if (ScreenWidth == nil || ScreenWidth.length <= 0) {
        // Invalid value
        ScreenWidth = @"Unkown";
    }
    if (ScreenHeight == nil || ScreenHeight.length <= 0) {
        // Invalid value
        ScreenHeight = @"Unkown";
    }
    if (MultitaskingEnabled == nil || MultitaskingEnabled.length <= 0) {
        // Invalid value
        MultitaskingEnabled = @"Unkown";
    }
    if (ProximitySensorEnabled == nil || ProximitySensorEnabled.length <= 0) {
        // Invalid value
        ProximitySensorEnabled = @"Unkown";
    }
    if (DebuggerAttached == nil || DebuggerAttached.length <= 0) {
        // Invalid value
        DebuggerAttached = @"Unkown";
    }
    if (PluggedIn == nil || PluggedIn.length <= 0) {
        // Invalid value
        PluggedIn = @"Unkown";
    }
    if (Jailbroken == nil || Jailbroken.length <= 0) {
        // Invalid value
        Jailbroken = @"Unkown";
    }
    if (NumberProcessors == nil || NumberProcessors.length <= 0) {
        // Invalid value
        NumberProcessors = @"Unkown";
    }
    if (NumberActiveProcessors == nil || NumberActiveProcessors.length <= 0) {
        // Invalid value
        NumberActiveProcessors = @"Unkown";
    }
    if (ProcessorSpeed == nil || ProcessorSpeed.length <= 0) {
        // Invalid value
        ProcessorSpeed = @"Unkown";
    }
    if (ProcessorBusSpeed == nil || ProcessorBusSpeed.length <= 0) {
        // Invalid value
        ProcessorBusSpeed = @"Unkown";
    }
    if (AccessoriesAttached == nil || AccessoriesAttached.length <= 0) {
        // Invalid value
        AccessoriesAttached = @"Unkown";
    }
    if (HeadphonesAttached == nil || HeadphonesAttached.length <= 0) {
        // Invalid value
        HeadphonesAttached = @"Unkown";
    }
    if (NumberAttachedAccessories == nil || NumberAttachedAccessories.length <= 0) {
        // Invalid value
        NumberAttachedAccessories = @"Unkown";
    }
    if (NameAttachedAccessories == nil || NameAttachedAccessories.length <= 0) {
        // Invalid value
        NameAttachedAccessories = @"Unkown";
    }
    if (CarrierName == nil || CarrierName.length <= 0) {
        // Invalid value
        CarrierName = @"Unkown";
    }
    if (CarrierCountry == nil || CarrierCountry.length <= 0) {
        // Invalid value
        CarrierCountry = @"Unkown";
    }
    if (CarrierMobileCountryCode == nil || CarrierMobileCountryCode.length <= 0) {
        // Invalid value
        CarrierMobileCountryCode = @"Unkown";
    }
    if (CarrierISOCountryCode == nil || CarrierISOCountryCode.length <= 0) {
        // Invalid value
        CarrierISOCountryCode = @"Unkown";
    }
    if (CarrierMobileNetworkCode == nil || CarrierMobileNetworkCode.length <= 0) {
        // Invalid value
        CarrierMobileNetworkCode = @"Unkown";
    }
    if (CarrierAllowsVOIP == nil || CarrierAllowsVOIP.length <= 0) {
        // Invalid value
        CarrierAllowsVOIP = @"Unkown";
    }
    if (BatteryLevel == nil || BatteryLevel.length <= 0) {
        // Invalid value
        BatteryLevel = @"Unkown";
    }
    if (Charging == nil || Charging.length <= 0) {
        // Invalid value
        Charging = @"Unkown";
    }
    if (FullyCharged == nil || FullyCharged.length <= 0) {
        // Invalid value
        FullyCharged = @"Unkown";
    }
    if (CurrentIPAddress == nil || CurrentIPAddress.length <= 0) {
        // Invalid value
        CurrentIPAddress = @"Unkown";
    }
    if (CurrentMACAddress == nil || CurrentMACAddress.length <= 0) {
        // Invalid value
        CurrentMACAddress = @"Unkown";
    }
    if (CellIPAddress == nil || CellIPAddress.length <= 0) {
        // Invalid value
        CellIPAddress = @"Unkown";
    }
    if (CellMACAddress == nil || CellMACAddress.length <= 0) {
        // Invalid value
        CellMACAddress = @"Unkown";
    }
    if (CellNetmaskAddress == nil || CellNetmaskAddress.length <= 0) {
        // Invalid value
        CellNetmaskAddress = @"Unkown";
    }
    if (CellBroadcastAddress == nil || CellBroadcastAddress.length <= 0) {
        // Invalid value
        CellBroadcastAddress = @"Unkown";
    }
    if (WiFiIPAddress == nil || WiFiIPAddress.length <= 0) {
        // Invalid value
        WiFiIPAddress = @"Unkown";
    }
    if (WiFiMACAddress == nil || WiFiMACAddress.length <= 0) {
        // Invalid value
        WiFiMACAddress = @"Unkown";
    }
    if (WiFiNetmaskAddress == nil || WiFiNetmaskAddress.length <= 0) {
        // Invalid value
        WiFiNetmaskAddress = @"Unkown";
    }
    if (WiFiBroadcastAddress == nil || WiFiBroadcastAddress.length <= 0) {
        // Invalid value
        WiFiBroadcastAddress = @"Unkown";
    }
    if (ConnectedToWiFi == nil || ConnectedToWiFi.length <= 0) {
        // Invalid value
        ConnectedToWiFi = @"Unkown";
    }
    if (ConnectedToCellNetwork == nil || ConnectedToCellNetwork.length <= 0) {
        // Invalid value
        ConnectedToCellNetwork = @"Unkown";
    }
    if (ProcessID == nil || ProcessID.length <= 0) {
        // Invalid value
        ProcessID = @"Unkown";
    }
    if (ProcessName == nil || ProcessName.length <= 0) {
        // Invalid value
        ProcessName = @"Unkown";
    }
    if (ProcessStatus == nil || ProcessStatus.length <= 0) {
        // Invalid value
        ProcessStatus = @"Unkown";
    }
    if (ParentPID == nil || ParentPID.length <= 0) {
        // Invalid value
        ParentPID = @"Unkown";
    }
    if (ProcessesInformation == nil || ProcessesInformation.count <= 0) {
        // Invalid value
        ProcessesInformation = [NSMutableArray arrayWithObject:@"Unkown"];
    }
    if (DiskSpace == nil || DiskSpace.length <= 0) {
        // Invalid value
        DiskSpace = @"Unkown";
    }
    if (FreeDiskSpaceNO == nil || FreeDiskSpaceNO.length <= 0) {
        // Invalid value
        FreeDiskSpaceNO = @"Unkown";
    }
    if (FreeDiskSpaceYES == nil || FreeDiskSpaceYES.length <= 0) {
        // Invalid value
        FreeDiskSpaceYES = @"Unkown";
    }
    if (UsedDiskSpaceNO == nil || UsedDiskSpaceNO.length <= 0) {
        // Invalid value
        UsedDiskSpaceNO = @"Unkown";
    }
    if (UsedDiskSpaceYES == nil || UsedDiskSpaceYES.length <= 0) {
        // Invalid value
        UsedDiskSpaceYES = @"Unkown";
    }
    if (LongDiskSpace == nil || LongDiskSpace.length <= 0) {
        // Invalid value
        LongDiskSpace = @"Unkown";
    }
    if (LongFreeDiskSpace == nil || LongFreeDiskSpace.length <= 0) {
        // Invalid value
        LongFreeDiskSpace = @"Unkown";
    }
    if (TotalMemory == nil || TotalMemory.length <= 0) {
        // Invalid value
        TotalMemory = @"Unkown";
    }
    if (FreeMemoryNO == nil || FreeMemoryNO.length <= 0) {
        // Invalid value
        FreeMemoryNO = @"Unkown";
    }
    if (FreeMemoryYES == nil || FreeMemoryYES.length <= 0) {
        // Invalid value
        FreeMemoryYES = @"Unkown";
    }
    if (UsedMemoryNO == nil || UsedMemoryNO.length <= 0) {
        // Invalid value
        UsedMemoryNO = @"Unkown";
    }
    if (UsedMemoryYES == nil || UsedMemoryYES.length <= 0) {
        // Invalid value
        UsedMemoryYES = @"Unkown";
    }
    if (AvailableMemoryNO == nil || AvailableMemoryNO.length <= 0) {
        // Invalid value
        AvailableMemoryNO = @"Unkown";
    }
    if (AvailableMemoryYES == nil || AvailableMemoryYES.length <= 0) {
        // Invalid value
        AvailableMemoryYES = @"Unkown";
    }
    if (ActiveMemoryNO == nil || ActiveMemoryNO.length <= 0) {
        // Invalid value
        ActiveMemoryNO = @"Unkown";
    }
    if (ActiveMemoryYES == nil || ActiveMemoryYES.length <= 0) {
        // Invalid value
        ActiveMemoryYES = @"Unkown";
    }
    if (InactiveMemoryNO == nil || InactiveMemoryNO.length <= 0) {
        // Invalid value
        InactiveMemoryNO = @"Unkown";
    }
    if (InactiveMemoryYES == nil || InactiveMemoryYES.length <= 0) {
        // Invalid value
        InactiveMemoryYES = @"Unkown";
    }
    if (WiredMemoryNO == nil || WiredMemoryNO.length <= 0) {
        // Invalid value
        WiredMemoryNO = @"Unkown";
    }
    if (WiredMemoryYES == nil || WiredMemoryYES.length <= 0) {
        // Invalid value
        WiredMemoryYES = @"Unkown";
    }
    if (PurgableMemoryNO == nil || PurgableMemoryNO.length <= 0) {
        // Invalid value
        PurgableMemoryNO = @"Unkown";
    }
    if (PurgableMemoryYES == nil || PurgableMemoryYES.length <= 0) {
        // Invalid value
        PurgableMemoryYES = @"Unkown";
    }
    if (DeviceOrientation == nil || DeviceOrientation.length <= 0) {
        // Invalid value
        DeviceOrientation = @"Unkown";
    }
    if (AccelerometerXValue == nil || AccelerometerXValue.length <= 0) {
        // Invalid value
        AccelerometerXValue = @"Unkown";
    }
    if (AccelerometerYValue == nil || AccelerometerYValue.length <= 0) {
        // Invalid value
        AccelerometerYValue = @"Unkown";
    }
    if (AccelerometerZValue == nil || AccelerometerZValue.length <= 0) {
        // Invalid value
        AccelerometerZValue = @"Unkown";
    }
    if (Country == nil || Country.length <= 0) {
        // Invalid value
        Country = @"Unkown";
    }
    if (Locale == nil || Locale.length <= 0) {
        // Invalid value
        Locale = @"Unkown";
    }
    if (Language == nil || Language.length <= 0) {
        // Invalid value
        Language = @"Unkown";
    }
    if (TimeZone == nil || TimeZone.length <= 0) {
        // Invalid value
        TimeZone = @"Unkown";
    }
    if (Currency == nil || Currency.length <= 0) {
        // Invalid value
        Currency = @"Unkown";
    }
    if (ApplicationVersion == nil || ApplicationVersion.length <= 0) {
        // Invalid value
        ApplicationVersion = @"Unkown";
    }
    if (ClipboardContent == nil || ClipboardContent.length <= 0) {
        // Invalid value
        ClipboardContent = @"Unkown";
    }
    if (UniqueID == nil || UniqueID.length <= 0) {
        // Invalid value
        UniqueID = @"Unkown";
    }
    if (DeviceSignature == nil || DeviceSignature.length <= 0) {
        // Invalid value
        DeviceSignature = @"Unkown";
    }
    if (CFUUID == nil || CFUUID.length <= 0) {
        // Invalid value
        CFUUID = @"Unkown";
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
                                                                        AvailableMemoryNO,
                                                                        AvailableMemoryYES,
                                                                        ActiveMemoryNO,
                                                                        ActiveMemoryYES,
                                                                        InactiveMemoryNO,
                                                                        InactiveMemoryYES,
                                                                        WiredMemoryNO,
                                                                        WiredMemoryYES,
                                                                        PurgableMemoryNO,
                                                                        PurgableMemoryYES,
                                                                        DeviceOrientation,
                                                                        AccelerometerXValue,
                                                                        AccelerometerYValue,
                                                                        AccelerometerZValue,
                                                                        Country,
                                                                        Locale,
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
                                                                        @"Uptime",
                                                                        @"DeviceModel",
                                                                        @"DeviceName",
                                                                        @"SystemName",
                                                                        @"SystemVersion",
                                                                        @"SystemDeviceTypeFormatted",
                                                                        @"SystemDeviceType",
                                                                        @"ScreenWidth",
                                                                        @"ScreenHeight",
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
                                                                        @"FreeDiskSpace(NotFormatted)",
                                                                        @"FreeDiskSpace(Formatted)",
                                                                        @"UsedDiskSpace(NotFormatted)",
                                                                        @"UsedDiskSpace(Formatted)",
                                                                        @"LongDiskSpace",
                                                                        @"LongFreeDiskSpace",
                                                                        @"TotalMemory",
                                                                        @"FreeMemory(NotFormatted)",
                                                                        @"FreeMemory(Formatted)",
                                                                        @"UsedMemory(NotFormatted)",
                                                                        @"UsedMemory(Formatted)",
                                                                        @"AvailableMemory(NotFormatted)",
                                                                        @"AvailableMemory(Formatted)",
                                                                        @"ActiveMemory(NotFormatted)",
                                                                        @"ActiveMemory(Formatted)",
                                                                        @"InactiveMemory(NotFormatted)",
                                                                        @"InactiveMemory(Formatted)",
                                                                        @"WiredMemory(NotFormatted)",
                                                                        @"WiredMemory(Formatted)",
                                                                        @"PurgableMemory(NotFormatted)",
                                                                        @"PurgableMemory(Formatted)",
                                                                        @"DeviceOrientation",
                                                                        @"AccelerometerXValue",
                                                                        @"AccelerometerYValue",
                                                                        @"AccelerometerZValue",
                                                                        @"Country",
                                                                        @"Locale",
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

/* Hardware Information */

// System Uptime (dd hh mm)
+ (NSString *)systemUptime {
    // Get the System Uptime
    NSString *String = [SSHardwareInfo systemUptime];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Model of Device
+ (NSString *)deviceModel {
    // Get the Device Model
    NSString *String = [SSHardwareInfo deviceModel];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Device Name
+ (NSString *)deviceName {
    // Get the Device Name
    NSString *String = [SSHardwareInfo deviceName];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// System Name
+ (NSString *)systemName {
    // Get the System Name
    NSString *String = [SSHardwareInfo systemName];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// System Version
+ (NSString *)systemVersion {
    // Get the System Version
    NSString *String = [SSHardwareInfo systemVersion];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// System Device Type (iPhone1,0) (Formatted = iPhone 1)
+ (NSString *)systemDeviceTypeFormatted:(BOOL)formatted {
    // Get the System Device Type
    NSString *String = [SSHardwareInfo systemDeviceTypeFormatted:formatted];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get the Screen Width (X)
+ (NSInteger)screenWidth {
    // Get the Screen Width
    NSInteger Number = [SSHardwareInfo screenWidth];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Get the Screen Height (Y)
+ (NSInteger)screenHeight {
    // Get the Screen Height
    NSInteger Number = [SSHardwareInfo screenHeight];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Multitasking enabled?
+ (BOOL)multitaskingEnabled {
    // Is Multitasking enabled?
    BOOL item = [SSHardwareInfo multitaskingEnabled];
    // Successful
    return item;
}

// Proximity sensor enabled?
+ (BOOL)proximitySensorEnabled {
    // Is Proximity Sensor enabled?
    BOOL item = [SSHardwareInfo proximitySensorEnabled];
    // Successful
    return item;
}

// Debugger Attached?
+ (BOOL)debuggerAttached {
    // Is Debugger Attached?
    BOOL item = [SSHardwareInfo debuggerAttached];
    // Successful
    return item;
}

// Plugged In?
+ (BOOL)pluggedIn {
    // Is Device Plugged in?
    BOOL item = [SSHardwareInfo pluggedIn];
    // Successful
    return item;
}

/* Jailbreak Check */

// Jailbroken?
+ (BOOL)jailbroken {
    // Is Device Jailbroken?
    BOOL item = [SSJailbreakCheck jailbroken];
    // Successful
    return item;
}

/* Processor Information */

// Number of processors
+ (NSInteger)numberProcessors {
    // Get the Number of Processors
    NSInteger Number = [SSProcessorInfo numberProcessors];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Number of Active Processors
+ (NSInteger)numberActiveProcessors {
    // Get the Number of Active Processors
    NSInteger Number = [SSProcessorInfo numberActiveProcessors];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Processor Speed in MHz
+ (NSInteger)processorSpeed {
    // Get the Processor Speed in MHz
    NSInteger Number = [SSProcessorInfo processorSpeed];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Processor Bus Speed in MHz
+ (NSInteger)processorBusSpeed {
    // Get the Processor Bus Speed in MHz
    NSInteger Number = [SSProcessorInfo processorBusSpeed];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

/* Accessory Information */

// Are any accessories attached?
+ (BOOL)accessoriesAttached {
    // Are any accessories attached?
    BOOL item = [SSAccessoryInfo accessoriesAttached];
    // Successful
    return item;
}

// Are Headphones attached?
+ (BOOL)headphonesAttached {
    // Are Headphones attached?
    BOOL item = [SSAccessoryInfo headphonesAttached];
    // Successful
    return item;
}

// Number of attached accessories
+ (NSInteger)numberAttachedAccessories {
    // Get the Number of attached
    NSInteger Number = [SSAccessoryInfo numberAttachedAccessories];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Name of attached accessory/accessories (seperated by , comma's)
+ (NSString *)nameAttachedAccessories {
    // Get the Name of any attached accessories
    NSString *String = [SSAccessoryInfo nameAttachedAccessories];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

/* Carrier Information */

// Carrier Name
+ (NSString *)carrierName {
    // Get the Carrier Name
    NSString *String = [SSCarrierInfo carrierName];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Carrier Country
+ (NSString *)carrierCountry {
    // Get the Carrier Country
    NSString *String = [SSCarrierInfo carrierCountry];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Carrier Mobile Country Code
+ (NSString *)carrierMobileCountryCode {
    // Get the Carrier Mobile Country Code
    NSString *String = [SSCarrierInfo carrierMobileCountryCode];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Carrier ISO Country Code
+ (NSString *)carrierISOCountryCode {
    // Get the Carrier ISO Country Code
    NSString *String = [SSCarrierInfo carrierISOCountryCode];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Carrier Mobile Network Code
+ (NSString *)carrierMobileNetworkCode {
    // Get the Carrier Mobile Network Code
    NSString *String = [SSCarrierInfo carrierMobileNetworkCode];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP {
    // Does the carrier allow VOIP?
    BOOL item = [SSCarrierInfo carrierAllowsVOIP];
    // Successful
    return item;
}

/* Battery Information */

// Battery Level
+ (float)batteryLevel {
    // Get the Battery Level
    float Number = [SSBatteryInfo batteryLevel];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Charging?
+ (BOOL)charging {
    // Is the device charging?
    BOOL item = [SSBatteryInfo charging];
    // Successful
    return item;
}

// Fully Charged?
+ (BOOL)fullyCharged {
    // Is the device fully charged?
    BOOL item = [SSBatteryInfo fullyCharged];
    // Successful
    return item;
}

/* Network Information */

// Get Current IP Address
+ (NSString *)currentIPAddress {
    // Get the Current IP Address
    NSString *String = [SSNetworkInfo currentIPAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get Current MAC Address
+ (NSString *)currentMACAddress {
    // Get the Current MAC Address
    NSString *String = [SSNetworkInfo currentMACAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get Cell IP Address
+ (NSString *)cellIPAddress {
    // Get the Cell IP Address
    NSString *String = [SSNetworkInfo cellIPAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get Cell MAC Address
+ (NSString *)cellMACAddress {
    // Get the Cell MAC Address
    NSString *String = [SSNetworkInfo cellMACAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get Cell Netmask Address
+ (NSString *)cellNetmaskAddress {
    // Get the Cell Netmask Address
    NSString *String = [SSNetworkInfo cellNetmaskAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get Cell Broadcast Address
+ (NSString *)cellBroadcastAddress {
    // Get the Cell Broadcast Address
    NSString *String = [SSNetworkInfo cellBroadcastAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get WiFi IP Address
+ (NSString *)wiFiIPAddress {
    // Get the WiFi IP Address
    NSString *String = [SSNetworkInfo wiFiIPAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get WiFi MAC Address
+ (NSString *)wiFiMACAddress {
    // Get the WiFi MAC Address
    NSString *String = [SSNetworkInfo wiFiMACAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get WiFi Netmask Address
+ (NSString *)wiFiNetmaskAddress {
    // Get the WiFi Netmask Address
    NSString *String = [SSNetworkInfo wiFiNetmaskAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get WiFi Broadcast Address
+ (NSString *)wiFiBroadcastAddress {
    // Get the WiFi Broadcast Address
    NSString *String = [SSNetworkInfo wiFiBroadcastAddress];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Connected to WiFi?
+ (BOOL)connectedToWiFi {
    // Is the device connected to WiFi?
    BOOL item = [SSNetworkInfo connectedToWiFi];
    // Successful
    return item;
}

// Connected to Cellular Network?
+ (BOOL)connectedToCellNetwork {
    // Is the device Connected to a Cellular Network?
    BOOL item = [SSNetworkInfo connectedToCellNetwork];
    // Successful
    return item;
}

/* Process Information */

// Process ID
+ (int)processID {
    // Get the Process ID
    int Number = [SSProcessInfo processID];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Process Name
+ (NSString *)processName {
    // Get the Process Name
    NSString *String = [SSProcessInfo processName];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Process Status
+ (int)processStatus {
    // Get the Process Status
    int Number = [SSProcessInfo processStatus];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Parent Process ID
+ (int)parentPID {
    // Get the Parent Process ID
    int Number = [SSProcessInfo parentPID];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Parent ID for a certain PID
+ (int)parentPIDForProcess:(int)pid {
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

// List of process information including PID's, Names, PPID's, and Status'
+ (NSMutableArray *)processesInformation {
    // Get all the processes
    NSMutableArray *Array = [SSProcessInfo processesInformation];
    // Validate it
    if (Array <= 0) {
        // Error, no value returned
        return nil;;
    }
    // Successful
    return Array;
}

/* Disk Information */

// Total Disk Space
+ (NSString *)diskSpace {
    // Get the Total Disk Space
    NSString *String = [SSDiskInfo diskSpace];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Total Free Disk Space
+ (NSString *)freeDiskSpace:(BOOL)inPercent {
    // Get the Total Free Disk Space
    NSString *String = [SSDiskInfo freeDiskSpace:inPercent];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Total Used Disk Space
+ (NSString *)usedDiskSpace:(BOOL)inPercent {
    // Get the Total Used Disk Space
    NSString *String = [SSDiskInfo usedDiskSpace:inPercent];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Get the total disk space in long format
+ (long long)longDiskSpace {
    // Get the total disk space in long format
    long long Number = [SSDiskInfo longDiskSpace];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Get the total free disk space in long format
+ (long long)longFreeDiskSpace {
    // Get the total disk space in long format
    long long Number = [SSDiskInfo longFreeDiskSpace];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

/* Memory Information */

// Total Memory
+ (double)totalMemory {
    // Get the total memory
    double Number = [SSMemoryInfo totalMemory];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Free Memory
+ (double)freeMemory:(BOOL)inPercent {
    // Get the free memory
    double Number = [SSMemoryInfo freeMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;}

// Used Memory
+ (double)usedMemory:(BOOL)inPercent {
    // Get the used memory
    double Number = [SSMemoryInfo usedMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Available Memory
+ (double)availableMemory:(BOOL)inPercent {
    // Get the available memory
    double Number = [SSMemoryInfo availableMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;}

// Active Memory
+ (double)activeMemory:(BOOL)inPercent {
    // Get the active memory
    double Number = [SSMemoryInfo activeMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Inactive Memory
+ (double)inactiveMemory:(BOOL)inPercent {
    // Get the inactive memory
    double Number = [SSMemoryInfo inactiveMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Wired Memory
+ (double)wiredMemory:(BOOL)inPercent {
    // Get the wired memory
    double Number = [SSMemoryInfo wiredMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Purgable Memory
+ (double)purgableMemory:(BOOL)inPercent {
    // Get the purgable memory
    double Number = [SSMemoryInfo purgableMemory:inPercent];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

/* Accelerometer Information */

// Device Orientation
+ (UIDeviceOrientation)deviceOrientation {
    // Get the Device Orientation
    UIDeviceOrientation Orientation = [SSAccelerometerInfo deviceOrientation];
    // Validate it
    if (Orientation <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Orientation;
}

// Accelerometer X Value
+ (float)accelerometerXValue {
    // Get the Accelerometer X Value
    float Number = [SSAccelerometerInfo accelerometerXValue];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Accelerometer Y Value
+ (float)accelerometerYValue {
    // Get the Accelerometer Y Value
    float Number = [SSAccelerometerInfo accelerometerYValue];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

// Accelerometer Z Value
+ (float)accelerometerZValue {
    // Get the Accelerometer Z Value
    float Number = [SSAccelerometerInfo accelerometerZValue];
    // Validate it
    if (Number <= 0) {
        // Error, no value returned
        return -1;
    }
    // Successful
    return Number;
}

/* Localization Information */

// Country
+ (NSString *)country {
    // Get the User's Country
    NSString *String = [SSLocalizationInfo country];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Locale
+ (NSString *)locale {
    // Get the User's Locale
    NSString *String = [SSLocalizationInfo locale];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Language
+ (NSString *)language {
    // Get the User's Language
    NSString *String = [SSLocalizationInfo language];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// TimeZone
+ (NSString *)timeZone {
    // Get the User's TimeZone
    NSString *String = [SSLocalizationInfo timeZone];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Currency Symbol
+ (NSString *)currency {
    // Get the User's Currency
    NSString *String = [SSLocalizationInfo currency];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

/* Application Information */

// Application Version
+ (NSString *)applicationVersion {
    // Get the App Version
    NSString *String = [SSApplicationInfo applicationVersion];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Clipboard Content
+ (NSString *)clipboardContent {
    // Get the Clipboard String Contents
    NSString *String = [SSApplicationInfo clipboardContent];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

/* Universal Unique Identifiers */

// Unique ID
+ (NSString *)uniqueID {
    // Get the Unique Device ID
    NSString *String = [SSUUID uniqueID];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// Device Signature
+ (NSString *)deviceSignature {
    // Get a Device Signature
    NSString *String = [SSUUID deviceSignature];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

// CFUUID
+ (NSString *)cfuuid {
    // Get a CFUUID
    NSString *String = [SSUUID cfuuid];
    // Validate it
    if (String == nil || String.length <= 0) {
        // Error, no value returned
        return nil;
    }
    // Successful
    return String;
}

@end
