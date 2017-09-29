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
            // Make the new UUID String
            NSString *tempUniqueID = (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, theUUID);
            
            // Check to make sure it created it
            if (tempUniqueID == nil || tempUniqueID.length <= 0) {
                // Error, Unable to create
                // Release the UUID Reference
                CFRelease(theUUID);
                // Return nil
                return nil;
            }
            
            // Release the UUID Reference
            CFRelease(theUUID);
            
            // Successful
            return tempUniqueID;
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
