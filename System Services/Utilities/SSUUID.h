//
//  SSUUID.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUUID : NSObject

// Universal Unique Identifiers

// Unique ID - Unique Identifier based on unchanging information about the device
+ (nullable NSString *)uniqueID NS_DEPRECATED_IOS(2_0, 8_0);

// Device Signature - Device Signature based on assorted information about the device including: SystemVersion, ScreenHeight, ScreenWidth, PluggedIn, Jailbroken, HeadphonesAttached, BatteryLevel, FullyCharged, ConnectedtoWiFi, DeviceOrientation, Country, TimeZone, NumberProcessors, ProcessorSpeed, TotalDiskSpace, TotalMemory, and a Salt
+ (nullable NSString *)deviceSignature NS_DEPRECATED_IOS(2_0, 8_0);

// CFUUID - Random Unique Identifier that changes every time
+ (nullable NSString *)cfuuid;

@end
