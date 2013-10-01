//
//  PBSimpleGaugeSubclass.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/21/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#ifndef SimpleGauge_PBSimpleGaugeSubclass_h
#define SimpleGauge_PBSimpleGaugeSubclass_h

#define M_PI   3.14159265358979323846264338327950288
#define DEGREES_TO_RADIANS(angle) (angle * (M_PI/180))

#import "MSSimpleGauge.h"
#import "MSArcLayer.h"

@interface MSSimpleGauge (Subclass)
@property (nonatomic) CALayer *containerLayer;
@property (nonatomic) MSArcLayer *backgroundArcLayer;
- (void)setup;
- (void)setupArcLayers;
- (float)angleForValue:(float)value;
- (void)fillUpToAngle:(float)angle;
- (void)setValue:(id)value forKey:(NSString *)key animated:(BOOL)animated;
@end

#endif
