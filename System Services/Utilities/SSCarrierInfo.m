//
//  SSCarrierInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSCarrierInfo.h"

// Core Telephony
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation SSCarrierInfo

// Carrier Information

// Carrier Name
+ (NSString *)carrierName {
    // Get the carrier name
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        // Get the carrier name
        NSString *carrierName = [carrier carrierName];
        
        // Check to make sure it's valid
        if (carrierName == nil || carrierName.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return carrierName;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Country
+ (NSString *)carrierCountry {
    // Get the country that the carrier is located in
    @try {
        // Get the locale
        NSLocale *currentCountry = [NSLocale currentLocale];
        // Get the country Code
        NSString *country = [currentCountry objectForKey:NSLocaleCountryCode];
        // Check if it returned anything
        if (country == nil || country.length <= 0) {
            // No country found
            return nil;
        }
        // Return the country
        return country;
    }
    @catch (NSException *exception) {
        // Failed, return nil
        return nil;
    }
}

// Carrier Mobile Country Code
+ (NSString *)carrierMobileCountryCode {
    // Get the carrier mobile country code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        // Get the carrier mobile country code
        NSString *carrierCode = [carrier mobileCountryCode];
        
        // Check to make sure it's valid
        if (carrierCode == nil || carrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return carrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier ISO Country Code
+ (NSString *)carrierISOCountryCode {
    // Get the carrier ISO country code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        // Get the carrier ISO country code
        NSString *carrierCode = [carrier isoCountryCode];
        
        // Check to make sure it's valid
        if (carrierCode == nil || carrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return carrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Mobile Network Code
+ (NSString *)carrierMobileNetworkCode {
    // Get the carrier mobile network code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        // Get the carrier mobile network code
        NSString *carrierCode = [carrier mobileNetworkCode];
        
        // Check to make sure it's valid
        if (carrierCode == nil || carrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return carrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP {
    // Check if the carrier allows VOIP
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        // Get the carrier VOIP Status
        BOOL carrierVOIP = [carrier allowsVOIP];
        
        // Return the VOIP Status
        return carrierVOIP;
    }
    @catch (NSException *exception) {
        // Error finding the VOIP Status
        return false;
    }
}

@end
