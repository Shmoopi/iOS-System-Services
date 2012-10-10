//
//  SSAccelerometerInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSAccelerometerInfo.h"

// Private
@interface SSAccelerometerInfo ()

// Start the accelerometer
+ (void)startAccelerometer;
// Stop the accelerometer
+ (void)stopAccelerometer;

@end

// Implementation
@implementation SSAccelerometerInfo

// Accelerometer Information

float xValue, yValue, zValue;

// Device Orientation
+ (UIDeviceOrientation)deviceOrientation {
    // Get the device's current orientation
    @try {
        // Device orientation
        UIDeviceOrientation Orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        // Successful
        return Orientation;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Accelerometer X Value
+ (float)accelerometerXValue {
    // Get the accelerometer X value
    @try {
        // Start the accelerometer updates
        [self startAccelerometer];
        // Delay for about 12 miliseconds
        [NSThread sleepForTimeInterval:0.12];
        // Get the X value
        float CurrentAccelerationXValue = xValue;
        // Stop the accelerometer updates
        [self stopAccelerometer];
        // Successful
        return CurrentAccelerationXValue;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Accelerometer Y Value
+ (float)accelerometerYValue {
    // Get the accelerometer Y value
    @try {
        // Set up the accelerometer
        UIAcceleration *Accelerometer = [UIAcceleration alloc];
        // Get the Y value
        float CurrentAccelerationYValue = Accelerometer.y;
        // Successful
        return CurrentAccelerationYValue;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

// Accelerometer Z Value
+ (float)accelerometerZValue {
    // Get the accelerometer Z value
    @try {
        // Set up the accelerometer
        UIAcceleration *Accelerometer = [UIAcceleration alloc];
        // Get the Z value
        float CurrentAccelerationZValue = Accelerometer.z;
        // Successful
        return CurrentAccelerationZValue;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

#pragma mark - Accelerometer Delegate / Start Stop Methods

// Accelerometer delegate
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // Set the x, y, and z values of the accelerometer
    xValue = (acceleration.x);
    yValue = (acceleration.y);
    zValue = (acceleration.z);
}

// Start the accelerometer updates
+ (void)startAccelerometer {
    // Set up the shared accelerometer
    UIAccelerometer *theAccelerometer = [UIAccelerometer sharedAccelerometer];
    // Set the delegate
    theAccelerometer.delegate = (id)self;
    // Set the update interval
    theAccelerometer.updateInterval = 0.1;
}

// Stop the accelerometer updates
+ (void)stopAccelerometer {
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = nil;
}

@end
