//
//  HoursViewController.h
//  employeeApp
//
//  Created by Brian Peterman on 5/17/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "employee.h"
#import "shift.h"
#import "AddHoursViewController.h"


@interface HoursViewController : UITableViewController <AddHoursViewControllerDelegate>

@property (strong, nonatomic) employee *ourEmployee;



@end
