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

/**
 * processMotion:withError:
 *
 * Appends the new motion data to the appropriate instance variable strings.
 */
- (void)processMotion:(CMDeviceMotion*)motion withError:(NSError*)error;

/**
 * processAccel:withError:
 *
 * Appends the new raw accleration data to the appropriate instance variable string.
 */
- (void)processAccel:(CMAccelerometerData*)accelData withError:(NSError*)error;

/**
 * processGyro:withError:
 *
 * Appends the new raw gyro data to the appropriate instance variable string.
 */
- (void)processGyro:(CMGyroData*)gyroData withError:(NSError*)error;

@end

// Implementation
@implementation SSAccelerometerInfo

@synthesize attitudeString, gravityString, magneticFieldString, rotationRateString, userAccelerationString, rawGyroscopeString, rawAccelerometerString;

// Accelerometer Information

// Device Orientation
+ (UIInterfaceOrientation)deviceOrientation {
    // Get the interface orientation from the active window scene (the modern,
    // multi-window-safe replacement for the deprecated -statusBarOrientation).
    @try {
        #if !(defined(__has_feature) && __has_feature(attribute_availability_app_extension))
            UIWindowScene *windowScene = nil;

            // Prefer the foreground-active scene, falling back to any window scene.
            for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
                if (![scene isKindOfClass:[UIWindowScene class]]) {
                    continue;
                }
                windowScene = (UIWindowScene *)scene;
                if (scene.activationState == UISceneActivationStateForegroundActive) {
                    break;
                }
            }

            if (windowScene != nil) {
                return windowScene.interfaceOrientation;
            }
        #endif

        // Unable to determine the orientation
        return UIInterfaceOrientationUnknown;
    }
    @catch (NSException *exception) {
        return UIInterfaceOrientationUnknown;
    }
}

// Start logging motion data
- (void)startLoggingMotionData {
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 0.01; //100 Hz
    motionManager.accelerometerUpdateInterval = 0.01;
    motionManager.gyroUpdateInterval = 0.01;
    
    // Limiting the concurrent ops to 1 is a cheap way to avoid two handlers editing the same
    // string at the same time.
    deviceMotionQueue = [[NSOperationQueue alloc] init];
    [deviceMotionQueue setMaxConcurrentOperationCount:1];
    
    accelQueue = [[NSOperationQueue alloc] init];
    [accelQueue setMaxConcurrentOperationCount:1];
    
    gyroQueue = [[NSOperationQueue alloc] init];
    [gyroQueue setMaxConcurrentOperationCount:1];

    // Logging Motion Data
    
    CMDeviceMotionHandler motionHandler = ^(CMDeviceMotion *motion, NSError *error) {
        [self processMotion:motion withError:error];
    };
    
    CMGyroHandler gyroHandler = ^(CMGyroData *gyroData, NSError *error) {
        [self processGyro:gyroData withError:error];
    };
    
    CMAccelerometerHandler accelHandler = ^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self processAccel:accelerometerData withError:error];
    };
    
    [motionManager startDeviceMotionUpdatesToQueue:deviceMotionQueue withHandler:motionHandler];
    
    [motionManager startGyroUpdatesToQueue:gyroQueue withHandler:gyroHandler];
    
    [motionManager startAccelerometerUpdatesToQueue:accelQueue withHandler:accelHandler];
}

// Stop logging motion data
- (void)stopLoggingMotionData {
    
    // Stop everything
    [motionManager stopDeviceMotionUpdates];
    [deviceMotionQueue waitUntilAllOperationsAreFinished];
    
    [motionManager stopAccelerometerUpdates];
    [accelQueue waitUntilAllOperationsAreFinished];
    
    [motionManager stopGyroUpdates];
    [gyroQueue waitUntilAllOperationsAreFinished];
    
}

#pragma mark - Set Motion Variables when Updating (in background)

- (void)processAccel:(CMAccelerometerData*)accelData withError:(NSError*)error {
    rawAccelerometerString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", accelData.timestamp,
                              accelData.acceleration.x,
                              accelData.acceleration.y,
                              accelData.acceleration.z,
                              nil];
}

- (void)processGyro:(CMGyroData*)gyroData withError:(NSError*)error {
    
    rawGyroscopeString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", gyroData.timestamp,
                          gyroData.rotationRate.x,
                          gyroData.rotationRate.y,
                          gyroData.rotationRate.z,
                          nil];
}

- (void)processMotion:(CMDeviceMotion*)motion withError:(NSError*)error {
    
    attitudeString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", motion.timestamp,
                      motion.attitude.roll,
                      motion.attitude.pitch,
                      motion.attitude.yaw,
                      nil];
    
    gravityString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", motion.timestamp,
                     motion.gravity.x,
                     motion.gravity.y,
                     motion.gravity.z,
                     nil];
    
    magneticFieldString = [NSString stringWithFormat:@"%f,%f,%f,%f,%d\n", motion.timestamp,
                           motion.magneticField.field.x,
                           motion.magneticField.field.y,
                           motion.magneticField.field.z,
                           (int)motion.magneticField.accuracy,
                           nil];
    
    rotationRateString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", motion.timestamp,
                          motion.rotationRate.x,
                          motion.rotationRate.y,
                          motion.rotationRate.z,
                          nil];
    
    userAccelerationString = [NSString stringWithFormat:@"%f,%f,%f,%f\n", motion.timestamp,
                              motion.userAcceleration.x,
                              motion.userAcceleration.y,
                              motion.userAcceleration.z,
                              nil];
    
}


@end
