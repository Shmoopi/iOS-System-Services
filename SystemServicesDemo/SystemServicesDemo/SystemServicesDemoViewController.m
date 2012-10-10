//
//  SystemServicesDemoViewController.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoViewController.h"

@interface SystemServicesDemoViewController ()

@end

@implementation SystemServicesDemoViewController
@synthesize ProgressView = _ProgressView;
@synthesize TextView = _TextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(getAllSystemInformation) withObject:nil afterDelay:1.0];
}

// Get all the system information
- (void)getAllSystemInformation {
    // Get all Information
    NSDictionary *SystemInformationDict = [SystemServices allSystemInformation];
    
    // Convert to Array
    NSArray *SystemInformationArray = [SystemInformationDict allKeys];
    
    // Run through all the information about the system
    for (int y = 0; y <= SystemInformationArray.count - 1; y++) {
        // Output all names and values to nslog
        NSLog(@"Name: %@  ||  Value: %@", [SystemInformationArray objectAtIndex:y], [SystemInformationDict objectForKey:[SystemInformationArray objectAtIndex:y]]);
        // Output all the names and values to the textview
        self.TextView.text = [NSString stringWithFormat:@"%@\n\nName: %@\nValue: %@", self.TextView.text, [SystemInformationArray objectAtIndex:y], [SystemInformationDict objectForKey:[SystemInformationArray objectAtIndex:y]]];
        // Set the progress of the System Services
        self.ProgressView.progress += ((y * 100) / SystemInformationArray.count);
    }
}

- (void)viewDidUnload
{
    [self setProgressView:nil];
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
