//
//  SSDiskInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSDiskInfo.h"

@implementation SSDiskInfo

// Disk Information

// Total Disk Space
+ (NSString *)diskSpace {
    // Get the total disk space
	@try {
        // Get the long total disk space
        long long Space = [self longDiskSpace];
		        
        // Check to make sure it's valid
        if (Space <= 0) {
            // Error, no disk space found
            return nil;
        }
        
        // Turn that long long into a string
        NSString *DiskSpace = [self formatMemory:Space];
        
        // Check to make sure it's valid
        if (DiskSpace == nil || DiskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return DiskSpace;
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
        NSString *DiskSpace;
        
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
            DiskSpace = [NSString stringWithFormat:@"%.f%%", PercentDiskSpace];
        } else {
            // Turn that long long into a string
            DiskSpace = [self formatMemory:Space];
        }
        
        // Check to make sure it's valid
        if (DiskSpace == nil || DiskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return DiskSpace;
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
        long long UDS;
        // Get the long total disk space
        long long TDS = [self longDiskSpace];
        // Get the long free disk space
        long long FDS = [self longFreeDiskSpace];
        
        // Make sure they're valid
        if (TDS <= 0 || FDS <= 0) {
            // Error, invalid values
            return nil;
        }
        
        // Now subtract the free space from the total space
        UDS = TDS - FDS;
        
        // Make sure it's valid
        if (UDS <= 0) {
            // Error, invalid value
            return nil;
        }
        
        // Set up the string output variable
        NSString *UsedDiskSpace;
        
        // If the user wants the output in percentage
        if (inPercent) {
            // Make a float to get the percent of those values
            float PercentUsedDiskSpace = (UDS * 100) / TDS;
            // Check it to make sure it's okay
            if (PercentUsedDiskSpace <= 0) {
                // Error, invalid percent
                return nil;
            }
            // Convert that float to a string
            UsedDiskSpace = [NSString stringWithFormat:@"%.f%%", PercentUsedDiskSpace];
        } else {
            // Turn that long long into a string
            UsedDiskSpace = [self formatMemory:UDS];
        }
        
        // Check to make sure it's valid
        if (UsedDiskSpace == nil || UsedDiskSpace.length <= 0) {
            // Error, diskspace not given
            return nil;
        }
        
        // Return successful
        return UsedDiskSpace;
        
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
        long long DiskSpace = 0L;
		NSError *Error = nil;
		NSDictionary *FileAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&Error];
        
        // Get the file attributes of the home directory assuming no errors
		if (Error == nil) {
            // Get the size of the filesystem
            DiskSpace = [[FileAttributes objectForKey:NSFileSystemSize] longLongValue];
        } else {
            // Error, return nil
            return -1;
        }
        
        // Check to make sure it's a valid size
        if (DiskSpace <= 0) {
            // Invalid size
            return -1;
        }
        
        // Successful
        return DiskSpace;
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
		NSError *Error = nil;
		NSDictionary *FileAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&Error];
		
        // Get the file attributes of the home directory assuming no errors
		if (Error == nil) {
			FreeDiskSpace = [[FileAttributes objectForKey:NSFileSystemFreeSize] longLongValue];
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
        NSString *FormattedBytes = nil;
        
        // Get the bytes, megabytes, and gigabytes
		double NumberBytes = 1.0 * Space;
		double TotalGB = NumberBytes / GB;
		double TotalMB = NumberBytes / MB;
		
        // Display them appropriately
		if (TotalGB >= 1.0) {
			FormattedBytes = [NSString stringWithFormat:@"%.2f GB", TotalGB];
	    } else if (TotalMB >= 1)
			FormattedBytes = [NSString stringWithFormat:@"%.2f MB", TotalMB];
		else {
			FormattedBytes = [self formattedMemory:Space];
			FormattedBytes = [FormattedBytes stringByAppendingString:@" bytes"];
		}
        
        // Check for errors
        if (FormattedBytes == nil || FormattedBytes.length <= 0) {
            // Error, invalid string
            return nil;
        }
        
        // Completed Successfully
        return FormattedBytes;
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
        NSString *FormattedBytes = nil;
        
        // Set up the format variable
		NSNumberFormatter *Formatter = [[NSNumberFormatter alloc] init];
        
        // Format the bytes
		[Formatter setPositiveFormat:@"###,###,###,###"];
        
        // Get the bytes
		NSNumber * theNumber = [NSNumber numberWithLongLong:Space];
        
        // Format the bytes appropriately
		FormattedBytes = [Formatter stringFromNumber:theNumber];
        
        // Check for errors
        if (FormattedBytes == nil || FormattedBytes.length <= 0) {
            // Error, invalid value
            return nil;
        }
        
        // Completed Successfully
        return FormattedBytes;
	}
	@catch (NSException *exception) {
        // Error
        return nil;
	}
}

@end
