//
//  ShiftViewController.m
//  employeeApp
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "ShiftViewController.h"

@interface ShiftViewController ()

@end

@implementation ShiftViewController

@synthesize ourShift;

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
    
    self.view = [[ShiftView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE, MM/dd"];
    [self.view.dateLabel setText:[dateFormatter stringFromDate:self.ourShift.date]];
    
    
    NSString *hoursText = [[NSString stringWithFormat:@"%.02f",self.ourShift.hours] stringByAppendingString:@" hours"];    
    [self.view.hoursLabel setText:hoursText];
    
    [self.view.acutalNotes setText:self.ourShift.notes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
