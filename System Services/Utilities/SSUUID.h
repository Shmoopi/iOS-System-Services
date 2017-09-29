//
//  SSUUID.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUUID : NSObject

// CFUUID - Random Unique Identifier that changes every time
+ (nullable NSString *)cfuuid;

@end
