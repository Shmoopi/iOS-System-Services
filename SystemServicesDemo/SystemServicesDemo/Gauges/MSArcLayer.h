//
//  PBArcLayer.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/13/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum {
    ArcEdgeInner = 0,
    ArcEdgeOuter
} ArcEdge;

typedef enum {
    ArcSideBegining = 0,
    ArcSideEnd
} ArcSide;

@interface MSArcLayer : CALayer
@property (nonatomic,assign) CGFloat startAngle;
@property (nonatomic,assign) CGFloat endAngle;
@property (nonatomic,assign) CGFloat strokeWidth;
@property (nonatomic,assign) CGFloat arcThickness;
@property (nonatomic) UIColor *fillColor;
@property (nonatomic) UIColor *strokeColor;
- (CGPoint)pointForArcEdge:(ArcEdge)edge andArcSide:(ArcSide)side;
@end
