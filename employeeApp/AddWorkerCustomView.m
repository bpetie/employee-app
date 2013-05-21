//
//  AddWorkerCustomView.m
//  employeeApp
//
//  Created by Brian Peterman on 5/16/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "AddWorkerCustomView.h"

@implementation AddWorkerCustomView

@synthesize nameLabel, gradYearLabel, nameTextField, gradYearPicker, gradYearPickerRange;


- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor grayColor]];

        
        self.nameLabel =[[UILabel alloc] initWithFrame:CGRectMake((frame.size.width/2)-30, 20, 60, 30)];
        [self.nameLabel  setText:@"Name"];
        [self.nameLabel setBackgroundColor:[UIColor clearColor]];
        [self.nameLabel setTextColor:[UIColor redColor]];
        [self.nameLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        
        self.nameTextField= [[UITextField alloc] initWithFrame:CGRectMake((frame.size.width/2)-100, 65, 200, 40)];
        [self.nameTextField setBackgroundColor:[UIColor whiteColor]];
        [self.nameTextField setBorderStyle:UITextBorderStyleLine];
                
        self.gradYearLabel= [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width/2)-50, 120, 100, 30)];
        [self.gradYearLabel setText:@"Grad Year"];
        [self.gradYearLabel setBackgroundColor:[UIColor clearColor]];
        [self.gradYearLabel setTextColor:[UIColor redColor]];
        [self.gradYearLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.gradYearPicker=[[UIPickerView alloc] initWithFrame:CGRectMake(30, 170 , 280, 190)];

        [self addSubview:self.nameLabel];
        [self addSubview:self.nameTextField];
        [self addSubview:self.gradYearLabel];
        [self addSubview:self.gradYearPicker];
        
        
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
