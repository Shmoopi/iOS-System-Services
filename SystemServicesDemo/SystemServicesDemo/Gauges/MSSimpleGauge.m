//
//  PBSimpleGauge.m
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/9/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSSimpleGauge.h"
#import "MSArcLayer.h"
#import "MSGradientArcLayer.h"
#import <QuartzCore/QuartzCore.h>

#define M_PI 3.14159265358979323846264338327950288
#define DEGREES_TO_RADIANS(angle) (angle * (M_PI/180))

#define NEEDLE_BASE_WIDTH_RATIO .04

@interface MSSimpleGauge ()
@property (nonatomic) CALayer *containerLayer;
@property (nonatomic) MSGradientArcLayer *valueArcLayer;
@property (nonatomic) MSGradientArcLayer *backgroundArcLayer;
@end

@implementation MSSimpleGauge
#pragma mark - Initialization / Construction
- (void)setup
{
    _minValue = 0;
    _maxValue = 100;
    _value = 0;
    
    _startAngle = 40;
    _endAngle = 140;
    
    _arcThickness = 50;

    _backgroundArcFillColor = [UIColor colorWithRed:.82 green:.82 blue:.82 alpha:1];
    _backgroundArcStrokeColor = [UIColor colorWithRed:.82 green:.82 blue:.82 alpha:1];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat needleWidth = width * NEEDLE_BASE_WIDTH_RATIO;
    _needleView = [[MSNeedleView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 needleWidth,
                                                                 width/2+4)];
    if ( [_needleView respondsToSelector:@selector(contentScaleFactor)] )
    {
        _needleView.contentScaleFactor = [[UIScreen mainScreen] scale];
    }
    [self addSubview:_needleView];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _needleView.layer.anchorPoint = CGPointMake(.5, (height-(needleWidth/2))/height);
    _needleView.center = CGPointMake(width/2, height-needleWidth/2);
    [self rotateNeedleByAngle:-90+_startAngle];
    
    _containerLayer = [CALayer layer];
    _containerLayer.frame = CGRectMake(0, 0, width, height);
    [self.layer insertSublayer:_containerLayer atIndex:0];
    [self setupArcLayers];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

#pragma mark - Private / Protected
- (void)setValue:(id)value forKey:(NSString *)key animated:(BOOL)animated
{
    // half second duration or none depending on animated flag
    float duration = animated ? .5 : 0;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self setValue:value forKey:key];
                     }
                     completion:^(BOOL finished) {
                     }];
}


- (void)rotateNeedleByAngle:(float)angle
{
    CATransform3D rotatedTransform = self.needleView.layer.transform;
    rotatedTransform = CATransform3DRotate(rotatedTransform, DEGREES_TO_RADIANS(angle), 0.0f, 0.0f, 1.0f);
    self.needleView.layer.transform = rotatedTransform;
}

