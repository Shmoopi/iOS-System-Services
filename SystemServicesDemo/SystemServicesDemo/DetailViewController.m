//
//  DetailViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 10/1/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize slblName, slblFlags, slblStatus, slblStartDate, slblPriority, slblParentName, slblParentID, slblPID, lblName, lblFlags, lblStatus, lblStartDate, lblPriority, lblParentName, lblParentID, lblPID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.lblName.text = slblName;
    self.lblFlags.text = slblFlags;
    self.lblStatus.text = slblStatus;
    self.lblStartDate.text = slblStartDate;
    self.lblPriority.text = slblPriority;
    self.lblParentName.text = slblParentName;
    self.lblParentID.text = slblParentID;
    self.lblPID.text = slblPID;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
