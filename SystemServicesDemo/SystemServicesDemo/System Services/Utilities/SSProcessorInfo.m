//
//  SSProcessorInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSProcessorInfo.h"

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

// Processor Speed in MHz
+ (NSInteger)processorSpeed {
    // Try to get the processor speed
	@try {
        // Set the variables
        int hertz;
        size_t size = sizeof(int);
        int mib[2] = {CTL_HW, HW_CPU_FREQ};
        
        // Find the speed
        sysctl(mib, 2, &hertz, &size, NULL, 0);
        
        // Make sure it's not less than 0
        if (hertz < 1) {
            // Invalid value
            return -1;
        }
        
        // Divide the final speed by 1 million to get the speed in mhz
		hertz /= 1000000;
        
        // Return the result
        return hertz;
	}
	@catch (NSException * ex) {
        // Unable to get the speed (return -1)
        return -1;
	}
}

// Processor Bus Speed in MHz
+ (NSInteger)processorBusSpeed {
    // Try to get the processor bus speed
	@try {
        // Set the variables
		size_t size;
		int speed[2];
		int final;
		
        // Find the speeds
		speed[0] = CTL_HW;
		speed[1] = HW_BUS_FREQ;
        size = sizeof(final);
        
        // Get the actual speed
		sysctl(speed, 2, &final, &size, NULL, 0);
		if (final > 0)
			final /= 1000000;
        else
            return -1;
		
        // Return the result
        return final;
	}
	@catch (NSException * ex) {
        // Unable to get the speed (return -1)
        return -1;
	}
}

@end
