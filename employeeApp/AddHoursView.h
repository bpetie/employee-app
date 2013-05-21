//
//  AddHoursView.h
//  employeeApp
//
//  Created by Brian Peterman on 5/20/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface AddHoursView : UIScrollView

@property UILabel *workerLabel;
@property UITextField *workerTextField;
@property UILabel *dateLabel;
@property UITextField *dateTextField;
@property UILabel *hoursLabel;
@property UITextField *hoursTextField;
@property UILabel *notesLabel;
@property UITextView *notesTextField;

@end
