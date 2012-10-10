//
//  SSApplicationInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSApplicationInfo.h"

@implementation SSApplicationInfo

// Application Information

// Application Version
+ (NSString *)applicationVersion {
    // Get the Application Version Number
    @try {
        // Query the plist for the version
        NSString *Version = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        // Validate the Version
        if (Version == nil || Version.length <= 0) {
            // Invalid Version number
            return nil;
        }
        // Successful
        return Version;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Clipboard Content
+ (NSString *)clipboardContent {
    // Get the string content of the clipboard (copy, paste)
    @try {
        // Get the Pasteboard
        UIPasteboard *PasteBoard = [UIPasteboard generalPasteboard];
        // Get the string value of the pasteboard
        NSString *ClipboardContent = [PasteBoard string];
        // Check for validity
        if (ClipboardContent == nil || ClipboardContent.length <= 0) {
            // Error, invalid pasteboard
            return nil;
        }
        // Successful
        return ClipboardContent;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
