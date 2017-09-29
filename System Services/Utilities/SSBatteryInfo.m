//
//  SSBatteryInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSBatteryInfo.h"

// UIKit
#import <UIKit/UIKit.h>

@implementation SSBatteryInfo

// Battery Information

// Battery Level
+ (float)batteryLevel {
    // Find the battery level
    @try {
        // Get the device
        UIDevice *device = [UIDevice currentDevice];
        // Set battery monitoring on
        device.batteryMonitoringEnabled = YES;
        
        // Set up the battery level float
        float batteryLevel = 0.0;
        // Get the battery level
        float batteryCharge = [device batteryLevel];
        
        // Check to make sure the battery level is more than zero
        if (batteryCharge > 0.0f) {
            // Make the battery level float equal to the charge * 100
            batteryLevel = batteryCharge * 100;
        } else {
            // Unable to find the battery level
            return -1;
        }
        
        // Output the battery level
        return batteryLevel;
    }
    @catch (NSException *exception) {
        // Error out
        return -1;
    }
}

// Charging?
+ (BOOL)charging {
    // Is the battery charging?
    @try {
        // Get the device
        UIDevice *device = [UIDevice currentDevice];
        // Set battery monitoring on
        device.batteryMonitoringEnabled = YES;
        
        // Check the battery state
        if ([device batteryState] == UIDeviceBatteryStateCharging || [device batteryState] == UIDeviceBatteryStateFull) {
            // Device is charging
            return true;
        } else {
            // Device is not charging
            return false;
        }
    }
    @catch (NSException *exception) {
        // Error out
        return false;
    }
}

// Fully Charged?
+ (BOOL)fullyCharged {
    // Is the battery fully charged?
    @try {
        // Get the device
        UIDevice *device = [UIDevice currentDevice];
        // Set battery monitoring on
        device.batteryMonitoringEnabled = YES;
        
        // Check the battery state
        if ([device batteryState] == UIDeviceBatteryStateFull) {
            // Device is fully charged
            return true;
        } else {
            // Device is not fully charged
            return false;
        }
    }
    @catch (NSException *exception) {
        // Error out
        return false;
    }
}

@end
