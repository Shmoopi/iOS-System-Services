//
//  SSHardwareInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSHardwareInfo.h"

// UIKit
#import <UIKit/UIKit.h>

// Core Motion
#import <CoreMotion/CoreMotion.h>

// sysctl
#import <sys/sysctl.h>
// utsname
#import <sys/utsname.h>

@implementation SSHardwareInfo

// System Hardware Information

// System Uptime (dd hh mm)
+ (NSString *)systemUptime {
    // Set up the days/hours/minutes
    NSNumber *days, *hours, *minutes;
    
    // Get the info about a process
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    // Get the uptime of the system
    NSTimeInterval uptimeInterval = [processInfo systemUptime];
    // Get the calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Create the Dates
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:(0-uptimeInterval)];
    unsigned int unitFlags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date toDate:[NSDate date]  options:0];
    
    // Get the day, hour and minutes
    days = [NSNumber numberWithLong:[components day]];
    hours = [NSNumber numberWithLong:[components hour]];
    minutes = [NSNumber numberWithLong:[components minute]];
    
    // Format the dates
    NSString *uptime = [NSString stringWithFormat:@"%@ %@ %@",
                        [days stringValue],
                        [hours stringValue],
                        [minutes stringValue]];
    
    // Error checking
    if (!uptime) {
        // No uptime found
        // Return nil
        return nil;
    }
    
    // Return the uptime
    return uptime;
}

// Model of Device
+ (NSString *)deviceModel {
    // Get the device model
    if ([[UIDevice currentDevice] respondsToSelector:@selector(model)]) {
        // Make a string for the device model
        NSString *deviceModel = [[UIDevice currentDevice] model];
        // Set the output to the device model
        return deviceModel;
    } else {
        // Device model not found
        return nil;
    }
}

// Device Name
+ (NSString *)deviceName {
    // Get the current device name
    if ([[UIDevice currentDevice] respondsToSelector:@selector(name)]) {
        // Make a string for the device name
        NSString *deviceName = [[UIDevice currentDevice] name];
        // Set the output to the device name
        return deviceName;
    } else {
        // Device name not found
        return nil;
    }
}

// System Name
+ (NSString *)systemName {
    // Get the current system name
    if ([[UIDevice currentDevice] respondsToSelector:@selector(systemName)]) {
        // Make a string for the system name
        NSString *systemName = [[UIDevice currentDevice] systemName];
        // Set the output to the system name
        return systemName;
    } else {
        // System name not found
        return nil;
    }
}

// System Version
+ (NSString *)systemVersion {
    // Get the current system version
    if ([[UIDevice currentDevice] respondsToSelector:@selector(systemVersion)]) {
        // Make a string for the system version
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        // Set the output to the system version
        return systemVersion;
    } else {
        // System version not found
        return nil;
    }
}

