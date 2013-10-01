//
//  PBGauge.m
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/30/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSAnnotatedGauge.h"
#import "MSArcLayer.h"

@interface MSAnnotatedGauge ()
@end

@implementation MSAnnotatedGauge

- (void)setup
{
    [super setup];
    
    _valueFormatter = [NSNumberFormatter new];
    _valueFormatter.minimumFractionDigits = 0;
    _valueFormatter.maximumFractionDigits = 2;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 15)];
        _titleLabel = titleLabel;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_titleLabel];
       
        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _titleLabel.frame.size.height, frame.size.width, 28)];
        _valueLabel = valueLabel;
        _valueLabel.font = [UIFont boldSystemFontOfSize:32];
        _valueLabel.textAlignment = NSTextAlignmentCenter;
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_valueLabel];
       
        NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel, valueLabel);
        NSArray *contraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[titleLabel(==12)]-0-[valueLabel(==32)]" options:0 metrics:nil views:views];
        [self addConstraints:contraints];
      
        CGPoint innerArcStartPoint = [self.backgroundArcLayer pointForArcEdge:ArcEdgeInner andArcSide:ArcSideBegining];
        _startRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, innerArcStartPoint.y+4, innerArcStartPoint.x, 14)];
        _startRangeLabel.font = [UIFont systemFontOfSize:10];
        _startRangeLabel.textColor = [UIColor lightGrayColor];
        _startRangeLabel.textAlignment = NSTextAlignmentRight;
        _startRangeLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_startRangeLabel];
        
        CGPoint innerArcEndPoint = [self.backgroundArcLayer pointForArcEdge:ArcEdgeInner andArcSide:ArcSideEnd];
        _endRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(innerArcEndPoint.x, innerArcEndPoint.y+4, self.frame.size.width-innerArcEndPoint.x, 14)];
        _endRangeLabel.font = [UIFont systemFontOfSize:10];
        _endRangeLabel.textColor = [UIColor lightGrayColor];
        _endRangeLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_endRangeLabel];
    }
    return self;
}

#pragma mark - Setters
- (void)setValue:(float)value
{
    [super setValue:value];
    if ( value <= self.maxValue && value >= self.minValue )
    {
        [self updateValueLabelAnimated:NO];
    }
}

- (void)updateValueLabelAnimated:(BOOL)animated
{
    if ( animated )
    {
        //[NSTimer scheduledTimerWithTimeInterval:.05
        //                                 target:self
        //                               selector:@selector(incrementTimerFired:)
        //                               userInfo:niln
        //                                repeats:YES];
    }
    else
    {
        [self updateValueLabelWithValue:self.value];
    }
}
//
//- (void)setValue:(float)value animated:(BOOL)animated
//{
//    [super setValue:value animated:animated];
//    [self updateValueLabelAnimated:animated];
//}
//
//- (void)incrementTimerFired:(NSTimer*)timer
//{
//    float currentLabelValue = _valueLabel.text.floatValue;
//    if ( currentLabelValue == self.value )
//    {
//        [timer invalidate];
//    }
//    else
//    {
//        currentLabelValue++;
//        [self updateValueLabelWithValue:currentLabelValue];
//    }
//}
//
- (void)updateValueLabelWithValue:(float)value
{
    _valueLabel.text = [NSString stringWithFormat:@"%@%% Used", [_valueFormatter stringFromNumber:@(value)]];
}

@end
