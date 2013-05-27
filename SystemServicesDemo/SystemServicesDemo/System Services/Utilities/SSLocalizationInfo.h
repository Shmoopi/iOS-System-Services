//
//  SSLocalizationInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSLocalizationInfo : NSObject

// Localization Information

// Country
+ (NSString *)country;

// Language
+ (NSString *)language;

// TimeZone
+ (NSString *)timeZone;

// Currency Symbol
+ (NSString *)currency;

@end
