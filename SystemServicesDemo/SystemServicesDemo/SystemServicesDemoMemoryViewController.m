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

@interface SystemServicesDemoMemoryViewController () {
    PCPieChart *pieChart;
    NSMutableArray *components;
}

@end

@implementation SystemServicesDemoMemoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Get all the memory info
    [self performSelector:@selector(getAllMemoryInformation)];
    
    // Get all the data
    components = [[NSMutableArray alloc] init];
    
    // Make the piechart view
    int height = [self.view bounds].size.width/3*2.; // 220;
    int width = [self.view bounds].size.width; //320;
    pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height) - 28,width,height)];
    [pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [pieChart setDiameter:width/2];
    [pieChart setSameColorLabel:YES];
    
    // Add the piechart to the view
    [self.view addSubview:pieChart];
    
    // Set up for iPad and iPhone
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {
        pieChart.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
        pieChart.percentageFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:50];
    }
    
    // Make all the components
    PCPieComponent *component1 = [PCPieComponent pieComponentWithTitle:@"Used Memory" value:[SystemSharedServices usedMemoryinPercent]];
    [component1 setColour:PCColorYellow];
    [components addObject:component1];
    
    PCPieComponent *component2 = [PCPieComponent pieComponentWithTitle:@"Wired Memory" value:[SystemSharedServices wiredMemoryinPercent]];
    [component2 setColour:PCColorGreen];
    [components addObject:component2];
    
    PCPieComponent *component3 = [PCPieComponent pieComponentWithTitle:@"Active Memory" value:[SystemSharedServices activeMemoryinPercent]];
    [component3 setColour:PCColorOrange];
    [components addObject:component3];
    
    PCPieComponent *component4 = [PCPieComponent pieComponentWithTitle:@"Inactive Memory" value:[SystemSharedServices inactiveMemoryinPercent]];
    [component4 setColour:PCColorRed];
    [components addObject:component4];
    
    PCPieComponent *component5 = [PCPieComponent pieComponentWithTitle:@"Free Memory" value:[SystemSharedServices freeMemoryinPercent]];
    [component5 setColour:PCColorBlue];
    [components addObject:component5];
    
    PCPieComponent *component6 = [PCPieComponent pieComponentWithTitle:@"Purgeable Memory" value:[SystemSharedServices purgableMemoryinPercent]];
    [component6 setColour:PCColorDefault];
    [components addObject:component6];
    
    // Set all the componenets
    [pieChart setComponents:components];
}

// Get all the memory information and put it on the labels
- (void)getAllMemoryInformation {
    // Amount of Memory (RAM)
    self.lblMemoryRAM.text = [NSString stringWithFormat:@"Memory (RAM): (±)%.2f MB",[SystemSharedServices totalMemory]];
    
    // Used Memory
    self.lblUsedMemory.text = [NSString stringWithFormat:@"Used Memory: %.2fMB %.0f%%", [SystemSharedServices usedMemoryinRaw], [SystemSharedServices usedMemoryinPercent]];
    
    // Wired Memory
    self.lblWiredMemory.text = [NSString stringWithFormat:@"Wired Memory: %.2fMB %.0f%%", [SystemSharedServices wiredMemoryinRaw], [SystemSharedServices wiredMemoryinPercent]];
    
    // Active Memory
    self.lblActiveMemory.text = [NSString stringWithFormat:@"Active Memory: %.2fMB %.0f%%", [SystemSharedServices activeMemoryinRaw], [SystemSharedServices activeMemoryinPercent]];
    
    // Inactive Memory
    self.lblInactiveMemory.text = [NSString stringWithFormat:@"Inactive Memory: %.2fMB %.0f%%", [SystemSharedServices inactiveMemoryinRaw], [SystemSharedServices inactiveMemoryinPercent]];
    
    // Free Memory
    self.lblFreeMemory.text = [NSString stringWithFormat:@"Free Memory: %.2fMB %.0f%%", [SystemSharedServices freeMemoryinRaw], [SystemSharedServices freeMemoryinPercent]];
    
    // Purgeable Memory
    self.lblPurgeableMemory.text = [NSString stringWithFormat:@"Purgeable Memory: %.2fMB %.0f%%", [SystemSharedServices purgableMemoryinRaw], [SystemSharedServices purgableMemoryinPercent]];
}

- (IBAction)refresh:(id)sender {
    [self getAllMemoryInformation];
    
    // Remove all components
    [components removeAllObjects];
    // Remove the piecomponent
    [pieChart removeFromSuperview];
    
    // Make the piechart view
    int height = [self.view bounds].size.width/3*2.; // 220;
    int width = [self.view bounds].size.width; //320;
    pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height) - 23,width,height)];
    [pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [pieChart setDiameter:width/2];
    [pieChart setSameColorLabel:YES];
    
    // Add the piechart to the view
    [self.view addSubview:pieChart];
    
    // Set up for iPad and iPhone
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {
        pieChart.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
        pieChart.percentageFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:50];
    }
    
    // Make all the components
    PCPieComponent *component1 = [PCPieComponent pieComponentWithTitle:@"Used Memory" value:[SystemSharedServices usedMemoryinPercent]];
    [component1 setColour:PCColorYellow];
    [components addObject:component1];
    
    PCPieComponent *component2 = [PCPieComponent pieComponentWithTitle:@"Wired Memory" value:[SystemSharedServices wiredMemoryinPercent]];
    [component2 setColour:PCColorGreen];
    [components addObject:component2];
    
    PCPieComponent *component3 = [PCPieComponent pieComponentWithTitle:@"Active Memory" value:[SystemSharedServices activeMemoryinPercent]];
    [component3 setColour:PCColorOrange];
    [components addObject:component3];
    
    PCPieComponent *component4 = [PCPieComponent pieComponentWithTitle:@"Inactive Memory" value:[SystemSharedServices inactiveMemoryinPercent]];
    [component4 setColour:PCColorRed];
    [components addObject:component4];
    
    PCPieComponent *component5 = [PCPieComponent pieComponentWithTitle:@"Free Memory" value:[SystemSharedServices freeMemoryinPercent]];
    [component5 setColour:PCColorBlue];
    [components addObject:component5];
    
    PCPieComponent *component6 = [PCPieComponent pieComponentWithTitle:@"Purgeable Memory" value:[SystemSharedServices purgableMemoryinPercent]];
    [component6 setColour:PCColorDefault];
    [components addObject:component6];
    
    // Set all the componenets
    [pieChart setComponents:components];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLblMemoryRAM:nil];
    [self setLblUsedMemory:nil];
    [self setLblWiredMemory:nil];
    [self setLblActiveMemory:nil];
    [self setLblInactiveMemory:nil];
    [self setLblFreeMemory:nil];
    [self setLblPurgeableMemory:nil];
    [super viewDidUnload];
}

@end
