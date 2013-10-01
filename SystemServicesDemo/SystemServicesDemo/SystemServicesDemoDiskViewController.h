//
//  SystemServicesDemoDiskViewController.h
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemServicesDemoDiskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblTotalDiskSpace;
@property (strong, nonatomic) IBOutlet UILabel *lblUsedDiskSpace;
@property (strong, nonatomic) IBOutlet UILabel *lblFreeDiskSpace;

- (IBAction)refresh:(id)sender;

@end
