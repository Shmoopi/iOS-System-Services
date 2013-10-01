//
//  PBRangeGauge.m
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/21/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSRangeGauge.h"
#import "MSGradientArcLayer.h"

@interface MSRangeGauge ()
@property (nonatomic) MSGradientArcLayer *rangeArc;
@end

@implementation MSRangeGauge

#pragma mark - Protected
- (void)setupArcLayers
{
    [super setupArcLayers];
    _rangeArc = [MSGradientArcLayer layer];
    _rangeArc.arcThickness = self.arcThickness;
    _rangeArc.startAngle = DEGREES_TO_RADIANS((self.startAngle+180));
    _rangeArc.endAngle = DEGREES_TO_RADIANS((self.startAngle+180));
    _rangeArc.bounds = self.containerLayer.bounds;
    _rangeArc.anchorPoint = CGPointZero;
    if ( [_rangeArc respondsToSelector:@selector(contentsScale)] )
    {
        _rangeArc.contentsScale = [[UIScreen mainScreen] scale];
    }
    [self.containerLayer addSublayer:_rangeArc];
}

// make this a no-op for the subclass
- (void)fillUpToAngle:(float)angle {}

#pragma mark - Setters
- (void)setUpperRangeValue:(float)upperRangeValue animated:(BOOL)animated
{
    [self setValue:@(upperRangeValue) forKey:@"upperRangeValue" animated:animated];
}

- (void)setLowerRangeValue:(float)lowerRangeValue animated:(BOOL)animated
{
    [self setValue:@(lowerRangeValue) forKey:@"lowerRangeValue" animated:animated];
}

- (void)setUpperRangeValue:(float)upperRangeValue
{
    upperRangeValue = fminf(upperRangeValue, self.maxValue);
    if ( _upperRangeValue != upperRangeValue )
    {
        _upperRangeValue = upperRangeValue;
        _rangeArc.endAngle = DEGREES_TO_RADIANS(([self angleForValue:_upperRangeValue]+180));
    }
}

- (void)setLowerRangeValue:(float)lowerRangeValue
{
    lowerRangeValue = fmaxf(lowerRangeValue, self.minValue);
    if ( _lowerRangeValue != lowerRangeValue )
    {
        _lowerRangeValue = lowerRangeValue;
        _rangeArc.startAngle = DEGREES_TO_RADIANS(([self angleForValue:_lowerRangeValue]+180));
    }
}

- (void)setRangeFillColor:(UIColor *)rangeFillColor
{
    _rangeArc.fillColor = rangeFillColor;
}
@end
