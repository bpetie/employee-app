//
//  employee.h
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shift.h"


@interface employee : NSObject {
    NSString *name;
    NSString *gradYear;
    NSMutableArray *hoursArray;
}


- (id)initWithName:(NSString *)inName andGradYear:(NSString *) inGradYear;

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSString *gradYear;
@property (strong, nonatomic) NSMutableArray *hoursArray;

- (double) getHours;


@end
