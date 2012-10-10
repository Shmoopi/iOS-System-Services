//
//  SSCarrierInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSCarrierInfo : NSObject

// Carrier Information

// Carrier Name
+ (NSString *)carrierName;

// Carrier Country
+ (NSString *)carrierCountry;

// Carrier Mobile Country Code
+ (NSString *)carrierMobileCountryCode;

// Carrier ISO Country Code
+ (NSString *)carrierISOCountryCode;

// Carrier Mobile Network Code
+ (NSString *)carrierMobileNetworkCode;

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP;

@end
