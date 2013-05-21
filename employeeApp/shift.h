//
//  shift.h
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shift : NSObject {
    NSDate *date;
    double hours;
    NSString *notes;
}

- (id)initWithDate:(NSDate *)inDate
             hours:(double)inHours
             notes:(NSString *)inNotes;


@property (strong, nonatomic) NSDate *date;
@property (nonatomic) double hours;
@property (strong, nonatomic) NSString *notes;


@end
