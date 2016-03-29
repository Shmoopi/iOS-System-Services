//
//  SSDiskInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSDiskInfo : NSObject

// Disk Information

// Total Disk Space
+ (nullable NSString *)diskSpace;

// Total Free Disk Space
+ (nullable NSString *)freeDiskSpace:(BOOL)inPercent;

// Total Used Disk Space
+ (nullable NSString *)usedDiskSpace:(BOOL)inPercent;

// Get the total disk space in long format
+ (long long)longDiskSpace;

// Get the total free disk space in long format
+ (long long)longFreeDiskSpace;

@end
