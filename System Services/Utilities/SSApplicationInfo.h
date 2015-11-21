//
//  SSApplicationInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Created by binaryboy on 10/24/15.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSApplicationInfo : NSObject

// Application Information

// Application Version
+ (NSString *)applicationVersion;

// Clipboard Content
+ (NSString *)clipboardContent;

// Application CPU Usage
+ (float)cpuUsage;

@end
