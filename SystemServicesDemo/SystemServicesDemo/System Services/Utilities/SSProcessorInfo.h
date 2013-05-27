//
//  SSProcessorInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/17/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSProcessorInfo : NSObject

// Processor Information

// Number of processors
+ (NSInteger)numberProcessors;

// Number of Active Processors
+ (NSInteger)numberActiveProcessors;

// Processor Speed in MHz
+ (NSInteger)processorSpeed;

// Processor Bus Speed in MHz
+ (NSInteger)processorBusSpeed;

@end
