//
//  SystemServicesDemoProcessesViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoProcessesViewController.h"
#import "SystemServices.h"

#import "DetailViewController.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoProcessesViewController () {
    // Make an array from all the system processes
    NSMutableArray *tableArray;
}

@end

@implementation SystemServicesDemoProcessesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.tableView setContentInset:UIEdgeInsetsMake(26,0,19,0)];
    
    // Set up the tableArray;
    tableArray = [[NSMutableArray alloc] initWithArray:[SystemSharedServices processesInformation]];
    
    // Error check the array
    if (tableArray.count < 1) {
        // Invalid array
        tableArray = nil;
        tableArray = [[NSMutableArray alloc] initWithObjects:@"Unknown", nil];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = [[tableArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
    cell.detailTextLabel.text = [[tableArray objectAtIndex:indexPath.row] objectForKey:@"PID"];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    // Create a dictionary from the selected cell
    NSDictionary *processData = [tableArray objectAtIndex:indexPath.row];
    
    NSString *parentProcessName;
    
    // Determine the parent process - if it's more than 0
    if ([[processData objectForKey:@"ParentID"] integerValue] > 0) {
        for (NSDictionary *dicts in tableArray) {
            if ([[dicts objectForKey:@"PID"] integerValue] == [[processData objectForKey:@"ParentID"] integerValue]) {
                // Parent process
                parentProcessName = [dicts objectForKey:@"Name"];
                break;
            }
        }
    } else if ([[processData objectForKey:@"ParentID"] integerValue] == -1) {
        parentProcessName = @"Kernel";
    } else {
        parentProcessName = @"Unknown";
    }
    
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
    // Set up the information on the detail view controller
    [detailViewController setTitle:[[tableArray objectAtIndex:indexPath.row] objectForKey:@"Name"]];
    // Set the labels
    [detailViewController setSlblName:[NSString stringWithFormat:@"Name: %@", [processData objectForKey:@"Name"]]];
    [detailViewController setSlblPID:[NSString stringWithFormat:@"PID: %@", [processData objectForKey:@"PID"]]];
    [detailViewController setSlblParentID:[NSString stringWithFormat:@"ParentID: %@", [processData objectForKey:@"ParentID"]]];
    [detailViewController setSlblParentName:[NSString stringWithFormat:@"Parent Name: %@", parentProcessName]];
    [detailViewController setSlblPriority:[NSString stringWithFormat:@"Priority: %@", [processData objectForKey:@"Priority"]]];
    [detailViewController setSlblStartDate:[NSString stringWithFormat:@"Start Date: %@", [processData objectForKey:@"StartDate"]]];
    [detailViewController setSlblStatus:[NSString stringWithFormat:@"Status: %@", [processData objectForKey:@"Status"]]];
    [detailViewController setSlblFlags:[NSString stringWithFormat:@"Flags: %@", [processData objectForKey:@"Flags"]]];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (IBAction)refresh:(id)sender {
    // Set up the tableArray;
    tableArray = [[NSMutableArray alloc] initWithArray:[SystemSharedServices processesInformation]];
    
    // Error check the array
    if (tableArray.count < 1) {
        // Invalid array
        tableArray = nil;
        tableArray = [[NSMutableArray alloc] initWithObjects:@"Unknown", nil];
    }
    
    // Reload the tableview
    [self.tableView reloadData];
}
@end