// System Device Type (iPhone1,0) (Formatted = iPhone 1)
+ (NSString *)systemDeviceTypeFormatted:(BOOL)formatted {
    // Set up a Device Type String
    NSString *deviceType;
    
    // Check if it should be formatted
    if (formatted) {
        // Formatted
        @try {
            // Set up a new Device Type String
            NSString *newDeviceType;
            // Set up a struct
            struct utsname dt;
            // Get the system information
            uname(&dt);
            // Set the device type to the machine type
            deviceType = [NSString stringWithFormat:@"%s", dt.machine];
            
            // Simulators
            if ([deviceType isEqualToString:@"i386"])
                newDeviceType = @"iPhone Simulator";
            else if ([deviceType isEqualToString:@"x86_64"])
                newDeviceType = @"iPhone Simulator";
            // iPhones
            else if ([deviceType isEqualToString:@"iPhone1,1"])
                newDeviceType = @"iPhone";
            else if ([deviceType isEqualToString:@"iPhone1,2"])
                newDeviceType = @"iPhone 3G";
            else if ([deviceType isEqualToString:@"iPhone2,1"])
                newDeviceType = @"iPhone 3GS";
            else if ([deviceType isEqualToString:@"iPhone3,1"])
                newDeviceType = @"iPhone 4";
            else if ([deviceType isEqualToString:@"iPhone4,1"])
                newDeviceType = @"iPhone 4S";
            else if ([deviceType isEqualToString:@"iPhone5,1"])
                newDeviceType = @"iPhone 5 (GSM)";
            else if ([deviceType isEqualToString:@"iPhone5,2"])
                newDeviceType = @"iPhone 5 (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPhone5,3"])
                newDeviceType = @"iPhone 5c (GSM)";
            else if ([deviceType isEqualToString:@"iPhone5,4"])
                newDeviceType = @"iPhone 5c (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPhone6,1"])
                newDeviceType = @"iPhone 5s (GSM)";
            else if ([deviceType isEqualToString:@"iPhone6,2"])
                newDeviceType = @"iPhone 5s (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPhone7,1"])
                newDeviceType = @"iPhone 6 Plus";
            else if ([deviceType isEqualToString:@"iPhone7,2"])
                newDeviceType = @"iPhone 6";
            else if ([deviceType isEqualToString:@"iPhone8,1"])
                newDeviceType = @"iPhone 6s";
            else if ([deviceType isEqualToString:@"iPhone8,2"])
                newDeviceType = @"iPhone 6s Plus";
            else if ([deviceType isEqualToString:@"iPhone8,4"])
                newDeviceType = @"iPhone SE";
            else if ([deviceType isEqualToString:@"iPhone9,1"])
                newDeviceType = @"iPhone 7 (CDMA+GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone9,3"])
                newDeviceType = @"iPhone 7 (GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone9,2"])
                newDeviceType = @"iPhone 7 Plus (CDMA+GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone9,4"])
                newDeviceType = @"iPhone 7 Plus (GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,1"])
                newDeviceType = @"iPhone 8 (CDMA+GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,4"])
                newDeviceType = @"iPhone 8 (GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,2"])
                newDeviceType = @"iPhone 8 Plus (CDMA+GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,5"])
                newDeviceType = @"iPhone 8 Plus (GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,3"])
                newDeviceType = @"iPhone X (CDMA+GSM/LTE)";
            else if ([deviceType isEqualToString:@"iPhone10,6"])
                newDeviceType = @"iPhone X (GSM/LTE)";
            // iPods
            else if ([deviceType isEqualToString:@"iPod1,1"])
                newDeviceType = @"iPod Touch 1G";
            else if ([deviceType isEqualToString:@"iPod2,1"])
                newDeviceType = @"iPod Touch 2G";
            else if ([deviceType isEqualToString:@"iPod3,1"])
                newDeviceType = @"iPod Touch 3G";
            else if ([deviceType isEqualToString:@"iPod4,1"])
                newDeviceType = @"iPod Touch 4G";
            else if ([deviceType isEqualToString:@"iPod5,1"])
                newDeviceType = @"iPod Touch 5G";
            else if ([deviceType isEqualToString:@"iPod7,1"])
                newDeviceType = @"iPod Touch 6G";
            // iPads
            else if ([deviceType isEqualToString:@"iPad1,1"])
                newDeviceType = @"iPad";
            else if ([deviceType isEqualToString:@"iPad2,1"])
                newDeviceType = @"iPad 2 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad2,2"])
                newDeviceType = @"iPad 2 (GSM)";
            else if ([deviceType isEqualToString:@"iPad2,3"])
                newDeviceType = @"iPad 2 (CDMA)";
            else if ([deviceType isEqualToString:@"iPad2,4"])
                newDeviceType = @"iPad 2 (WiFi + New Chip)";
            else if ([deviceType isEqualToString:@"iPad2,5"])
                newDeviceType = @"iPad mini (WiFi)";
            else if ([deviceType isEqualToString:@"iPad2,6"])
                newDeviceType = @"iPad mini (GSM)";
            else if ([deviceType isEqualToString:@"iPad2,7"])
                newDeviceType = @"iPad mini (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPad3,1"])
                newDeviceType = @"iPad 3 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad3,2"])
                newDeviceType = @"iPad 3 (GSM)";
            else if ([deviceType isEqualToString:@"iPad3,3"])
                newDeviceType = @"iPad 3 (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPad3,4"])
                newDeviceType = @"iPad 4 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad3,5"])
                newDeviceType = @"iPad 4 (GSM)";
            else if ([deviceType isEqualToString:@"iPad3,6"])
                newDeviceType = @"iPad 4 (GSM+CDMA)";
            else if ([deviceType isEqualToString:@"iPad4,1"])
                newDeviceType = @"iPad Air (WiFi)";
            else if ([deviceType isEqualToString:@"iPad4,2"])
                newDeviceType = @"iPad Air (Cellular)";
            else if ([deviceType isEqualToString:@"iPad4,3"])
                newDeviceType = @"iPad Air (China)";
            else if ([deviceType isEqualToString:@"iPad4,4"])
                newDeviceType = @"iPad mini 2 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad4,5"])
                newDeviceType = @"iPad mini 2 (Cellular)";
            else if ([deviceType isEqualToString:@"iPad5,1"])
                newDeviceType = @"iPad mini 4 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad5,2"])
                newDeviceType = @"iPad mini 4 (Cellular)";
            else if ([deviceType isEqualToString:@"iPad5,4"])
                newDeviceType = @"iPad Air 2 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad5,5"])
                newDeviceType = @"iPad Air 2 (Cellular)";
            else if ([deviceType isEqualToString:@"iPad6,3"])
                newDeviceType = @"9.7-inch iPad Pro (WiFi)";
            else if ([deviceType isEqualToString:@"iPad6,4"])
                newDeviceType = @"9.7-inch iPad Pro (Cellular)";
            else if ([deviceType isEqualToString:@"iPad6,7"])
                newDeviceType = @"12.9-inch iPad Pro (WiFi)";
            else if ([deviceType isEqualToString:@"iPad6,8"])
                newDeviceType = @"12.9-inch iPad Pro (Cellular)";
            else if ([deviceType isEqualToString:@"iPad6,11"])
                newDeviceType = @"iPad 5 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad6,12"])
                newDeviceType = @"iPad 5 (Cellular)";
            else if ([deviceType isEqualToString:@"iPad7,1"])
                newDeviceType = @"iPad Pro 12.9 (2nd Gen - WiFi)";
            else if ([deviceType isEqualToString:@"iPad7,2"])
                newDeviceType = @"iPad Pro 12.9 (2nd Gen - Cellular)";
            else if ([deviceType isEqualToString:@"iPad7,3"])
                newDeviceType = @"iPad Pro 10.5 (WiFi)";
            else if ([deviceType isEqualToString:@"iPad7,4"])
                newDeviceType = @"iPad Pro 10.5 (Cellular)";
            // Catch All iPad
            else if ([deviceType hasPrefix:@"iPad"])
                newDeviceType = @"iPad";
            // Apple TV
            else if ([deviceType isEqualToString:@"AppleTV2,1"])
                newDeviceType = @"Apple TV 2";
            else if ([deviceType isEqualToString:@"AppleTV3,1"])
                newDeviceType = @"Apple TV 3";
            else if ([deviceType isEqualToString:@"AppleTV3,2"])
                newDeviceType = @"Apple TV 3 (2013)";

            // Return the new device type
            return newDeviceType;
        }
        @catch (NSException *exception) {
            // Error
            return nil;
        }
    } else {
        // Unformatted
        @try {
            // Set up a struct
            struct utsname dt;
            // Get the system information
            uname(&dt);
            // Set the device type to the machine type
            deviceType = [NSString stringWithFormat:@"%s", dt.machine];
            
            // Return the device type
            return deviceType;
        }
        @catch (NSException *exception) {
            // Error
            return nil;
        }
    }
}

