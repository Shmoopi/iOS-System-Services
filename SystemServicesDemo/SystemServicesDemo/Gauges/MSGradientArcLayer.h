//
//  PBGradientArcLayer.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/15/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MSArcLayerSubclass.h"

@interface MSGradientArcLayer : MSArcLayer
+ (CGGradientRef)defaultGradient;
@property (nonatomic,assign) CGGradientRef gradient;
@end
