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

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

@interface SystemServicesDemoDiskViewController ()
// Annotated Gauge
@property (nonatomic) MSAnnotatedGauge *annotatedGauge;
@end

@implementation SystemServicesDemoDiskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Get all the disk info
    [self performSelector:@selector(getAllDiskInformation)];
}

- (void)getAllDiskInformation {
    // Total Disk Space
    self.lblTotalDiskSpace.text = [NSString stringWithFormat:@"Total Disk Space: %@",[SystemSharedServices diskSpace]];
    // Used Disk Space
    self.lblUsedDiskSpace.text = [NSString stringWithFormat:@"Used Disk Space: %@ %@", [SystemSharedServices usedDiskSpaceinRaw], [SystemSharedServices usedDiskSpaceinPercent]];
    // Free Disk Space
    self.lblFreeDiskSpace.text = [NSString stringWithFormat:@"Free Disk Space: %@ %@", [SystemSharedServices freeDiskSpaceinRaw], [SystemSharedServices freeDiskSpaceinPercent]];
    
    [self.annotatedGauge removeFromSuperview];
    self.annotatedGauge = nil;
    int yPosition = (isiPhone5) ? 350 : 300;
    self.annotatedGauge = [[MSAnnotatedGauge alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - yPosition, 320, 210)];
    self.annotatedGauge.minValue = 0;
    self.annotatedGauge.maxValue = 100;
    [self.annotatedGauge setBackgroundColor:[UIColor clearColor]];
    self.annotatedGauge.titleLabel.text = [NSString stringWithFormat:@"Total Space: %@", [SystemSharedServices diskSpace]];
    self.annotatedGauge.startRangeLabel.text = [NSString stringWithFormat:@"%@ Used",  [SystemSharedServices usedDiskSpaceinRaw]];
    self.annotatedGauge.endRangeLabel.text = [NSString stringWithFormat:@"%@ Free",  [SystemSharedServices freeDiskSpaceinRaw]];
    self.annotatedGauge.fillGradient = [MSGradientArcLayer defaultGradient];
    self.annotatedGauge.value = [[SystemSharedServices usedDiskSpaceinPercent] floatValue];
    [self.annotatedGauge setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin];
    [self.view addSubview:self.annotatedGauge];
}

- (IBAction)refresh:(id)sender {
    [self getAllDiskInformation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLblTotalDiskSpace:nil];
    [self setLblUsedDiskSpace:nil];
    [self setLblFreeDiskSpace:nil];
    [super viewDidUnload];
}

@end
