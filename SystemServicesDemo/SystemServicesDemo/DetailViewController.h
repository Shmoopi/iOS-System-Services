//
//  DetailViewController.h
//  SystemServicesDemo
//
//  Created by Kramer on 10/1/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, retain) NSString *slblName, *slblPID, *slblParentID, *slblParentName, *slblPriority, *slblStartDate, *slblStatus, *slblFlags;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblPID;
@property (strong, nonatomic) IBOutlet UILabel *lblParentID;
@property (strong, nonatomic) IBOutlet UILabel *lblParentName;
@property (strong, nonatomic) IBOutlet UILabel *lblPriority;
@property (strong, nonatomic) IBOutlet UILabel *lblStartDate;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblFlags;

@end
