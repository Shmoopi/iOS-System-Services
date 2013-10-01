//
//  PBGauge.h
//  SimpleGauge
//
//  Created by Mike Sabatini on 1/30/13.
//  Copyright (c) 2013 Mike Sabatini. All rights reserved.
//

#import "MSSimpleGaugeSubclass.h"

@interface MSAnnotatedGauge : MSSimpleGauge
@property (nonatomic) NSNumberFormatter *valueFormatter;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *valueLabel;
@property (nonatomic) UILabel *startRangeLabel;
@property (nonatomic) UILabel *endRangeLabel;
@end
