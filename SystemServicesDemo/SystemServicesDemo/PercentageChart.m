//
//  PercentageChart.m
//  PercentageChart
//
//  Created by Xavi Gil on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PercentageChart.h"

@interface PercentageChart()
{
    CALayer *_mainLayer;
}

-(void) refresh;

@end



@implementation PercentageChart

@synthesize percentage;
@synthesize text;
@synthesize mainColor;
@synthesize secondaryColor;
@synthesize lineColor;
@synthesize fontName;
@synthesize fontSize;
@synthesize fontColor;

-(void) setPercentage:(CGFloat)newValue
{
    if( newValue > 100.0 ) newValue = 100.0;
    else if( newValue < 0.0 ) newValue = 0.0;
    percentage = newValue;
    [self refresh];
}

-(void) setText:(NSString *)newText
{
    text = newText;
    [self refresh];
}

-(void) setMainColor:(UIColor *)newColor
{
    mainColor = newColor;
    [self refresh];
}

-(void) setSecondaryColor:(UIColor *)newColor
{
    secondaryColor = newColor;
    [self refresh];
}

-(void) setLineColor:(UIColor *)newColor
{
    lineColor = newColor;
    [self refresh];
}

-(void) setFontName:(NSString *)aFontName
{
    fontName = aFontName;
    [self refresh];
}

-(void) setFontSize:(CGFloat)newSize
{
    fontSize = newSize;
    [self refresh];
}

- (void) setFontColor:(UIColor *)newFontColor {
    fontColor = newFontColor;
    [self refresh];
}

-(void) initialize
{
    _mainLayer = [PercentageChartLayer layer];
    [self.layer addSublayer:_mainLayer];    
    
    self.text = [NSString string];
    self.fontName = @"Helvetica";
    self.fontSize = 30.0;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self initialize];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) 
    {
        [self initialize];
    }
    return self;
}

-(void) refresh
{
    _mainLayer.frame = self.bounds;
    
    PercentageChartLayer *layer = (PercentageChartLayer *) _mainLayer;
    layer.percentage = self.percentage;
    layer.text = self.text;
    layer.mainColor = self.mainColor.CGColor;
    layer.secondaryColor = self.secondaryColor;
    layer.lineColor = self.lineColor.CGColor;
    layer.fontName = self.fontName;
    layer.fontSize = self.fontSize;
    layer.fontColor = self.fontColor.CGColor;
}

-(void)willMoveToSuperview:(UIView *)newSuperview 
{
    // We change the initial value so the chart gets drawn.
    self.percentage = 0.1;
    self.percentage = 0.0;
    [self refresh];
}



@end
