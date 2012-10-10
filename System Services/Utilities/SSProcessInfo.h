//
//  SSProcessInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSProcessInfo : NSObject

// Process Information

// Process ID
+ (int)processID;

// Process Name
+ (NSString *)processName;

// Process Status
+ (int)processStatus;

// Parent Process ID
+ (int)parentPID;

// Parent ID for a certain PID
+ (int)parentPIDForProcess:(int)pid;

// List of process information including PID's, Names, PPID's, and Status'
+ (NSMutableArray *)processesInformation;

@end
