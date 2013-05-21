//
//  ShiftView.m
//  employeeApp
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "ShiftView.h"

@implementation ShiftView

@synthesize dateLabel, hoursLabel, notesLabel, acutalNotes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor magentaColor]];
    
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 200, 30)];
        [self.dateLabel setText:@""];
        [self.dateLabel setBackgroundColor:[UIColor clearColor]];
        [self.dateLabel setTextColor:[UIColor blackColor]];
        [self.dateLabel setFont:[UIFont systemFontOfSize:20]];
        
        self.hoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 85, 200, 30)];
        [self.hoursLabel setText:@""];
        [self.hoursLabel setBackgroundColor:[UIColor clearColor]];
        [self.hoursLabel setTextColor:[UIColor blackColor]];
        [self.hoursLabel setFont:[UIFont systemFontOfSize:20]];
        
        self.notesLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 130, 100, 30)];
        [self.notesLabel setText:@"Notes"];
        [self.notesLabel setBackgroundColor:[UIColor clearColor]];
        [self.notesLabel setTextColor:[UIColor blackColor]];
        [self.notesLabel setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.acutalNotes = [[UILabel alloc] initWithFrame:CGRectMake(15, 155, 200, 200)];
        self.acutalNotes.lineBreakMode = YES;
        [self.acutalNotes setText:@""];
        [self.acutalNotes setBackgroundColor:[UIColor clearColor]];
        [self.acutalNotes setTextColor:[UIColor blackColor]];
        [self.acutalNotes setFont:[UIFont systemFontOfSize:20]];
        
        [self addSubview:self.dateLabel];
        [self addSubview:self.hoursLabel];
        [self addSubview:self.notesLabel];
        [self addSubview:self.acutalNotes];

        
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
