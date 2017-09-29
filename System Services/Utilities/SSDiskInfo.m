//
//  SSDiskInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSDiskInfo.h"

// Memory Info
#define MB (1024*1024)
#define GB (MB*1024)

@implementation SSDiskInfo

// Disk Information

// Total Disk Space
+ (NSString *)diskSpace {
    // Get the total disk space
	@try {
        // Get the long total disk space
        long long space = [self longDiskSpace];
		        
        // Check to make sure it's valid
        if (space <= 0) {
            // Error, no disk space found
            return nil;
        }
        
        // Turn that long long into a string
        NSString *diskSpace = [self formatMemory:space];
        
        // Check to make sure it's valid
        if (diskSpace == nil || diskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return diskSpace;
	}
	@catch (NSException * ex) {
        // Error
        return nil;
	}
}

// Total Free Disk Space
+ (NSString *)freeDiskSpace:(BOOL)inPercent {
    // Get the total free disk space
	@try {
        // Get the long size of free space
        long long Space = [self longFreeDiskSpace];
        
        // Check to make sure it's valid
        if (Space <= 0) {
            // Error, no disk space found
            return nil;
        }
        
        // Set up the string output variable
        NSString *diskSpace;
        
        // If the user wants the output in percentage
        if (inPercent) {
            // Get the total amount of space
            long long TotalSpace = [self longDiskSpace];
            // Make a float to get the percent of those values
            float PercentDiskSpace = (Space * 100) / TotalSpace;
            // Check it to make sure it's okay
            if (PercentDiskSpace <= 0) {
                // Error, invalid percent
                return nil;
            }
            // Convert that float to a string
            diskSpace = [NSString stringWithFormat:@"%.f%%", PercentDiskSpace];
        } else {
            // Turn that long long into a string
            diskSpace = [self formatMemory:Space];
        }
        
        // Check to make sure it's valid
        if (diskSpace == nil || diskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return diskSpace;
	}
	@catch (NSException * ex) {
        // Error
        return nil;
	}
}

// Total Used Disk Space
+ (NSString *)usedDiskSpace:(BOOL)inPercent {
    // Get the total used disk space
    @try {
        // Make a variable to hold the Used Disk Space
        long long uds;
        // Get the long total disk space
        long long tds = [self longDiskSpace];
        // Get the long free disk space
        long long fds = [self longFreeDiskSpace];
        
        // Make sure they're valid
        if (tds <= 0 || fds <= 0) {
            // Error, invalid values
            return nil;
        }
        
        // Now subtract the free space from the total space
        uds = tds - fds;
        
        // Make sure it's valid
        if (uds <= 0) {
            // Error, invalid value
            return nil;
        }
        
        // Set up the string output variable
        NSString *usedDiskSpace;
        
        // If the user wants the output in percentage
        if (inPercent) {
            // Make a float to get the percent of those values
            float percentUsedDiskSpace = (uds * 100) / tds;
            // Check it to make sure it's okay
            if (percentUsedDiskSpace <= 0) {
                // Error, invalid percent
                return nil;
            }
            // Convert that float to a string
            usedDiskSpace = [NSString stringWithFormat:@"%.f%%", percentUsedDiskSpace];
        } else {
            // Turn that long long into a string
            usedDiskSpace = [self formatMemory:uds];
        }
        
        // Check to make sure it's valid
        if (usedDiskSpace == nil || usedDiskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return usedDiskSpace;
        
        // Now convert that to a string
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

#pragma mark - Disk Information Long Values

// Get the total disk space in long format
+ (long long)longDiskSpace {
    // Get the long long disk space    
	@try {
        // Set up variables
        long long diskSpace = 0L;
		NSError *error = nil;
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
        
        // Get the file attributes of the home directory assuming no errors
        if (error == nil) {
            // Get the size of the filesystem
            diskSpace = [[fileAttributes objectForKey:NSFileSystemSize] longLongValue];
        } else {
            // Error, return nil
            return -1;
        }
        
        // Check to make sure it's a valid size
        if (diskSpace <= 0) {
            // Invalid size
            return -1;
        }
        
        // Successful
        return diskSpace;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

// Get the total free disk space in long format
+ (long long)longFreeDiskSpace {
    // Get the long total free disk space	
	@try {
        // Set up the variables
        long long FreeDiskSpace = 0L;
		NSError *error = nil;
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
		
        // Get the file attributes of the home directory assuming no errors
        if (error == nil) {
            FreeDiskSpace = [[fileAttributes objectForKey:NSFileSystemFreeSize] longLongValue];
        } else {
            // There was an error
            return -1;
        }
        
        // Check for valid size
        if (FreeDiskSpace <= 0) {
            // Invalid size
            return -1;
        }
        
        // Successful
        return FreeDiskSpace;
	}
	@catch (NSException *exception) {
        // Error
        return -1;
	}
}

#pragma mark - Memory Value Formatting

// Format the memory to a string in GB, MB, or Bytes
+ (NSString *)formatMemory:(long long)Space {
	// Format the long long disk space
	@try {
        // Set up the string
        NSString *formattedBytes = nil;
        
        // Get the bytes, megabytes, and gigabytes
		double numberBytes = 1.0 * Space;
		double totalGB = numberBytes / GB;
		double totalMB = numberBytes / MB;
		
        // Display them appropriately
		if (totalGB >= 1.0) {
            formattedBytes = [NSString stringWithFormat:@"%.2f GB", totalGB];
	    } else if (totalMB >= 1)
            formattedBytes = [NSString stringWithFormat:@"%.2f MB", totalMB];
		else {
            formattedBytes = [self formattedMemory:Space];
            formattedBytes = [formattedBytes stringByAppendingString:@" bytes"];
		}
        
        // Check for errors
        if (formattedBytes == nil || formattedBytes.length <= 0) {
            // Error, invalid string
            return nil;
        }
        
        // Completed Successfully
        return formattedBytes;
	}
	@catch (NSException *exception) {
        // Error
        return nil;
	}
}

// Format bytes to a string
+ (NSString *)formattedMemory:(unsigned long long)Space {
    // Format for bytes	
	@try {
        // Set up the string variable
        NSString *formattedBytes = nil;
        
        // Set up the format variable
		NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        
        // Format the bytes
		[formatter setPositiveFormat:@"###,###,###,###"];
        
        // Get the bytes
		NSNumber *theNumber = [NSNumber numberWithLongLong:Space];
        
        // Format the bytes appropriately
		formattedBytes = [formatter stringFromNumber:theNumber];
        
        // Check for errors
        if (formattedBytes == nil || formattedBytes.length <= 0) {
            // Error, invalid value
            return nil;
        }
        
        // Completed Successfully
        return formattedBytes;
	}
	@catch (NSException *exception) {
        // Error
        return nil;
	}
}

@end
