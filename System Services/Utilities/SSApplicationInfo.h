//
//  SSApplicationInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSApplicationInfo : NSObject

// Application Information

// Application Version
+ (NSString *)applicationVersion;

// Clipboard Content
+ (NSString *)clipboardContent;

@end
