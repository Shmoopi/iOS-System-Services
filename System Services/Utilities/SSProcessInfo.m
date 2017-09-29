//
//  SSProcessInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSProcessInfo.h"

// sysctl
#import <sys/sysctl.h>

@implementation SSProcessInfo

// Process Information

// Process ID
+ (int)processID {
    // Get the Process ID
    @try {
        // Get the PID
        int pid = getpid();
        // Make sure it's correct
        if (pid <= 0) {
            // Incorrect PID
            return -1;
        }
        // Successful
        return pid;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

@end
