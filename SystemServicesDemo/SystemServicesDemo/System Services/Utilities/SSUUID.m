//
//  SSUUID.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSUUID.h"

@implementation SSUUID

// UDID Replacement Based on SystemServices Device Signature

// Unique ID
+ (NSString *)uniqueID {
    // Get a Unique ID from the Device
    
    // Create a string
    NSString *UniqueIdentifier;
    
    // Get the Device Model
    NSString *DeviceModel = [[SSHardwareInfo deviceModel] capitalizedString];
    DeviceModel = [[DeviceModel substringWithRange:NSMakeRange([DeviceModel length] - 1, 1)] capitalizedString];
    
    // Get the System Name
    NSString *SystemName = [[[SSHardwareInfo systemName] substringWithRange:NSMakeRange(2, 1)] capitalizedString];
    
    // Get the Device Type
    NSString *DeviceType = [[SSHardwareInfo systemDeviceTypeFormatted:NO] capitalizedString];
    DeviceType = [DeviceType substringWithRange:NSMakeRange([DeviceType length] - 1, 1)];
    
    // Get the Screen Width
    NSString *ScreenWidth = [[[NSString stringWithFormat:@"%d", [SSHardwareInfo screenWidth]] substringToIndex:1] capitalizedString];
    
    // Get the Screen Height
    NSString *ScreenHeight = [[[NSString stringWithFormat:@"%d", [SSHardwareInfo screenHeight]] substringToIndex:1] capitalizedString];
    
    // Check if Multitasking is Enabled
    NSString *MultitaskingEnabled = [[[NSString stringWithFormat:@"%d", [SSHardwareInfo multitaskingEnabled]] substringToIndex:1] capitalizedString];
    
    // Check if the proximity sensor exists
    NSString *ProximitySensorEnabled = [[[NSString stringWithFormat:@"%d", [SSHardwareInfo proximitySensorEnabled]] substringToIndex:1] capitalizedString];
    
    // Get the number of processors
    NSString *NumberProcessors = [[[NSString stringWithFormat:@"%d", [SSProcessorInfo numberProcessors]] substringToIndex:1] capitalizedString];
    
    // Get the processor Speed
    NSString *ProcessorSpeed = [[[NSString stringWithFormat:@"%d", [SSProcessorInfo processorSpeed]] substringToIndex:1] capitalizedString];
    
    // Get the Cell MAC Address
    NSString *CellMACAddress = [[[SSNetworkInfo cellMACAddress] substringToIndex:1] capitalizedString];
    
    // Get the WiFi MAC Address
    NSString *WiFiMACAddress = [[[SSNetworkInfo wiFiMACAddress] substringToIndex:1] capitalizedString];
    
    // Get the WiFi MAC Address different sector (5)
    NSString *WiFiMACAddress2 = [[[SSNetworkInfo wiFiMACAddress] substringWithRange:NSMakeRange(4, 1)] capitalizedString];
    
    // Get the WiFi MAC Address different sector (10)
    NSString *WiFiMACAddress3 = [[[SSNetworkInfo wiFiMACAddress] substringWithRange:NSMakeRange(9, 1)] capitalizedString];
    
    // Get the total disk space
    NSString *TotalDiskSpace = [[[SSDiskInfo diskSpace] substringToIndex:1] capitalizedString];
    
    // Create a salt
    NSString *Salt = @"6";
    
    // Create an additional salt
    NSString *Salty = @"S";
    
    // Error check
    if (DeviceModel == nil || DeviceModel.length <= 0 || DeviceModel.length > 1 || [DeviceModel isEqualToString:@"-"]) {
        // Invalid String
        DeviceModel = @"1";
    }
    if (SystemName == nil || SystemName.length <= 0 || SystemName.length > 1 || [SystemName isEqualToString:@"-"]) {
        // Invalid String
        SystemName = @"1";
    }
    if (DeviceType == nil || DeviceType.length <= 0 || DeviceType.length > 1 || [DeviceType isEqualToString:@"-"]) {
        // Invalid String
        DeviceType = @"1";
    }
    if (ScreenWidth == nil || ScreenWidth.length <= 0 || ScreenWidth.length > 1 || [ScreenWidth isEqualToString:@"-"]) {
        // Invalid String
        ScreenWidth = @"1";
    }
    if (ScreenHeight == nil || ScreenHeight.length <= 0 || ScreenHeight.length > 1 || [ScreenHeight isEqualToString:@"-"]) {
        // Invalid String
        ScreenHeight = @"1";
    }
    if (MultitaskingEnabled == nil || MultitaskingEnabled.length <= 0 || MultitaskingEnabled.length > 1 || [MultitaskingEnabled isEqualToString:@"-"]) {
        // Invalid String
        MultitaskingEnabled = @"1";
    }
    if (ProximitySensorEnabled == nil || ProximitySensorEnabled.length <= 0 || ProximitySensorEnabled.length > 1 || [ProximitySensorEnabled isEqualToString:@"-"]) {
        // Invalid String
        ProximitySensorEnabled = @"1";
    }
    if (NumberProcessors == nil || NumberProcessors.length <= 0 || NumberProcessors.length > 1 || [NumberProcessors isEqualToString:@"-"]) {
        // Invalid String
        NumberProcessors = @"1";
    }
    if (ProcessorSpeed == nil || ProcessorSpeed.length <= 0 || ProcessorSpeed.length > 1 || [ProcessorSpeed isEqualToString:@"-"]) {
        // Invalid String
        ProcessorSpeed = @"1";
    }
    if (CellMACAddress == nil || CellMACAddress.length <= 0 || CellMACAddress.length > 1 || [CellMACAddress isEqualToString:@"-"]) {
        // Invalid String
        CellMACAddress = @"1";
    }
    if (WiFiMACAddress == nil || WiFiMACAddress.length <= 0 || WiFiMACAddress.length > 1 || [WiFiMACAddress isEqualToString:@"-"]) {
        // Invalid String
        WiFiMACAddress = @"1";
    }
    if (WiFiMACAddress2 == nil || WiFiMACAddress2.length <= 0 || WiFiMACAddress2.length > 1 || [WiFiMACAddress2 isEqualToString:@"-"]) {
        // Invalid String
        WiFiMACAddress2 = @"1";
    }
    if (WiFiMACAddress3 == nil || WiFiMACAddress3.length <= 0 || WiFiMACAddress3.length > 1 || [WiFiMACAddress3 isEqualToString:@"-"]) {
        // Invalid String
        WiFiMACAddress3 = @"1";
    }
    if (TotalDiskSpace == nil || TotalDiskSpace.length <= 0 || TotalDiskSpace.length > 1 || [TotalDiskSpace isEqualToString:@"-"]) {
        // Invalid String
        TotalDiskSpace = @"1";
    }
    
    // Create the Unique ID Based on these Unchanging System Variables
    UniqueIdentifier = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", Salt, DeviceModel, SystemName, DeviceType, ScreenWidth, ScreenHeight, MultitaskingEnabled, ProximitySensorEnabled, NumberProcessors, ProcessorSpeed, CellMACAddress, WiFiMACAddress, WiFiMACAddress2, WiFiMACAddress3, TotalDiskSpace, Salty];
    
    // Check for errors
    if (UniqueIdentifier == nil || UniqueIdentifier.length <= 0 || UniqueIdentifier.length > 16) {
        // Error, invalid UUID
        return nil;
    }
    
    // Completed Successfully
    return UniqueIdentifier;
}

