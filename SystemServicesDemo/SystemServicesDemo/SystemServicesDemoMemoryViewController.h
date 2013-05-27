//
//  SystemServicesDemoMemoryViewController.h
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemServicesDemoMemoryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblMemoryRAM;
@property (strong, nonatomic) IBOutlet UILabel *lblUsedMemory;
@property (strong, nonatomic) IBOutlet UILabel *lblWiredMemory;
@property (strong, nonatomic) IBOutlet UILabel *lblActiveMemory;
@property (strong, nonatomic) IBOutlet UILabel *lblInactiveMemory;
@property (strong, nonatomic) IBOutlet UILabel *lblFreeMemory;
@property (strong, nonatomic) IBOutlet UILabel *lblPurgeableMemory;

- (IBAction)refresh:(id)sender;

@end
