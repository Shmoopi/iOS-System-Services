//
//  SystemServicesDemoMemoryViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoMemoryViewController.h"
#import "SystemServices.h"
#import "PCPieChart.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoMemoryViewController ()
@property (nonatomic, strong) PCPieChart *pieChart;
@property (nonatomic, strong) UILabel *noteLabel;
@end

@implementation SystemServicesDemoMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Keep the demo predictably light so the chart labels stay legible.
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    [self buildInterface];
    [self reloadMemoryInformation];
}

// Build the whole screen in code with Auto Layout so it adapts to every
// device size instead of relying on hard-coded frames.
- (void)buildInterface {
    self.lblMemoryRAM       = [self makeLabelWithColor:[UIColor labelColor]];
    self.lblUsedMemory      = [self makeLabelWithColor:PCColorYellow];
    self.lblWiredMemory     = [self makeLabelWithColor:PCColorGreen];
    self.lblActiveMemory    = [self makeLabelWithColor:PCColorOrange];
    self.lblInactiveMemory  = [self makeLabelWithColor:PCColorRed];
    self.lblFreeMemory      = [self makeLabelWithColor:PCColorBlue];
    self.lblPurgeableMemory = [self makeLabelWithColor:PCColorDefault];

    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[
        self.lblMemoryRAM, self.lblUsedMemory, self.lblWiredMemory,
        self.lblActiveMemory, self.lblInactiveMemory, self.lblFreeMemory,
        self.lblPurgeableMemory
    ]];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.spacing = 4;
    stack.alignment = UIStackViewAlignmentFill;
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stack];

    PCPieChart *pieChart = [[PCPieChart alloc] initWithFrame:CGRectZero];
    pieChart.backgroundColor = [UIColor clearColor];
    pieChart.contentMode = UIViewContentModeRedraw;
    pieChart.sameColorLabel = YES;
    pieChart.translatesAutoresizingMaskIntoConstraints = NO;
    self.pieChart = pieChart;
    [self.view addSubview:pieChart];

    UILabel *note = [[UILabel alloc] init];
    note.numberOfLines = 0;
    note.textAlignment = NSTextAlignmentCenter;
    note.font = [UIFont systemFontOfSize:11];
    note.textColor = [UIColor secondaryLabelColor];
    note.text = @"Totals will not always match the hardware — most values are rough estimates. Memory is not exact.";
    note.translatesAutoresizingMaskIntoConstraints = NO;
    self.noteLabel = note;
    [self.view addSubview:note];

    UILayoutGuide *safe = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [stack.topAnchor constraintEqualToAnchor:safe.topAnchor constant:12],
        [stack.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor constant:16],
        [stack.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor constant:-16],

        [note.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor constant:16],
        [note.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor constant:-16],
        [note.bottomAnchor constraintEqualToAnchor:safe.bottomAnchor constant:-8],

        [pieChart.topAnchor constraintEqualToAnchor:stack.bottomAnchor constant:8],
        [pieChart.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [pieChart.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [pieChart.bottomAnchor constraintEqualToAnchor:note.topAnchor constant:-8],
    ]];
}

- (UILabel *)makeLabelWithColor:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = color;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    return label;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Size the circle for the current bounds, leaving room on both sides of it
    // for the slice labels (the chart draws percentages/titles beside the pie).
    CGSize size = self.pieChart.bounds.size;
    if (size.width > 0 && size.height > 0) {
        self.pieChart.diameter = (int)floor(MIN(size.width * 0.5, size.height - 40));
        [self.pieChart setNeedsDisplay];
    }
}

- (void)reloadMemoryInformation {
    SystemServices *ss = SystemSharedServices;

    self.lblMemoryRAM.text       = [NSString stringWithFormat:@"Memory (RAM): ~%.0f MB", ss.totalMemory];
    self.lblUsedMemory.text      = [NSString stringWithFormat:@"Used: %.0f MB (%.0f%%)", ss.usedMemoryinRaw, ss.usedMemoryinPercent];
    self.lblWiredMemory.text     = [NSString stringWithFormat:@"Wired: %.0f MB (%.0f%%)", ss.wiredMemoryinRaw, ss.wiredMemoryinPercent];
    self.lblActiveMemory.text    = [NSString stringWithFormat:@"Active: %.0f MB (%.0f%%)", ss.activeMemoryinRaw, ss.activeMemoryinPercent];
    self.lblInactiveMemory.text  = [NSString stringWithFormat:@"Inactive: %.0f MB (%.0f%%)", ss.inactiveMemoryinRaw, ss.inactiveMemoryinPercent];
    self.lblFreeMemory.text      = [NSString stringWithFormat:@"Free: %.0f MB (%.0f%%)", ss.freeMemoryinRaw, ss.freeMemoryinPercent];
    self.lblPurgeableMemory.text = [NSString stringWithFormat:@"Purgeable: %.0f MB (%.0f%%)", ss.purgableMemoryinRaw, ss.purgableMemoryinPercent];

    NSArray *specs = @[
        @[@"Used",      @(ss.usedMemoryinPercent),      PCColorYellow],
        @[@"Wired",     @(ss.wiredMemoryinPercent),     PCColorGreen],
        @[@"Active",    @(ss.activeMemoryinPercent),    PCColorOrange],
        @[@"Inactive",  @(ss.inactiveMemoryinPercent),  PCColorRed],
        @[@"Free",      @(ss.freeMemoryinPercent),      PCColorBlue],
        @[@"Purgeable", @(ss.purgableMemoryinPercent),  PCColorDefault],
    ];

    NSMutableArray *components = [NSMutableArray array];
    for (NSArray *spec in specs) {
        float value = [spec[1] floatValue];
        if (value <= 0) {
            // Skip empty / unavailable slices so the chart stays clean.
            continue;
        }
        PCPieComponent *component = [PCPieComponent pieComponentWithTitle:spec[0] value:value];
        component.colour = spec[2];
        [components addObject:component];
    }

    self.pieChart.components = components;
    [self.pieChart setNeedsDisplay];
}

- (IBAction)refresh:(id)sender {
    [self reloadMemoryInformation];
}

@end