// Device Signature
+ (NSString *)deviceSignature {
    // Get a comprehensive device signature
    
    // Create a string
    NSString *DeviceSignature;
    
    // Get the System Version
    NSString *SystemVersion = [NSString stringWithFormat:@"%d", [[SSHardwareInfo systemVersion] intValue]];
    
    // Get the Screen Height
    NSString *ScreenHeight = [NSString stringWithFormat:@"%d", [SSHardwareInfo screenHeight]];
    
    // Get the Screen Width
    NSString *ScreenWidth = [NSString stringWithFormat:@"%d", [SSHardwareInfo screenWidth]];
    
    // Plugged In
    NSString *PluggedIn = [NSString stringWithFormat:@"%d", [SSHardwareInfo pluggedIn]];
    
    // Jailbroken
    NSString *Jailbroken = [NSString stringWithFormat:@"%d", [SSJailbreakCheck jailbroken]];
    
    // Headphones Attached
    NSString *HeadphonesAttached = [NSString stringWithFormat:@"%d", [SSAccessoryInfo headphonesAttached]];
    
    // Battery Level
    NSString *BatteryLevel = [NSString stringWithFormat:@"%d", (int)[SSBatteryInfo batteryLevel]];
    
    // Fully Charged
    NSString *FullyCharged = [NSString stringWithFormat:@"%d", [SSBatteryInfo fullyCharged]];
    
    // Connected to WiFi
    NSString *ConnectedtoWiFi = [NSString stringWithFormat:@"%d", [SSNetworkInfo connectedToWiFi]];
    
    // Device Orientation
    NSString *DeviceOrientation = [NSString stringWithFormat:@"%d", [SSAccelerometerInfo deviceOrientation]];
    
    // Country
    NSString *Country = [[[SSLocalizationInfo country] substringToIndex:2] uppercaseString];
    
    // TimeZone
    NSString *TimeZone = [[[SSLocalizationInfo timeZone] substringToIndex:2] uppercaseString];
    
    // Number Processors
    NSString *NumberProcessors = [NSString stringWithFormat:@"%d", [SSProcessorInfo numberProcessors]];
    
    // Processor Speed
    NSString *ProcessorSpeed = [NSString stringWithFormat:@"%d", [SSProcessorInfo processorSpeed]];
    
    // Total Disk Space
    NSString *TotalDiskSpace = [NSString stringWithFormat:@"%d", [[SSDiskInfo diskSpace] intValue] ];
    
    // Total Memory
    NSString *TotalMemory = [NSString stringWithFormat:@"%d", (int)[SSMemoryInfo totalMemory]];
    
    // Salt
    NSString *Salt = @"SS";
    
    // Check for errors
    if (SystemVersion == nil || SystemVersion.length <= 0 || SystemVersion.length > 3) {
        // Invalid String
        SystemVersion = @"00";
    }
    if (ScreenHeight == nil || ScreenHeight.length <= 0 || ScreenHeight.length > 4) {
        // Invalid String
        ScreenHeight = @"0000";
    }
    if (ScreenWidth == nil || ScreenWidth.length <= 0 || ScreenWidth.length > 4) {
        // Invalid String
        ScreenWidth = @"0000";
    }
    if (PluggedIn == nil || PluggedIn.length <= 0 || PluggedIn.length > 1) {
        // Invalid String
        PluggedIn = @"0";
    }
    if (Jailbroken == nil || Jailbroken.length <= 0 || Jailbroken.length > 1) {
        // Invalid String
        Jailbroken = @"0";
    }
    if (HeadphonesAttached == nil || HeadphonesAttached.length <= 0 || HeadphonesAttached.length > 1) {
        // Invalid String
        HeadphonesAttached = @"0";
    }
    if (BatteryLevel == nil || BatteryLevel.length <= 0 || [BatteryLevel rangeOfString:@"-"].location != NSNotFound) {
        // Invalid String
        BatteryLevel = @"00";
    }
    if (FullyCharged == nil || FullyCharged.length <= 0 || FullyCharged.length > 1) {
        // Invalid String
        FullyCharged = @"0";
    }
    if (ConnectedtoWiFi == nil || ConnectedtoWiFi.length <= 0 || ConnectedtoWiFi.length > 1) {
        // Invalid String
        ConnectedtoWiFi = @"0";
    }
    if (DeviceOrientation == nil || DeviceOrientation.length <= 0 || DeviceOrientation.length > 1) {
        // Invalid String
        DeviceOrientation = @"0";
    }
    if (Country == nil || Country.length <= 0 || Country.length > 2) {
        // Invalid String
        Country = @"00";
    }
    if (TimeZone == nil || TimeZone.length <= 0 || TimeZone.length > 2) {
        // Invalid String
        TimeZone = @"00";
    }
    if (NumberProcessors == nil || NumberProcessors.length <= 0 || NumberProcessors.length > 2 || [NumberProcessors rangeOfString:@"-"].location != NSNotFound) {
        // Invalid String
        NumberProcessors = @"0";
    }
    if (ProcessorSpeed == nil || ProcessorSpeed.length <= 0 || ProcessorSpeed.length > 3 || [ProcessorSpeed rangeOfString:@"-"].location != NSNotFound) {
        // Invalid String
        ProcessorSpeed = @"000";
    }
    if (TotalDiskSpace == nil || TotalDiskSpace.length <= 0 || TotalDiskSpace.length > 3 || [TotalDiskSpace rangeOfString:@"-"].location != NSNotFound) {
        // Invalid String
        TotalDiskSpace = @"000";
    }
    if (TotalMemory == nil || TotalMemory.length <= 0 || TotalMemory.length > 3 || [TotalMemory rangeOfString:@"-"].location != NSNotFound) {
        // Invalid String
        TotalMemory = @"000";
    }
    
    // Create the Device Signature based on the values
    DeviceSignature = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", SystemVersion, ScreenHeight, ScreenWidth, PluggedIn, Jailbroken, HeadphonesAttached, BatteryLevel, FullyCharged, ConnectedtoWiFi, DeviceOrientation, Country, TimeZone, NumberProcessors, ProcessorSpeed, TotalDiskSpace, TotalMemory, Salt];
    
    // Check for errors
    if (DeviceSignature == nil || DeviceSignature.length <= 0) {
        // Error, invalid Device Signature
        return nil;
    }
    
    // Completed Successfully
    return DeviceSignature;
}

// CFUUID
+ (NSString *)cfuuid {
    // Create a new CFUUID (Unique, random ID number) (Always different)
    @try {
        // Create a new instance of CFUUID using CFUUIDCreate using the default allocator
        CFUUIDRef theUUID = CFUUIDCreate(kCFAllocatorDefault);
        
        // Check to make sure it exists
        if (theUUID)
        {
            // Make the new UUID String
            NSString *TempUniqueID = (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, theUUID);
            
            // Check to make sure it created it
            if (TempUniqueID == nil || TempUniqueID.length <= 0) {
                // Error, Unable to create
                // Release the UUID Reference
                CFRelease(theUUID);
                // Return nil
                return nil;
            }
            
            // Release the UUID Reference
            CFRelease(theUUID);
            
            // Successful
            return TempUniqueID;
        } else {
            // Error
            // Release the UUID Reference
            CFRelease(theUUID);
            // Return nil
            return nil;
        }
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
