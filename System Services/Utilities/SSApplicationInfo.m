//
//  SSApplicationInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSApplicationInfo.h"

// UIKit
#import <UIKit/UIKit.h>

// mach
#import <mach/mach.h>

@implementation SSApplicationInfo

// Application Information

// Application Version
+ (NSString *)applicationVersion {
    // Get the Application Version Number
    @try {
        
        // Query the plist for the version
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        
        // Validate the Version
        if (version == nil || version.length <= 0) {
            // Invalid Version number
            return nil;
        }
        // Successful
        return version;
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
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
        // Get the string value of the pasteboard
        NSString *clipboardContent = [pasteBoard string];
        // Check for validity
        if (clipboardContent == nil || clipboardContent.length <= 0) {
            // Error, invalid pasteboard
            return nil;
        }
        // Successful
        return clipboardContent;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Application CPU Usage
+ (float)cpuUsage {
    @try {
        kern_return_t kr;
        task_info_data_t tinfo;
        mach_msg_type_number_t task_info_count;
        
        task_info_count = TASK_INFO_MAX;
        kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        task_basic_info_t      basic_info;
        thread_array_t         thread_list;
        mach_msg_type_number_t thread_count;
        
        thread_info_data_t     thinfo;
        mach_msg_type_number_t thread_info_count;
        
        thread_basic_info_t basic_info_th;
        uint32_t stat_thread = 0; // Mach threads
        
        basic_info = (task_basic_info_t)tinfo;
        
        // get threads in the task
        kr = task_threads(mach_task_self(), &thread_list, &thread_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        if (thread_count > 0)
            stat_thread += thread_count;
        
        long tot_sec = 0;
        long tot_usec = 0;
        float tot_cpu = 0;
        int j;
        
        for (j = 0; j < thread_count; j++)
        {
            thread_info_count = THREAD_INFO_MAX;
            kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                             (thread_info_t)thinfo, &thread_info_count);
            if (kr != KERN_SUCCESS) {
                return -1;
            }
            
            basic_info_th = (thread_basic_info_t)thinfo;
            
            if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
                tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
                tot_usec = tot_usec + basic_info_th->system_time.microseconds + basic_info_th->system_time.microseconds;
                tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 100.0;
            }
            
        } // for each thread
        
        kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
        assert(kr == KERN_SUCCESS);
        
        return tot_cpu;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

@end
