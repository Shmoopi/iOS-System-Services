//
//  SSUUID.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSUUID.h"
#import "SSHardwareInfo.h"
#import "SSProcessorInfo.h"
#import "SSNetworkInfo.h"
#import "SSDiskInfo.h"
#import "SSAccelerometerInfo.h"
#import "SSLocalizationInfo.h"
#import "SSMemoryInfo.h"
#import "SSJailbreakCheck.h"
#import "SSAccessoryInfo.h"
#import "SSBatteryInfo.h"

@implementation SSUUID

// CFUUID
+ (NSString *)cfuuid {
    // Create a new CFUUID (Unique, random ID number) (Always different)
    @try {
        // Create a new instance of CFUUID using CFUUIDCreate using the default allocator
        CFUUIDRef theUUID = CFUUIDCreate(kCFAllocatorDefault);

        // Check to make sure it exists
        if (theUUID)
        {
            // Make the new UUID String. Use __bridge_transfer so ARC takes
            // ownership of the +1 retained CFString and releases it for us.
            NSString *tempUniqueID = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, theUUID);

            // Release the UUID Reference
            CFRelease(theUUID);

            // Check to make sure it created it
            if (tempUniqueID == nil || tempUniqueID.length <= 0) {
                // Error, Unable to create
                return nil;
            }

            // Successful
            return tempUniqueID;
        } else {
            // Error, the UUID could not be created (nothing to release)
            return nil;
        }
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
