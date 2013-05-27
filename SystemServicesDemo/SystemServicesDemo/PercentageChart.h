//
//  PercentageChart.h
//  PercentageChart
//
//  Created by Xavi Gil on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "PercentageChartLayer.h"

@interface PercentageChart : UIView
{
    
}

@property(nonatomic) CGFloat percentage;
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) UIColor *mainColor;
@property(nonatomic, strong) UIColor *secondaryColor;
@property(nonatomic, strong) UIColor *lineColor;

@property(nonatomic, strong) NSString *fontName;
@property(nonatomic) CGFloat fontSize;
@property(nonatomic, strong) UIColor *fontColor;

@end