// Get the Screen Width (X)
+ (NSInteger)screenWidth {
    // Get the screen width
    @try {
        // Screen bounds
        CGRect Rect = [[UIScreen mainScreen] bounds];
        // Find the width (X)
        NSInteger Width = Rect.size.width;
        // Verify validity
        if (Width <= 0) {
            // Invalid Width
            return -1;
        }
        
        // Successful
        return Width;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Get the Screen Height (Y)
+ (NSInteger)screenHeight {
    // Get the screen height
    @try {
        // Screen bounds
        CGRect Rect = [[UIScreen mainScreen] bounds];
        // Find the Height (Y)
        NSInteger Height = Rect.size.height;
        // Verify validity
        if (Height <= 0) {
            // Invalid Height
            return -1;
        }
        
        // Successful
        return Height;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Get the Screen Brightness
+ (float)screenBrightness {
    // Get the screen brightness
    @try {
        // Brightness
        float brightness = [UIScreen mainScreen].brightness;
        // Verify validity
        if (brightness < 0.0 || brightness > 1.0) {
            // Invalid brightness
            return -1;
        }
        
        // Successful
        return (brightness * 100);
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Multitasking enabled?
+ (BOOL)multitaskingEnabled {
    // Is multitasking enabled?
    if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
        // Create a bool
        BOOL MultitaskingSupported = [UIDevice currentDevice].multitaskingSupported;
        // Return the value
        return MultitaskingSupported;
    } else {
        // Doesn't respond to selector
        return false;
    }
}

// Proximity sensor enabled?
+ (BOOL)proximitySensorEnabled {
    // Is the proximity sensor enabled?
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setProximityMonitoringEnabled:)]) {
        // Create a UIDevice variable
        UIDevice *device = [UIDevice currentDevice];
        
        // Make a Bool for the proximity Sensor
        BOOL ProximitySensor;
        
        // Turn the sensor on, if not already on, and see if it works
        if (device.proximityMonitoringEnabled != YES) {
            // Sensor is off
            // Turn it on
            [device setProximityMonitoringEnabled:YES];
            // See if it turned on
            if (device.proximityMonitoringEnabled == YES) {
                // It turned on!  Turn it off
                [device setProximityMonitoringEnabled:NO];
                // It works
                ProximitySensor = true;
            } else {
                // Didn't turn on, no good
                ProximitySensor = false;
            }
        } else {
            // Sensor is already on
            ProximitySensor = true;
        }
        
        // Return on or off
        return ProximitySensor;
    } else {
        // Doesn't respond to selector
        return false;
    }
}

// Debugging attached?
+ (BOOL)debuggerAttached {
    // Is the debugger attached?
    @try {
        // Set up the variables
        int                 ret;
        int                 mib[4];
        struct kinfo_proc   info;
        size_t              size;
        info.kp_proc.p_flag = 0;
        mib[0] = CTL_KERN;
        mib[1] = KERN_PROC;
        mib[2] = KERN_PROC_PID;
        mib[3] = getpid();
        size = sizeof(info);
        ret = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
        
        // Verify ret
        if (ret) {
            // Sysctl() failed
            // Return the output of sysctl
            return ret;
        }
        
        // Return whether the process is being traced or not
        return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
        
    }
    @catch (NSException *exception) {
        // Error
        return false;
    }
}

// Plugged In?
+ (BOOL)pluggedIn {
    // Is the device plugged in?
    if ([[UIDevice currentDevice] respondsToSelector:@selector(batteryState)]) {
        // Create a bool
        BOOL PluggedIn;
        // Set the battery monitoring enabled
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
        // Get the battery state
        UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
        // Check if it's plugged in or finished charging
        if (batteryState == UIDeviceBatteryStateCharging || batteryState == UIDeviceBatteryStateFull) {
            // We're plugged in
            PluggedIn = true;
        } else {
            PluggedIn = false;
        }
        // Return the value
        return PluggedIn;
    } else {
        // Doesn't respond to selector
        return false;
    }
}

// Step-Counting Available?
+ (BOOL)stepCountingAvailable {
    @try {
        // Make sure the Pedometer class exists
        if ([CMPedometer class]) {
            // Make sure the selector exists
            if ([CMPedometer respondsToSelector:@selector(isStepCountingAvailable)]) {
                // Return whether it's available
                return [CMPedometer isStepCountingAvailable];
            }
        }
        // Not available
        return false;
    }
    @catch (NSException *exception) {
        // Error
        return false;
    }
}

// Distance Available
+ (BOOL)distanceAvailable {
    @try {
        // Make sure the Pedometer class exists
        if ([CMPedometer class]) {
            // Make sure the selector exists
            if ([CMPedometer respondsToSelector:@selector(isDistanceAvailable)]) {
                // Return whether it's available
                return [CMPedometer isDistanceAvailable];
            }
        }
        // Not available
        return false;
    }
    @catch (NSException *exception) {
        // Error
        return false;
    }
}

// Floor Counting Available
+ (BOOL)floorCountingAvailable {
    @try {
        // Make sure the Pedometer class exists
        if ([CMPedometer class]) {
            // Make sure the selector exists
            if ([CMPedometer respondsToSelector:@selector(isFloorCountingAvailable)]) {
                // Return whether it's available
                return [CMPedometer isFloorCountingAvailable];
            }
        }
        // Not available
        return false;
    }
    @catch (NSException *exception) {
        // Error
        return false;
    }
}

@end
