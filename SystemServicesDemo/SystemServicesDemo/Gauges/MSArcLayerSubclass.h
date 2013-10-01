//
//  PBArcLayerSubclass.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/15/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#ifndef SimpleGauge_PBArcLayerSubclass_h
#define SimpleGauge_PBArcLayerSubclass_h

#import "MSArcLayer.h"

@interface MSArcLayer (SubclassInfo)
- (void)drawArcInContext:(CGContextRef)ctx;
@end

#endif
