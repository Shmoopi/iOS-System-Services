//
//  SystemServicesDemoDiskViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoDiskViewController.h"
#import "SystemServices.h"
#import "PercentageChart.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoDiskViewController ()

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
    
    [self.chart setText:@"Used Disk Space"];
    [self.chart setPercentage:[[SystemSharedServices usedDiskSpaceinPercent] floatValue]];
    [self.chart setMainColor:[UIColor lightGrayColor]];
    [self.chart setLineColor:[UIColor redColor]];
    [self.chart setSecondaryColor:[UIColor darkGrayColor]];
    [self.chart setFontName:@"System"];
    [self.chart setFontSize:16.0];
    [self.chart setFontColor:[UIColor whiteColor]];
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
    [self setChart:nil];
    [super viewDidUnload];
}

@end
