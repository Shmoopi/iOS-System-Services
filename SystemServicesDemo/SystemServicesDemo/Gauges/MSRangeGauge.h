//
//  PBRangeGauge.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/21/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSSimpleGaugeSubclass.h"

@interface MSRangeGauge : MSSimpleGauge
@property (nonatomic,assign) float lowerRangeValue;
@property (nonatomic,assign) float upperRangeValue;
@property (nonatomic) UIColor *rangeFillColor;
- (void)setLowerRangeValue:(float)lowerRangeValue animated:(BOOL)animated;
- (void)setUpperRangeValue:(float)upperRangeValue animated:(BOOL)animated;
@end
