//
//  SSAccelerometerInfo.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/20/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Core Motion
#import <CoreMotion/CoreMotion.h>

@interface SSAccelerometerInfo : NSObject {
    CMMotionManager *motionManager;
    
    NSOperationQueue *deviceMotionQueue;
    NSOperationQueue *accelQueue;
    NSOperationQueue *gyroQueue;
}

// Accelerometer Information

// Device Orientation
+ (UIInterfaceOrientation)deviceOrientation;

// Attitude
@property (nonatomic, readonly, nullable) NSString *attitudeString;

// Gravity
@property (nonatomic, readonly, nullable) NSString *gravityString;

// Magnetic Field
@property (nonatomic, readonly, nullable) NSString *magneticFieldString;

// Rotation Rate
@property (nonatomic, readonly, nullable) NSString *rotationRateString;

// User Acceleration
@property (nonatomic, readonly, nullable) NSString *userAccelerationString;

// Raw Gyroscope
@property (nonatomic, readonly, nullable) NSString *rawGyroscopeString;

// Raw Accelerometer
@property (nonatomic, readonly, nullable) NSString *rawAccelerometerString;

/**
 * startLoggingMotionData
 *
 * This method uses the boolean instance variables to tell the CMMotionManager what
 * to do. The three main types of IMU capture each have their own NSOperationQueue.
 * A queue will only be utilized if its respective motion type is going to be logged.
 *
 */
- (void)startLoggingMotionData;

/**
 * stopLoggingMotionDataAndSave
 *
 * Tells the CMMotionManager to stop the motion updates and calls the writeDataToDisk
 * method. The only gotchya is that we wait for the NSOperationQueues to finish
 * what they are doing first so that we're not accessing the same resource from
 * different points in the program.
 */
- (void)stopLoggingMotionData;

@end
