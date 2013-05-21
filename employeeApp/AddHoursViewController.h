//
//  AddHoursViewController.h
//  employeeApp
//
//  Created by Brian Peterman on 5/20/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddHoursView.h"
#import "shift.h"

@class AddHoursViewController;

@protocol AddHoursViewControllerDelegate <NSObject>


-(void) addItemViewController: (AddHoursViewController *)controller didFinishEnteringItem:(shift *)item;

@end

@interface AddHoursViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>


@property UIDatePicker *datePicker;
@property (strong, nonatomic) AddHoursView *view;
@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) id <AddHoursViewControllerDelegate> delegate;


@end