- (void)setupArcLayers
{
    _backgroundArcLayer = [MSGradientArcLayer layer];
    _backgroundArcLayer.strokeColor = _backgroundArcStrokeColor;
    _backgroundArcLayer.fillColor = _backgroundArcFillColor;
    _backgroundArcLayer.gradient = _backgroundGradient;
    _backgroundArcLayer.strokeWidth = 1.0;
    _backgroundArcLayer.arcThickness = _arcThickness;
    _backgroundArcLayer.startAngle = DEGREES_TO_RADIANS((_startAngle+180));
    _backgroundArcLayer.endAngle = DEGREES_TO_RADIANS((_endAngle+180));
    _backgroundArcLayer.bounds = _containerLayer.bounds;
    _backgroundArcLayer.anchorPoint = CGPointZero;
    if ( [_backgroundArcLayer respondsToSelector:@selector(contentsScale)] )
    {
        _backgroundArcLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    [_containerLayer addSublayer:_backgroundArcLayer];
    
    _valueArcLayer = [MSGradientArcLayer layer];
    _valueArcLayer.strokeColor = _fillArcStrokeColor;
    _valueArcLayer.fillColor = _fillArcFillColor;
    _valueArcLayer.gradient = _fillGradient;
    _valueArcLayer.arcThickness = _arcThickness;
    _valueArcLayer.startAngle = DEGREES_TO_RADIANS((_startAngle+180));
    _valueArcLayer.endAngle = DEGREES_TO_RADIANS((_startAngle+180));
    _valueArcLayer.bounds = _containerLayer.bounds;
    _valueArcLayer.anchorPoint = CGPointZero;
    if ( [_valueArcLayer respondsToSelector:@selector(contentsScale)] )
    {
        _valueArcLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    [_containerLayer addSublayer:_valueArcLayer];
}

- (void)fillUpToAngle:(float)angle
{
    if ( _valueArcLayer )
    {
        _valueArcLayer.endAngle = DEGREES_TO_RADIANS((angle+180));
    }
}

- (float)angleForValue:(float)value
{
    float ratio = value / _maxValue;
    float angle = _startAngle + ((_endAngle - _startAngle) * ratio);
    return angle;
}

#pragma mark - Setters
- (void)setArcThickness:(float)arcThickness
{
    if ( _arcThickness != arcThickness )
    {
        _arcThickness = arcThickness;
        [self setNeedsDisplay];
    }
}

- (void)setStartAngle:(float)startAngle
{
    if ( _startAngle != startAngle )
    {
        float oldNeedleAngle = [self angleForValue:self.value];
        
        _startAngle = startAngle;
        _backgroundArcLayer.startAngle = DEGREES_TO_RADIANS((_startAngle+180));
        _valueArcLayer.startAngle = DEGREES_TO_RADIANS((_startAngle+180));
        
        float newNeedleAngle = [self angleForValue:self.value];
        float newAngle = newNeedleAngle - oldNeedleAngle;
        [self rotateNeedleByAngle:newAngle];
    }
}

- (void)setEndAngle:(float)endAngle
{
    if ( _endAngle != endAngle )
    {
        float oldNeedleAngle = [self angleForValue:self.value];
        
        _endAngle = endAngle;
        _backgroundArcLayer.endAngle = DEGREES_TO_RADIANS((_endAngle+180));
        _valueArcLayer.endAngle = DEGREES_TO_RADIANS((oldNeedleAngle+180));
        
        float newNeedleAngle = [self angleForValue:self.value];
        float newAngle = newNeedleAngle - oldNeedleAngle;
        [self rotateNeedleByAngle:newAngle];
    }
}

- (void)setMinValue:(float)minValue
{
    if ( _minValue != minValue )
    {
        // don't let the min value be greater than the max value
        minValue = minValue > _maxValue ? _maxValue : minValue;
        _minValue = minValue;
    }
}

- (void)setMaxValue:(float)maxValue
{
    if ( _maxValue != maxValue )
    {
        // don't let the max value be lower then the min value
        maxValue = maxValue < _minValue ? _minValue : maxValue;
        _maxValue = maxValue;
    }
}

- (void)setValue:(float)value
{
    if ( _value != value )
    {
        // setting value above the max value sets to max value
        value = value > _maxValue ? _maxValue : value;
       
        // setting value below the min value set to min value
        value = value < _minValue ? _minValue : value;
        
        float oldAngle = [self angleForValue:_value];
        float newAngle = [self angleForValue:value];
        _value = value;
        
        [self rotateNeedleByAngle:newAngle - oldAngle];
        [self fillUpToAngle:newAngle];
    }
}

- (void)setBackgroundArcFillColor:(UIColor *)backgroundArcFillColor
{
    _backgroundArcLayer.fillColor = backgroundArcFillColor;
}

- (void)setBackgroundArcStrokeColor:(UIColor *)backgroundArcStrokeColor
{
    _backgroundArcLayer.strokeColor = backgroundArcStrokeColor;
}

- (void)setFillArcFillColor:(UIColor *)foregroundArcFillColor
{
    _valueArcLayer.fillColor = foregroundArcFillColor;
}

- (void)setFillArcStrokeColor:(UIColor *)foregroundArcStrokeColor
{
    _valueArcLayer.strokeColor = foregroundArcStrokeColor;
}

- (void)setFillGradient:(CGGradientRef)fillGradient
{
    _valueArcLayer.gradient = fillGradient;
}

- (void)setBackgroundGradient:(CGGradientRef)backgroundGradient
{
    _backgroundArcLayer.gradient = backgroundGradient;
}

#pragma mark - Animated Setters
- (void)setValue:(float)value animated:(BOOL)animated
{
    [self setValue:@(value) forKey:@"value" animated:animated];
}

- (void)setEndAngle:(float)endAngle animated:(BOOL)animated
{
    [self setValue:@(endAngle) forKey:@"endAngle" animated:animated];
}

- (void)setStartAngle:(float)startAngle animated:(BOOL)animted
{
    [self setValue:@(startAngle) forKey:@"startAngle" animated:animted];
}
@end
