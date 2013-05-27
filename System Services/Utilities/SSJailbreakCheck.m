//
//  SSJailbreakCheck.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

/* Check out "Hacking and Securing iOS Applications" Book to determine all available methods */

#import "SSJailbreakCheck.h"

@implementation SSJailbreakCheck

// Jailbroken?
+ (BOOL)jailbroken {
    // Is the device jailbroken?
    
    // If it's the simulator then no
#ifdef __i386__
    // It's the developer
    return false;
#elif TARGET_IPHONE_SIMULATOR
    // It's the developer
    return false;
#endif
    
    // Make an int to monitor how many checks are failed
    int JailbreakInteger = 0;
    
    // URL Check
    if ([self openURLCheck]) {
        // Jailbroken
        JailbreakInteger += 3;
    }
    
    // Cydia Check
    if ([self cydiaCheck]) {
        // Jailbroken
        JailbreakInteger += 3;
    }
    
    // Inaccessible Files Check
    if ([self inaccessibleFileChecks]) {
        // Jailbroken
        JailbreakInteger += 2;
    }
    
    // Fork Check
    if ([self forkCheck]) {
        // Jailbroken
        JailbreakInteger += 2;
    }
    
    // Plist Check
    if ([self plistCheck]) {
        // Jailbroken
        JailbreakInteger += 2;
    }
    
    // Check if the Jailbreak Integer is 3 or more
    if (JailbreakInteger >= 3) {
        // Jailbroken
        return true;
    }
    
    // Not Jailbroken
    return false;
}

#pragma mark - Jailbreak Check Methods

// UIApplication CanOpenURL Check
+ (BOOL)openURLCheck {
    // Create a fake url for cydia
    NSURL *FakeURL = [NSURL URLWithString:@"cydia://package/com.fake.package"];
    // return whether or not it can be opened (cydia exists)
    return [[UIApplication sharedApplication] canOpenURL:FakeURL];
}

// Cydia Check
+ (BOOL)cydiaCheck {
    // Create a file path string
    NSString *filePath = @"/Applications/Cydia.app";
    // Check if it exists
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        // It exists
        return true;
    } else {
        // It doesn't exist
        return false;
    }
}

// Inaccessible File Checks
+ (BOOL)inaccessibleFileChecks {
    // Make an array of all file paths that indicate a jailbroken device
    NSArray *InaccessibleFiles = [NSArray arrayWithObjects:
                                  @"/Applications/RockApp.app",
                                  @"/Applications/Icy.app",
                                  @"/usr/sbin/sshd",
                                  @"/usr/bin/sshd",
                                  @"/usr/libexec/sftp-server",
                                  @"/Applications/WinterBoard.app",
                                  @"/Applications/SBSettings.app",
                                  @"/Applications/MxTube.app",
                                  @"/Applications/IntelliScreen.app",
                                  @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                                  @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                                  @"/private/var/lib/apt",
                                  @"/private/var/stash",
                                  @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                                  @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                                  @"/private/var/tmp/cydia.log",
                                  @"/private/var/lib/cydia",                            
                                  nil];
    
    // Run through the array of files
    for (NSString *key in InaccessibleFiles) {
        // Check if any of the files exist (should return no)
        if ([[NSFileManager defaultManager] fileExistsAtPath:key]) {
            // Jailbroken
            return true;
        } else {
            // Not jailbroken
            return false;
        }
    }
    
    // Shouldn't get this far, return jailbroken
    return true;
}

// Fork Check
+ (BOOL)forkCheck {
    // Check if this process can fork
    int result = fork();
    // If we're sandboxed, this won't happen
    if (result >= 0) {
        // No process should be allowed to fork
        return true;
    } else {
        // Process can't fork, not jailbroken
        return false;
    }
}

// Plist Check
+ (BOOL)plistCheck {
    // Define the plist
    NSDictionary *fileInfo = [[NSBundle mainBundle] infoDictionary];
    // Define the Executable name
    NSString *ExeName = [fileInfo objectForKey:@"Executable file"];
    // Get the executable file path
    NSString *ExePath = [NSString stringWithFormat:@"%@%@", [[NSBundle mainBundle] bundlePath], ExeName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:ExePath] == FALSE || fileInfo == nil || fileInfo.count <= 0) {
        // Executable file can't be found and the plist can't be found...hmmm
        return true;
    } else {
        // Everything is good
        return false;
    }
}

@end
