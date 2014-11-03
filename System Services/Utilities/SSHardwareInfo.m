//
//  SSHardwareInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSHardwareInfo.h"

@implementation SSHardwareInfo

// System Hardware Information

// System Uptime (dd hh mm)
+ (NSString *)systemUptime {
    // Set up the days/hours/minutes
    NSNumber *Days, *Hours, *Minutes;
    
    // Get the info about a process
    NSProcessInfo * processInfo = [NSProcessInfo processInfo];
	// Get the uptime of the system
    NSTimeInterval UptimeInterval = [processInfo systemUptime];
	// Get the calendar
    NSCalendar *Calendar = [NSCalendar currentCalendar];
	// Create the Dates
    NSDate *Date = [[NSDate alloc] initWithTimeIntervalSinceNow:(0-UptimeInterval)];
    unsigned int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    NSDateComponents *Components = [Calendar components:unitFlags fromDate:Date toDate:[NSDate date]  options:0];
	
    // Get the day, hour and minutes
    Days = [NSNumber numberWithInt:[Components day]];
    Hours = [NSNumber numberWithInt:[Components hour]];
    Minutes = [NSNumber numberWithInt:[Components minute]];
	
    // Format the dates
	NSString *Uptime = [NSString stringWithFormat:@"%@ %@ %@",
                               [Days stringValue],
                               [Hours stringValue],
                               [Minutes stringValue]];
    
    // Error checking
    if (!Uptime) {
        // No uptime found
        // Return nil
        return nil;
    }
    
    // Return the uptime
    return Uptime;
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
    NSString *DeviceType;
    
    // Check if it should be formatted
    if (formatted) {
        // Formatted
        @try {
            // Set up a new Device Type String
            NSString *NewDeviceType;
            // Set up a struct
            struct utsname DT;
            // Get the system information
            uname(&DT);
            // Set the device type to the machine type
            DeviceType = [NSString stringWithFormat:@"%s", DT.machine];
            
            if ([DeviceType isEqualToString:@"i386"])
                NewDeviceType = @"iPhone Simulator";
            else if ([DeviceType isEqualToString:@"x86_64"])
                NewDeviceType = @"iPhone Simulator";
            else if ([DeviceType isEqualToString:@"iPhone1,1"])
                NewDeviceType = @"iPhone";
            else if ([DeviceType isEqualToString:@"iPhone1,2"])
                NewDeviceType = @"iPhone 3G";
            else if ([DeviceType isEqualToString:@"iPhone2,1"])
                NewDeviceType = @"iPhone 3GS";
            else if ([DeviceType isEqualToString:@"iPhone3,1"])
                NewDeviceType = @"iPhone 4";
            else if ([DeviceType isEqualToString:@"iPhone4,1"])
                NewDeviceType = @"iPhone 4S";
            else if ([DeviceType isEqualToString:@"iPhone5,1"])
                NewDeviceType = @"iPhone 5(GSM)";
            else if ([DeviceType isEqualToString:@"iPhone5,2"])
                NewDeviceType = @"iPhone 5(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPhone5,3"])
                NewDeviceType = @"iPhone 5c(GSM)";
            else if ([DeviceType isEqualToString:@"iPhone5,4"])
                NewDeviceType = @"iPhone 5c(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPhone6,1"])
                NewDeviceType = @"iPhone 5s(GSM)";
            else if ([DeviceType isEqualToString:@"iPhone6,2"])
                NewDeviceType = @"iPhone 5s(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPhone7,1"])
                NewDeviceType = @"iPhone 6 Plus";
            else if ([DeviceType isEqualToString:@"iPhone7,2"])
                NewDeviceType = @"iPhone 6";
            else if ([DeviceType isEqualToString:@"iPod1,1"])
                NewDeviceType = @"iPod Touch 1G";
            else if ([DeviceType isEqualToString:@"iPod2,1"])
                NewDeviceType = @"iPod Touch 2G";
            else if ([DeviceType isEqualToString:@"iPod3,1"])
                NewDeviceType = @"iPod Touch 3G";
            else if ([DeviceType isEqualToString:@"iPod4,1"])
                NewDeviceType = @"iPod Touch 4G";
            else if ([DeviceType isEqualToString:@"iPod5,1"])
                NewDeviceType = @"iPod Touch 5G";
            else if ([DeviceType isEqualToString:@"iPad1,1"])
                NewDeviceType = @"iPad";
            else if ([DeviceType isEqualToString:@"iPad2,1"])
                NewDeviceType = @"iPad 2(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad2,2"])
                NewDeviceType = @"iPad 2(GSM)";
            else if ([DeviceType isEqualToString:@"iPad2,3"])
                NewDeviceType = @"iPad 2(CDMA)";
            else if ([DeviceType isEqualToString:@"iPad2,4"])
                NewDeviceType = @"iPad 2(WiFi + New Chip)";
            else if ([DeviceType isEqualToString:@"iPad2,5"])
                NewDeviceType = @"iPad mini(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad2,6"])
                NewDeviceType = @"iPad mini(GSM)";
            else if ([DeviceType isEqualToString:@"iPad2,7"])
                NewDeviceType = @"iPad mini(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPad3,1"])
                NewDeviceType = @"iPad 3(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad3,2"])
                NewDeviceType = @"iPad 3(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPad3,3"])
                NewDeviceType = @"iPad 3(GSM)";
            else if ([DeviceType isEqualToString:@"iPad3,4"])
                NewDeviceType = @"iPad 4(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad3,5"])
                NewDeviceType = @"iPad 4(GSM)";
            else if ([DeviceType isEqualToString:@"iPad3,6"])
                NewDeviceType = @"iPad 4(GSM+CDMA)";
            else if ([DeviceType isEqualToString:@"iPad3,3"])
                NewDeviceType = @"New iPad";
            else if ([DeviceType isEqualToString:@"iPad4,1"])
                NewDeviceType = @"iPad Air(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad4,2"])
                NewDeviceType = @"iPad Air(Cellular)";
            else if ([DeviceType isEqualToString:@"iPad4,4"])
                NewDeviceType = @"iPad mini 2(WiFi)";
            else if ([DeviceType isEqualToString:@"iPad4,5"])
                NewDeviceType = @"iPad mini 2(Cellular)";
            else if ([DeviceType hasPrefix:@"iPad"])
                NewDeviceType = @"iPad";
            
            // Return the new device type
            return NewDeviceType;
        }
        @catch (NSException *exception) {
            // Error
            return nil;
        }
    } else {
        // Unformatted
        @try {
            // Set up a struct
            struct utsname DT;
            // Get the system information
            uname(&DT);
            // Set the device type to the machine type
            DeviceType = [NSString stringWithFormat:@"%s", DT.machine];
            
            // Return the device type
            return DeviceType;
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
        size_t size = sizeof(struct kinfo_proc); struct kinfo_proc info;
        int ret = 0, name[4];
        memset(&info, 0, sizeof(struct kinfo_proc));
        
        // Get the process information
        name[0] = CTL_KERN;
        name[1] = KERN_PROC;
        name[2] = KERN_PROC_PID; name[3] = getpid();
        
        // Check to make sure the variables are correct
        if (ret == (sysctl(name, 4, &info, &size, NULL, 0))) {
            // Sysctl() failed
            // Return the output of sysctl
            return ret;
        }
        
        // Return whether or not we're being debugged
        return (info.kp_proc.p_flag & P_TRACED) ? 1 : 0;
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

@end
