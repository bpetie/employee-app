//
//  WorkersViewController.m
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "WorkersViewController.h"
#import "employee.h"
#import "AddWorkerCustomView.h"
#import "AddWorkerViewController.h"
#import "HoursViewController.h"


@implementation WorkersViewController
@synthesize workersArray;


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

    [self setTitle:@"Workers"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style: UIBarButtonSystemItemAdd target:self action: @selector(changeToAddWorkerScreen)];
    
    employee *brian = [[employee alloc] initWithName: @"Brian" andGradYear: @"2014"];
    for (int i = 5; i < 10; i++) {
        shift *tempShift = [[shift alloc] init];
        tempShift.hours = i;
        [brian.hoursArray addObject:tempShift];
    }
    NSLog(@"%d", [brian.hoursArray count]);    
    
    //Keep this guy
    self.workersArray = [[NSMutableArray alloc] init];
    //Right above me
    
    [self.workersArray addObject:brian];
    
    NSLog(@"%d",[workersArray count]);
    
}


//  Override inherited implementation to automatically refresh the table
//  view's data.
//

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

#pragma method for the plus button
- (void)changeToAddWorkerScreen
{
    AddWorkerViewController *workerView = [[AddWorkerViewController alloc] init];
    workerView.delegate = self;
    [[self navigationController] pushViewController:workerView animated:YES];
}

#pragma mark deligate from AddWorkerViewController
- (void)addItemViewController:(AddWorkerViewController *)controller didFinishEnteringItem:(employee *)item
{
    [self.workersArray addObject:item];
    
}

#pragma mark table data setup
- (NSInteger)tableView:numberOfRowsInSection
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.workersArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    employee *selectedCell = [self.workersArray objectAtIndex:indexPath.row];
    
    NSString *additionOfHours = [selectedCell.name stringByAppendingString: [NSString stringWithFormat:@"  %.02f",[selectedCell getHours]]];
    cell.textLabel.text = additionOfHours;
    
    return cell;
}

#pragma mark when a row is selected


- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    employee *cellToGoTo = [self.workersArray objectAtIndex:indexPath.row];
    HoursViewController *detailViewController = [[HoursViewController alloc] init];
    detailViewController.ourEmployee = cellToGoTo;
    
    
    [[self navigationController] pushViewController:detailViewController animated:YES];

}


@end
