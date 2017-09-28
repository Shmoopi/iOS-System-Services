//
//  SSJailbreakCheck.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

/* Check out "Hacking and Securing iOS Applications" Book to determine all available methods */

#import "SSJailbreakCheck.h"

// UIKit
#import <UIKit/UIKit.h>

// stat
#import <sys/stat.h>

// sysctl
#import <sys/sysctl.h>

// System Version Less Than
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// Failed jailbroken checks
enum {
    // Failed the Jailbreak Check
    KFJailbroken = 3429542,
    // Failed the OpenURL Check
    KFOpenURL = 321,
    // Failed the Cydia Check
    KFCydia = 432,
    // Failed the Inaccessible Files Check
    KFIFC = 47293,
    // Failed the plist check
    KFPlist = 9412,
    // Failed the Symbolic Link Check
    KFSymbolic = 34859,
    // Failed the File Exists Check
    KFFileExists = 6625,
} JailbrokenChecks;

@implementation SSJailbreakCheck

// Is the application running on a jailbroken device?
+ (int)jailbroken {
    // Is the device jailbroken?
    
    // Make an int to monitor how many checks are failed
    int motzart = 0;
    
    // Check if iOS 8 or lower
    if (SYSTEM_VERSION_LESS_THAN(@"9.0")) {
        // URL Check
        if ([self urlCheck] != NOTJAIL) {
            // Jailbroken
            motzart += 3;
        }
    }
    
    // Cydia Check
    if ([self cydiaCheck] != NOTJAIL) {
        // Jailbroken
        motzart += 3;
    }
    
    // Inaccessible Files Check
    if ([self inaccessibleFilesCheck] != NOTJAIL) {
        // Jailbroken
        motzart += 2;
    }
    
    // Plist Check
    if ([self plistCheck] != NOTJAIL) {
        // Jailbroken
        motzart += 2;
    }
    
    // Symbolic Link Check
    if ([self symbolicLinkCheck] != NOTJAIL) {
        // Jailbroken
        motzart += 2;
    }
    
    // FilesExist Integrity Check
    if ([self filesExistCheck] != NOTJAIL) {
        // Jailbroken
        motzart += 2;
    }
    
    // Check if the Jailbreak Integer is 3 or more
    if (motzart >= 3) {
        // Jailbroken
        return KFJailbroken;
    }
    
    // Not Jailbroken
    return NOTJAIL;
}

#pragma mark - Static Jailbreak Checks

// UIApplication CanOpenURL Check
+ (int)urlCheck {
    @try {
        #if !(defined(__has_feature) && __has_feature(attribute_availability_app_extension))
            // Create a fake url for cydia
            NSURL *fakeURL = [NSURL URLWithString:CYDIAPACKAGE];
            // Return whether or not cydia's openurl item exists
            if ([[UIApplication sharedApplication] canOpenURL:fakeURL])
               return KFOpenURL;
        #endif
    }
    @catch (NSException *exception) {
        // Error, return false
        return NOTJAIL;
    }
    return NOTJAIL;
}

// Cydia Check
+ (int)cydiaCheck {
    @try {
        // Create a file path string
        NSString *filePath = CYDIALOC;
        // Check if it exists
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            // It exists
            return KFCydia;
        } else {
            // It doesn't exist
            return NOTJAIL;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return NOTJAIL;
    }
}

// Inaccessible Files Check
+ (int)inaccessibleFilesCheck {
    @try {
        // Run through the array of files
        for (NSString *key in HIDDENFILES) {
            // Check if any of the files exist (should return no)
            if ([[NSFileManager defaultManager] fileExistsAtPath:key]) {
                // Jailbroken
                return KFIFC;
            }
        }
        
        // No inaccessible files found, return NOT Jailbroken
        return NOTJAIL;
    }
    @catch (NSException *exception) {
        // Error, return NOT Jailbroken
        return NOTJAIL;
    }
}

// Plist Check
+ (int)plistCheck {
    @try {
        // Define the Executable name
        NSString *exeName = EXEPATH;
        NSDictionary *ipl = PLISTPATH;
        // Check if the plist exists
        if ([FILECHECK exeName] == FALSE || ipl == nil || ipl.count <= 0) {
            // Executable file can't be found and the plist can't be found...hmmm
            return KFPlist;
        } else {
            // Everything is good
            return NOTJAIL;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return NOTJAIL;
    }
}

// Symbolic Link available
+ (int)symbolicLinkCheck {
    @try {
        // See if the Applications folder is a symbolic link
        struct stat s;
        if (lstat("/Applications", &s) != 0) {
            if (s.st_mode & S_IFLNK) {
                // Device is jailbroken
                return KFSymbolic;
            } else
                // Not jailbroken
                return NOTJAIL;
        } else {
            // Not jailbroken
            return NOTJAIL;
        }
    }
    @catch (NSException *exception) {
        // Not Jailbroken
        return NOTJAIL;
    }
}

// FileSystem working correctly?
+ (int)filesExistCheck {
    @try {
        // Check if filemanager is working
        if (![FILECHECK [[NSBundle mainBundle] executablePath]]) {
            // Jailbroken and trying to hide it
            return KFFileExists;
        } else
            // Not Jailbroken
            return NOTJAIL;
    }
    @catch (NSException *exception) {
        // Not Jailbroken
        return NOTJAIL;
    }
}

// Get the running processes
+ (NSArray *)runningProcesses {
    // Define the int array of the kernel's processes
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t miblen = 4;
    
    // Make a new size and int of the sysctl calls
    size_t size = 0;
    int st;
    
    // Make new structs for the processes
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    // Do get all the processes while there are no errors
    do {
        // Add to the size
        size += (size / 10);
        // Get the new process
        newprocess = realloc(process, size);
        // If the process selected doesn't exist
        if (!newprocess){
            // But the process exists
            if (process){
                // Free the process
                free(process);
            }
            // Return that nothing happened
            return nil;
        }
        
        // Make the process equal
        process = newprocess;
        
        // Set the st to the next process
        st = sysctl(mib, (int)miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    // As long as the process list is empty
    if (st == 0){
        
        // And the size of the processes is 0
        if (size % sizeof(struct kinfo_proc) == 0){
            // Define the new process
            int nprocess = (int)(size / sizeof(struct kinfo_proc));
            // If the process exists
            if (nprocess){
                // Create a new array
                NSMutableArray * array = [[NSMutableArray alloc] init];
                // Run through a for loop of the processes
                for (int i = nprocess - 1; i >= 0; i--){
                    // Get the process ID
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    // Get the process Name
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    // Get the process Priority
                    NSString *processPriority = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_priority];
                    // Get the process running time
                    NSDate   *processStartDate = [NSDate dateWithTimeIntervalSince1970:process[i].kp_proc.p_un.__p_starttime.tv_sec];
                    // Create a new dictionary containing all the process ID's and Name's
                    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processPriority, processName, processStartDate, nil]
                                                                       forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessPriority", @"ProcessName", @"ProcessStartDate", nil]];
                    
                    // Add the dictionary to the array
                    [array addObject:dict];
                }
                // Free the process array
                free(process);
                
                // Return the process array
                return array;
                
            }
        }
    }
    
    // Free the process array
    free(process);
    
    // If no processes are found, return nothing
    return nil;
}

@end
