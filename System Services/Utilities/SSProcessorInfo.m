 //
//  SSProcessorInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSProcessorInfo.h"

// Sysctl
#import <sys/sysctl.h>

// Mach
#include <mach/mach.h>

@implementation SSProcessorInfo

// Processor Information

// Number of processors
+ (NSInteger)numberProcessors {
    // See if the process info responds to selector
    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(processorCount)]) {
        // Get the number of processors
        NSInteger processorCount = [[NSProcessInfo processInfo] processorCount];
        // Return the number of processors
        return processorCount;
    } else {
        // Return -1 (not found)
        return -1;
    }
}

// Number of Active Processors
+ (NSInteger)numberActiveProcessors {
    // See if the process info responds to selector
    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(activeProcessorCount)]) {
        // Get the number of active processors
        NSInteger activeprocessorCount = [[NSProcessInfo processInfo] activeProcessorCount];
        // Return the number of active processors
        return activeprocessorCount;
    } else {
        // Return -1 (not found)
        return -1;
    }
}

// Get Processor Usage Information (i.e. ["0.2216801", "0.1009614"])
+ (NSArray *)processorsUsage {
    
    // Try to get Processor Usage Info
    @try {
        // Variables
        processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
        mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
        unsigned _numCPUs;
        NSLock *_cpuUsageLock;
        
        // Get the number of processors from sysctl
        int _mib[2U] = { CTL_HW, HW_NCPU };
        size_t _sizeOfNumCPUs = sizeof(_numCPUs);
        int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
        if (_status)
            _numCPUs = 1;
        
        // Allocate the lock
        _cpuUsageLock = [[NSLock alloc] init];
        
        // Get the processor info
        natural_t _numCPUsU = 0U;
        kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
        if (err == KERN_SUCCESS) {
            [_cpuUsageLock lock];
            
            // Go through info for each processor
            NSMutableArray *processorInfo = [NSMutableArray new];
            for (unsigned i = 0U; i < _numCPUs; ++i) {
                Float32 _inUse, _total;
                if (_prevCPUInfo) {
                    _inUse = (
                              (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                              + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                              + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                              );
                    _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
                } else {
                    _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                    _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
                }
                // Add to the processor usage info
                [processorInfo addObject:@(_inUse / _total)];
            }
            
            [_cpuUsageLock unlock];
            if (_prevCPUInfo) {
                size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
                vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
            }
            // Retrieved processor information
            return processorInfo;
        } else {
            // Unable to get processor information
            return nil;
        }
    } @catch (NSException *exception) {
        // Getting processor information failed
        return nil;
    }
}

@end
