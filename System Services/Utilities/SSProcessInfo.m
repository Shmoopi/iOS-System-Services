//
//  SSProcessInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSProcessInfo.h"

@implementation SSProcessInfo

// Process Information

// Process ID
+ (int)processID {
    // Get the Process ID
    @try {
        // Get the PID
        int PID = getpid();
        // Make sure it's correct
        if (PID <= 0) {
            // Incorrect PID
            return -1;
        }
        // Successful
        return PID;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Process Name
+ (NSString *)processName {
    // Get the process name
    @try {
        // Set up the variables
        struct kinfo_proc info;
        size_t length = sizeof(struct kinfo_proc);
        int mib[4] = { CTL_KERN, KERN_PROC, KERN_PROC_PID, [self processID] };
        
        if (sysctl(mib, 4, &info, &length, NULL, 0) < 0)
            // Unknown value
            return nil;
        
        if (length == 0)
            // Unknown value
            return nil;
        
        // Make string for the PID Name
        NSString *processName = [[NSString alloc] initWithFormat:@"%s", info.kp_proc.p_comm];
        
        // Check to make sure it's valid
        if (processName == nil || processName.length <= 0) {
            // No PID Name found
            return nil;
        }
        
        // Successful
        return processName;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Process Status
+ (int)processStatus {
    // Get the process status
    @try {
        // Set up the variables
        struct kinfo_proc info;
        size_t length = sizeof(struct kinfo_proc);
        int mib[4] = { CTL_KERN, KERN_PROC, KERN_PROC_PID, [self processID] };
        
        if (sysctl(mib, 4, &info, &length, NULL, 0) < 0)
            // Unknown value
            return -1;
        
        if (length == 0)
            // Unknown value
            return -1;
        
        // Make string for the process status
        int processStatus = info.kp_proc.p_stat;
        
        // Check to make sure it's valid
        if (processStatus <= 0) {
            // No PID Status found
            return -1;
        }
        
        // Successful
        return processStatus;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Parent Process ID
+ (int)parentPID {
    // Get the parent process ID
    @try {
        // Get the Parent PID
        int ParentPID = [self parentPIDForProcess:[self processID]];
        
        // Check to make sure it's valid
        if (ParentPID <= 0) {
            // No PPID found
            return -1;
        }
        
        // Successful
        return ParentPID;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Parent ID for a certain PID
+ (int)parentPIDForProcess:(int)pid {
    // Get the parent ID for a certain process
    @try {
        // Set up the variables
        struct kinfo_proc info;
        size_t length = sizeof(struct kinfo_proc);
        int mib[4] = { CTL_KERN, KERN_PROC, KERN_PROC_PID, pid };
        
        if (sysctl(mib, 4, &info, &length, NULL, 0) < 0)
            // Unknown value
            return -1;
        
        if (length == 0)
            // Unknown value
            return -1;
        
        // Make an int for the PPID
        int PPID = info.kp_eproc.e_ppid;
        
        // Check to make sure it's valid
        if (PPID <= 0) {
            // No PPID found
            return -1;
        }
        
        // Successful
        return PPID;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// List of process information including PID's, Names, PPID's, and Status'
+ (NSMutableArray *)processesInformation {
    // Get the list of processes and all information about them
	@try {
        // Make a new integer array holding all the kernel processes
        int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
        
        // Make a new size of 4
        size_t miblen = 4;
        
        size_t size = 0;
        int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
        
        // Set up the processes and new process struct
        struct kinfo_proc *process = NULL;
        struct kinfo_proc *newprocess = NULL;
        
        // do, while loop rnning through all the processes
        do {
            size += size / 10;
            newprocess = realloc(process, size);
            
            if (!newprocess) {
                if (process) free(process);
                // Error
                return nil;
            }
            
            process = newprocess;
            st = sysctl(mib, miblen, process, &size, NULL, 0);
            
        } while (st == -1 && errno == ENOMEM);
        
        if (st == 0) {
            if (size % sizeof(struct kinfo_proc) == 0) {
                int nprocess = size / sizeof(struct kinfo_proc);
                
                if (nprocess) {
                    NSMutableArray *array = [[NSMutableArray alloc] init];
                    
                    for (int i = nprocess - 1; i >= 0; i--) {
                        
                        NSString *processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                        NSString *processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                        NSString *processPriority = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_priority];
                        NSDate   *processStartDate = [NSDate dateWithTimeIntervalSince1970:process[i].kp_proc.p_un.__p_starttime.tv_sec];
                        NSString       *processParentID = [[NSString alloc] initWithFormat:@"%d", [self parentPIDForProcess:(int)process[i].kp_proc.p_pid]];
                        NSString       *processStatus = [[NSString alloc] initWithFormat:@"%d", (int)process[i].kp_proc.p_stat];
                        NSString       *processFlags = [[NSString alloc] initWithFormat:@"%d", (int)process[i].kp_proc.p_flag];
                        
                        // Check to make sure all values are valid (if not, make them)
                        if (processID == nil || processID.length <= 0) {
                            // Invalid value
                            processID = @"Unkown";
                        }
                        if (processName == nil || processName.length <= 0) {
                            // Invalid value
                            processName = @"Unkown";
                        }
                        if (processPriority == nil || processPriority.length <= 0) {
                            // Invalid value
                            processPriority = @"Unkown";
                        }
                        if (processStartDate == nil) {
                            // Invalid value
                            processStartDate = [NSDate date];
                        }
                        if (processParentID == nil || processParentID.length <= 0) {
                            // Invalid value
                            processParentID = @"Unkown";
                        }
                        if (processStatus == nil || processStatus.length <= 0) {
                            // Invalid value
                            processStatus = @"Unkown";
                        }
                        if (processFlags == nil || processFlags.length <= 0) {
                            // Invalid value
                            processFlags = @"Unkown";
                        }
                        
                        // Create an array of the objects
                        NSArray *ItemArray = [NSArray arrayWithObjects:processID, processName, processPriority, processStartDate, processParentID, processStatus, processFlags, nil];
                        
                        // Create an array of keys
                        NSArray *KeyArray = [NSArray arrayWithObjects:@"PID", @"Name", @"Priority", @"StartDate", @"ParentID", @"Status", @"Flags", nil];
                        
                        // Create the dictionary
                        NSDictionary *dict = [[NSDictionary alloc] initWithObjects:ItemArray forKeys:KeyArray];
                        
                        // Add the objects to the array
                        [array addObject:dict];
                    }
                    
                    // Make sure the array is usable
                    if (array.count <= 0) {
                        // Error, nothing in array
                        return nil;
                    }
                    
                    // Free the process
                    free(process);
                    
                    // Successful
                    return array;
                }
            }
        }
        
        // Something failed
        return nil;
	}
	@catch (NSException * ex) {
        // Error
        return nil;
	}
}

@end
