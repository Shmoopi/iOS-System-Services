//
//  SSAccessoryInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSAccessoryInfo.h"

// Accessory Manager
#import <ExternalAccessory/ExternalAccessory.h>

// AVFoundation
#import <AVFoundation/AVFoundation.h>

@implementation SSAccessoryInfo

// Accessory Information

// Are any accessories attached?
+ (BOOL)accessoriesAttached {
    // Check if any accessories are connected
    @try {
        // Set up the accessory manger
        EAAccessoryManager *accessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Get the number of accessories connected
        int numberOfAccessoriesConnected = (int)[accessoryManager.connectedAccessories count];
        // Check if there are any connected
        if (numberOfAccessoriesConnected > 0) {
            // There are accessories connected
            return true;
        } else {
            // There are no accessories connected
            return false;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Are headphone attached?
+ (BOOL)headphonesAttached {
    // Check if the headphones are connected
    @try {
        // Get the audiosession route information
        AVAudioSessionRouteDescription *route = [[AVAudioSession sharedInstance] currentRoute];
        
        // Run through all the route outputs
        for (AVAudioSessionPortDescription *desc in [route outputs]) {
            
            // Check if any of the ports are equal to the string headphones
            if ([[desc portType] isEqualToString:AVAudioSessionPortHeadphones]) {
                
                // Return YES
                return YES;
            }
        }
        
        // No headphones attached
        return NO;
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Number of attached accessories
+ (NSInteger)numberAttachedAccessories {
    // Get the number of attached accessories
    @try {
        // Set up the accessory manger
        EAAccessoryManager *accessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Get the number of accessories connected
        int numberOfAccessoriesConnected = (int)[accessoryManager.connectedAccessories count];
        // Return how many accessories are attached
        return numberOfAccessoriesConnected;
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Name of attached accessory/accessories (seperated by , comma's)
+ (NSString *)nameAttachedAccessories {
    // Get the name of the attached accessories
    @try {
        // Set up the accessory manger
        EAAccessoryManager *accessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Set up an accessory (for later use)
        EAAccessory *accessory;
        // Get the number of accessories connected
        int numberOfAccessoriesConnected = (int)[accessoryManager.connectedAccessories count];
        
        // Check to make sure there are accessories connected
        if (numberOfAccessoriesConnected > 0) {
            // Set up a string for all the accessory names
            NSString *allAccessoryNames = @"";
            // Set up a string for the accessory names
            NSString *accessoryName;
            // Get the accessories
            NSArray *accessoryArray = accessoryManager.connectedAccessories;
            // Run through all the accessories
            for (int x = 0; x < numberOfAccessoriesConnected; x++) {
                // Get the accessory at that index
                accessory = [accessoryArray objectAtIndex:x];
                // Get the name of it
                accessoryName = [accessory name];
                // Make sure there is a name
                if (accessoryName == nil || accessoryName.length == 0) {
                    // If there isn't, try and get the manufacturer name
                    accessoryName = [accessory manufacturer];
                }
                // Make sure there is a manufacturer name
                if (accessoryName == nil || accessoryName.length == 0) {
                    // If there isn't a manufacturer name still
                    accessoryName = @"Unknown";
                }
                // Format that name
                allAccessoryNames = [allAccessoryNames stringByAppendingFormat:@"%@", accessoryName];
                if (x < numberOfAccessoriesConnected - 1) {
                    allAccessoryNames = [allAccessoryNames stringByAppendingFormat:@", "];
                }
            }
            // Return the name/s of the connected accessories
            return allAccessoryNames;
        } else {
            // No accessories connected
            return nil;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return nil;
    }
}

@end
