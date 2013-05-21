//
//  employee.m
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "employee.h"

@implementation employee
@synthesize name, gradYear, hoursArray;


- (id)initWithName:(NSString *)inName andGradYear:(NSString *)inGradYear {
    self = [super init];
    if (self) {
        self.name = inName;
        self.gradYear = inGradYear;
        self.hoursArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//HoursArray
- (void) addObject:(shift *)inShift{
    [hoursArray addObject:inShift];
}

//getHours
- (double) getHours {
    double returnHours = 0;
    
    for (int i = 0; i < [hoursArray count]; i++) {
        shift *currentShift;
        currentShift = [hoursArray objectAtIndex:i];
        returnHours += currentShift.hours;
    }
    
    return returnHours;    
}


@end
