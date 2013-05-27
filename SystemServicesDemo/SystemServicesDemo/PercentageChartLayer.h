//
//  PercentageChartLayer.h
//  PercentageChart
//
//  Created by Xavi Gil on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#define DEG2RAD(angle) angle*M_PI/180.0

#define INITIAL_ANGLE 180
#define ENDING_ANGLE 0
#define CENTER_WIDTH 8

@interface PercentageChartLayer : CALayer
{
    
}

@property(nonatomic) CGFloat percentage;
@property(nonatomic, strong) NSString *text;

@property(nonatomic) CGColorRef mainColor;
@property(nonatomic) UIColor *secondaryColor;
@property(nonatomic) CGColorRef lineColor;

@property(nonatomic, strong) NSString *fontName;
@property(nonatomic) CGFloat fontSize;
@property(nonatomic) CGColorRef fontColor;

- (id)initWithLayer:(id)aLayer;

@end
