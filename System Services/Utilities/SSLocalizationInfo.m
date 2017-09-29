//
//  SSLocalizationInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSLocalizationInfo.h"

@implementation SSLocalizationInfo

// Localization Information

// Country
+ (NSString *)country {
    // Get the user's country
    @try {
        // Get the locale
        NSLocale *locale = [NSLocale currentLocale];
        // Get the country from the locale
        NSString *country = [locale localeIdentifier];
        // Check for validity
        if (country == nil || country.length <= 0) {
            // Error, invalid country
            return nil;
        }
        // Completed Successfully
        return country;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Language
+ (NSString *)language {
    // Get the user's language
    @try {
        // Get the list of languages
        NSArray *languageArray = [NSLocale preferredLanguages];
        // Get the user's language
        NSString *language = [languageArray objectAtIndex:0];
        // Check for validity
        if (language == nil || language.length <= 0) {
            // Error, invalid language
            return nil;
        }
        // Completed Successfully
        return language;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// TimeZone
+ (NSString *)timeZone {
    // Get the user's timezone
    @try {
        // Get the system timezone
        NSTimeZone *localTime = [NSTimeZone systemTimeZone];
        // Convert the time zone to a string
        NSString *timeZone = [localTime name];
        // Check for validity
        if (timeZone == nil || timeZone.length <= 0) {
            // Error, invalid TimeZone
            return nil;
        }
        // Completed Successfully
        return timeZone;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Currency Symbol
+ (NSString *)currency {
    // Get the user's currency
    @try {
        // Get the system currency
        NSString *currency = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
        // Check for validity
        if (currency == nil || currency.length <= 0) {
            // Error, invalid Currency
            return nil;
        }
        // Completed Successfully
        return currency;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
