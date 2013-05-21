//
//  AddHoursView.m
//  employeeApp
//
//  Created by Brian Peterman on 5/20/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "AddHoursView.h"

@implementation AddHoursView

@synthesize workerLabel, workerTextField, dateLabel, dateTextField, hoursLabel, hoursTextField, notesLabel, notesTextField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor orangeColor]];
        
        self.workerLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 15, 100, 30)];
        [self.workerLabel setText:@"Worker"];
        [self.workerLabel setBackgroundColor:[UIColor clearColor]];
        [self.workerLabel setTextColor:[UIColor blackColor]];
        [self.workerLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.workerTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
        [self.workerTextField setBackgroundColor:[UIColor whiteColor]];
        [self.workerTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.workerTextField setUserInteractionEnabled:NO];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 90, 100, 30)];
        [self.dateLabel setText:@"Date"];
        [self.dateLabel setBackgroundColor:[UIColor clearColor]];
        [self.dateLabel setTextColor:[UIColor blackColor]];
        [self.dateLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        
        self.dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 125, 200, 30)];
        [self.dateTextField setBackgroundColor:[UIColor whiteColor]];
        [self.dateTextField setBorderStyle:UITextBorderStyleRoundedRect];
        

        //self.datePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 170 , 280, 190)];
        
        self.hoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 165, 100, 30)];
        [self.hoursLabel setText:@"Hours"];
        [self.hoursLabel setBackgroundColor:[UIColor clearColor]];
        [self.hoursLabel setTextColor:[UIColor blackColor]];
        [self.hoursLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.hoursTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 30)];
        [self.hoursTextField setBackgroundColor:[UIColor whiteColor]];
        [self.hoursTextField setBorderStyle:UITextBorderStyleRoundedRect];
        
        self.notesLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 240, 100, 30)];
        [self.notesLabel setText:@"Notes"];
        [self.notesLabel setBackgroundColor:[UIColor clearColor]];
        [self.notesLabel setTextColor:[UIColor blackColor]];
        [self.notesLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.notesTextField = [[UITextView alloc] initWithFrame:CGRectMake(50, 275, 200, 100)];
        [self.notesTextField setBackgroundColor:[UIColor whiteColor]];
        self.notesTextField.layer.cornerRadius = 5;
        self.notesTextField.clipsToBounds = YES;
        [self.notesTextField setFont:[UIFont systemFontOfSize:16]];

        
        [self addSubview:self.workerLabel];
        [self addSubview:self.workerTextField];
        [self addSubview:self.dateLabel];
        [self addSubview:self.dateTextField];
        [self addSubview:self.hoursLabel];
        [self addSubview:self.hoursTextField];
        [self addSubview:self.notesLabel];
        [self addSubview:self.notesTextField];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
