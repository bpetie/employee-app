//
//  shift.m
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "shift.h"

@implementation shift

@synthesize date, hours, notes;


- (id)initWithDate:(NSDate *)inDate
             hours:(double)inHours
             notes:(NSString *)inNotes
{ 
    self = [super init];
    if (self) {
        self.date = inDate;
        self.hours = inHours;
        self.notes = inNotes;
    }
    
    return self;
}


@end
