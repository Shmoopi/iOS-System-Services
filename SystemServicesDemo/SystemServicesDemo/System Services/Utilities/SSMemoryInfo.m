//
//  SSMemoryInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/19/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSMemoryInfo.h"

@implementation SSMemoryInfo

// Total Memory
+ (double)totalMemory {
    // Find the total amount of memoem	
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
		
		// Memory statistics in bytes
		natural_t UsedMemory = (vm_stat.active_count +
							  vm_stat.inactive_count +
							  vm_stat.wire_count) * pagesize;
		natural_t FreeMemory = vm_stat.free_count * pagesize;
		natural_t AllMemory = UsedMemory + FreeMemory;
		
		// Total Memory (formatted)
	    TotalMemory = (AllMemory / 1024.0) / 1024.0;
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Free Memory
+ (double)freeMemory:(BOOL)inPercent {
    // Find the total amount of free memory
	@try {
        // Set up the variables
        double TotalFreeMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
		
		// Memory statistics in bytes
		natural_t UsedMemory = (vm_stat.active_count +
                                vm_stat.inactive_count +
                                vm_stat.wire_count) * pagesize;
		natural_t FreeMemory = vm_stat.free_count * pagesize;
		natural_t AllMemory = UsedMemory + FreeMemory;
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = (FreeMemory /1024) / 1024;
            double AM = (AllMemory / 1024) / 1024;
            // Get the percent
            TotalFreeMemory = (FM * 100) / AM;
        } else {
            // Not in percent
            // Total Free Memory (formatted)
            TotalFreeMemory = (FreeMemory / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalFreeMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalFreeMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Used Memory
+ (double)usedMemory:(BOOL)inPercent {
    // Find the total amount of used memory
	@try {
        // Set up the variables
        double TotalUsedMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
		
		// Memory statistics in bytes
		natural_t UsedMemory = (vm_stat.active_count +
                                vm_stat.inactive_count +
                                vm_stat.wire_count) * pagesize;
		natural_t FreeMemory = vm_stat.free_count * pagesize;
		natural_t AllMemory = UsedMemory + FreeMemory;
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double UM = (UsedMemory /1024) / 1024;
            double AM = (AllMemory / 1024) / 1024;
            // Get the percent
            TotalUsedMemory = (UM * 100) / AM;
        } else {
            // Not in percent
            // Total Used Memory (formatted)
            TotalUsedMemory = (UsedMemory / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalUsedMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalUsedMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Available Memory
+ (double)availableMemory:(BOOL)inPercent {
    // Find the Available memory
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		vm_statistics_data_t vmStats;
		mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
		kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
		
		if(kernReturn != KERN_SUCCESS) {
			return -1;
		}
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = [self totalMemory];
            double AM = ((vm_page_size * vmStats.free_count) / 1024.0) / 1024.0;
            // Get the percent
            TotalMemory = (AM * 100) / FM;
        } else {
            // Not in percent
            // Total Memory (formatted)
            TotalMemory = ((vm_page_size * vmStats.free_count) / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Active Memory
+ (double)activeMemory:(BOOL)inPercent {
    // Find the Active memory
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = [self totalMemory];
            double AM = ((vm_stat.active_count * pagesize) / 1024.0) / 1024.0;
            // Get the percent
            TotalMemory = (AM * 100) / FM;
        } else {
            // Not in percent
            // Total Memory (formatted)
            TotalMemory = ((vm_stat.active_count * pagesize) / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Inactive Memory
+ (double)inactiveMemory:(BOOL)inPercent {
    // Find the Inactive memory
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = [self totalMemory];
            double AM = ((vm_stat.inactive_count * pagesize) / 1024.0) / 1024.0;
            // Get the percent
            TotalMemory = (AM * 100) / FM;
        } else {
            // Not in percent
            // Total Memory (formatted)
            TotalMemory = ((vm_stat.inactive_count * pagesize) / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Wired Memory
+ (double)wiredMemory:(BOOL)inPercent {
    // Find the Wired memory
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = [self totalMemory];
            double AM = ((vm_stat.wire_count * pagesize) / 1024.0) / 1024.0;
            // Get the percent
            TotalMemory = (AM * 100) / FM;
        } else {
            // Not in percent
            // Total Memory (formatted)
            TotalMemory = ((vm_stat.wire_count * pagesize) / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Purgable Memory
+ (double)purgableMemory:(BOOL)inPercent {
    // Find the Purgable memory
	@try {
        // Set up the variables
        double TotalMemory = 0.00;
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		
        // Get the variable values
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		
		vm_statistics_data_t vm_stat;
		
        // Check for any system errors
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			// Error, failed to get Virtual memory info
            return -1;
		}
        
        // Check if the user wants it in percent
        if (inPercent) {
            // Percent
            // Convert to doubles
            double FM = [self totalMemory];
            double AM = ((vm_stat.purgeable_count * pagesize) / 1024.0) / 1024.0;
            // Get the percent
            TotalMemory = (AM * 100) / FM;
        } else {
            // Not in percent
            // Total Memory (formatted)
            TotalMemory = ((vm_stat.purgeable_count * pagesize) / 1024.0) / 1024.0;
        }
        
        // Check to make sure it's valid
        if (TotalMemory <= 0) {
            // Error, invalid memory value
            return -1;
        }
        
        // Completed Successfully
        return TotalMemory;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

@end
