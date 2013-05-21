//
//  HoursViewController.m
//  employeeApp
//
//  Created by Brian Peterman on 5/17/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "HoursViewController.h"
#import "ShiftViewController.h"
#import "AddHoursViewController.h"


@interface HoursViewController ()

@end

@implementation HoursViewController

@synthesize ourEmployee;

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
    
    self.title = @"Hours";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style: UIBarButtonSystemItemAdd target:self action: @selector(changeToAddHoursScreen)];
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style: UIBarButtonSystemItemAdd target:self action: @selector(changeToAddWorkerScreen)];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addItemViewController:(AddHoursViewController *)controller didFinishEnteringItem:(shift *)item
{
    [self.ourEmployee.hoursArray addObject:item];
    
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
    return [self.ourEmployee.hoursArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SecondCell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    shift *currentShift = [self.ourEmployee.hoursArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%.02f" ,currentShift.hours];
    
    return cell;
}

#pragma method for the plus button
- (void)changeToAddHoursScreen
{
    AddHoursViewController *hoursViewController = [[AddHoursViewController alloc] init];
    hoursViewController.name = ourEmployee.name;
    hoursViewController.delegate = self;
    [[self navigationController] pushViewController:hoursViewController animated:YES];
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

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    shift *cellToGoTo = [self.ourEmployee.hoursArray objectAtIndex:indexPath.row];
    ShiftViewController *detailViewController = [[ShiftViewController alloc] init];
    detailViewController.ourShift = cellToGoTo;
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
    
}

@end
