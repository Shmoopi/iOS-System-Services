//
//  PBSimpleGauge.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/9/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSNeedleView.h"

@interface MSSimpleGauge : UIView
@property (nonatomic) MSNeedleView *needleView;
@property (nonatomic,assign) float maxValue;
@property (nonatomic,assign) float minValue;
@property (nonatomic,assign) float value;
@property (nonatomic,assign) float startAngle;
@property (nonatomic,assign) float endAngle;
@property (nonatomic,assign) float arcThickness;
@property (nonatomic) UIColor *backgroundArcFillColor;
@property (nonatomic) UIColor *backgroundArcStrokeColor;
@property (nonatomic) UIColor *fillArcFillColor;
@property (nonatomic) UIColor *fillArcStrokeColor;
@property (nonatomic) CGGradientRef fillGradient;
@property (nonatomic) CGGradientRef backgroundGradient;
- (void)setValue:(float)value animated:(BOOL)animated;
- (void)setStartAngle:(float)startAngle animated:(BOOL)animted;
- (void)setEndAngle:(float)endAngle animated:(BOOL)animated;
@end
