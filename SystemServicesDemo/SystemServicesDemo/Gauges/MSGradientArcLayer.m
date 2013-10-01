//
//  PBGradientArcLayer.m
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/15/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSGradientArcLayer.h"

@implementation MSGradientArcLayer
+ (CGGradientRef)defaultGradient
{
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { .23,.56,.75,1.0,  // Start color
        .48,.71,.84,1.0 }; // End color
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);
    return myGradient;
}

- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if ( self )
    {
        if ( [layer isKindOfClass:[MSGradientArcLayer class]] )
        {
            MSGradientArcLayer *otherLayer = (MSGradientArcLayer*)layer;
            self.gradient = otherLayer.gradient;
        }
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    // if there is a gradient defined, draw it. Otherwise have super do the drawing
    if ( self.gradient )
    {
        if ( self.startAngle < self.endAngle )
        {
            CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height);
            CGFloat radius = self.bounds.size.width/2;
            
            [self drawArcInContext:ctx];
            CGContextClip(ctx);
            CGContextDrawRadialGradient(ctx, _gradient, center, radius-self.arcThickness, center, radius, 0);
        }
    }
    else
    {
        [super drawInContext:ctx];
    }
}

- (void)setGradient:(CGGradientRef)gradient
{
    _gradient = gradient;
    [self setNeedsDisplay];
}

@end
