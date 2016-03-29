//
//  SSLocalizationInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSLocalizationInfo : NSObject

// Localization Information

// Country
+ (nullable NSString *)country;

// Language
+ (nullable NSString *)language;

// TimeZone
+ (nullable NSString *)timeZone;

// Currency Symbol
+ (nullable NSString *)currency;

@end
