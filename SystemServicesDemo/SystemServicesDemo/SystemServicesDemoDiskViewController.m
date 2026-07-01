//
//  SystemServicesDemoDiskViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoDiskViewController.h"
#import "SystemServices.h"

// Annotated Gauge
#import "MSAnnotatedGauge.h"
#import "MSGradientArcLayer.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoDiskViewController ()
@property (nonatomic, strong) UIView *gaugeContainer;
@property (nonatomic, strong) MSAnnotatedGauge *annotatedGauge;
@property (nonatomic, assign) CGSize lastGaugeSize;
@end

@implementation SystemServicesDemoDiskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Keep the demo predictably light so the gauge annotations stay legible.
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    [self buildInterface];
    [self reloadDiskInformation];
}

// Build the screen in code with Auto Layout so the gauge is always centred in
// the space below the labels, on any device size.
- (void)buildInterface {
    self.lblTotalDiskSpace = [self makeLabel];
    self.lblUsedDiskSpace  = [self makeLabel];
    self.lblFreeDiskSpace  = [self makeLabel];

    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[
        self.lblTotalDiskSpace, self.lblUsedDiskSpace, self.lblFreeDiskSpace
    ]];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.spacing = 6;
    stack.alignment = UIStackViewAlignmentFill;
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stack];

    UIView *container = [[UIView alloc] init];
    container.translatesAutoresizingMaskIntoConstraints = NO;
    self.gaugeContainer = container;
    [self.view addSubview:container];

    UILayoutGuide *safe = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [stack.topAnchor constraintEqualToAnchor:safe.topAnchor constant:12],
        [stack.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor constant:16],
        [stack.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor constant:-16],

        [container.topAnchor constraintEqualToAnchor:stack.bottomAnchor constant:12],
        [container.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor constant:16],
        [container.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor constant:-16],
        [container.bottomAnchor constraintEqualToAnchor:safe.bottomAnchor constant:-16],
    ]];
}

- (UILabel *)makeLabel {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor labelColor];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    return label;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self layoutGaugeIfNeeded];
}

// The gauge positions its annotations from its init frame, so (re)create it
// whenever the available size changes; otherwise just refresh its value.
- (void)layoutGaugeIfNeeded {
    CGSize available = self.gaugeContainer.bounds.size;
    if (available.width <= 0 || available.height <= 0) {
        return;
    }

    // A semicircular gauge reads best at roughly a 5:3 aspect ratio.
    static const CGFloat kAspect = 0.6; // height / width
    CGFloat width = MIN(available.width, 460);
    CGFloat height = width * kAspect;
    if (height > available.height) {
        height = available.height;
        width = height / kAspect;
    }
    CGSize size = CGSizeMake(floor(width), floor(height));

    if (self.annotatedGauge != nil && CGSizeEqualToSize(size, self.lastGaugeSize)) {
        [self configureGauge];
        return;
    }

    [self.annotatedGauge removeFromSuperview];

    CGRect frame = CGRectMake((available.width - size.width) / 2.0,
                              (available.height - size.height) / 2.0,
                              size.width, size.height);
    MSAnnotatedGauge *gauge = [[MSAnnotatedGauge alloc] initWithFrame:frame];
    gauge.minValue = 0;
    gauge.maxValue = 100;
    gauge.backgroundColor = [UIColor clearColor];
    gauge.fillGradient = [MSGradientArcLayer defaultGradient];
    self.annotatedGauge = gauge;
    self.lastGaugeSize = size;
    [self.gaugeContainer addSubview:gauge];

    [self configureGauge];
}

- (void)configureGauge {
    SystemServices *ss = SystemSharedServices;
    self.annotatedGauge.titleLabel.text = [NSString stringWithFormat:@"Total Space: %@", ss.diskSpace];
    self.annotatedGauge.startRangeLabel.text = [NSString stringWithFormat:@"%@ Used", ss.usedDiskSpaceinRaw];
    self.annotatedGauge.endRangeLabel.text = [NSString stringWithFormat:@"%@ Free", ss.freeDiskSpaceinRaw];
    self.annotatedGauge.value = [ss.usedDiskSpaceinPercent floatValue];
}

- (void)reloadDiskInformation {
    SystemServices *ss = SystemSharedServices;
    self.lblTotalDiskSpace.text = [NSString stringWithFormat:@"Total Disk Space: %@", ss.diskSpace];
    self.lblUsedDiskSpace.text  = [NSString stringWithFormat:@"Used: %@ (%@)", ss.usedDiskSpaceinRaw, ss.usedDiskSpaceinPercent];
    self.lblFreeDiskSpace.text  = [NSString stringWithFormat:@"Free: %@ (%@)", ss.freeDiskSpaceinRaw, ss.freeDiskSpaceinPercent];
    [self layoutGaugeIfNeeded];
}

- (IBAction)refresh:(id)sender {
    [self reloadDiskInformation];
}

@end
