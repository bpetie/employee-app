//
//  ShiftViewController.h
//  employeeApp
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shift.h"
#import "ShiftView.h"

@interface ShiftViewController : UIViewController

@property (strong, nonatomic) shift *ourShift;
@property (strong, nonatomic) ShiftView *view;
@end
