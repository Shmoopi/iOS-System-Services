//
//  SSAccelerometerInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesConstants.h"

@interface SSAccelerometerInfo : NSObject <UIAccelerometerDelegate>

// Accelerometer Information

// Device Orientation
+ (UIDeviceOrientation)deviceOrientation;

// Accelerometer X Value
+ (float)accelerometerXValue;

// Accelerometer Y Value
+ (float)accelerometerYValue;

// Accelerometer Z Value
+ (float)accelerometerZValue;

@end
