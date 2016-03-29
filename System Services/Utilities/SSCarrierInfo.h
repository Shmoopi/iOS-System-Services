//
//  SSCarrierInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCarrierInfo : NSObject

// Carrier Information

// Carrier Name
+ (nullable NSString *)carrierName;

// Carrier Country
+ (nullable NSString *)carrierCountry;

// Carrier Mobile Country Code
+ (nullable NSString *)carrierMobileCountryCode;

// Carrier ISO Country Code
+ (nullable NSString *)carrierISOCountryCode;

// Carrier Mobile Network Code
+ (nullable NSString *)carrierMobileNetworkCode;

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP;

@end
