//
//  SSProcessInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_CLASS_DEPRECATED_IOS(2_0, 9_0, "SSProcessInfo is deprecated. Process information is no longer allowed in iOS 9")
@interface SSProcessInfo : NSObject

// Process Information

// Process ID
+ (int)processID;

// Process Name
+ (nullable NSString *)processName;

// Process Status
+ (int)processStatus;

// Parent Process ID
+ (int)parentPID;

// Parent ID for a certain PID
+ (int)parentPIDForProcess:(int)pid;

// List of process information including PID's, Names, PPID's, and Status'
+ (nullable NSMutableArray *)processesInformation;

@end
