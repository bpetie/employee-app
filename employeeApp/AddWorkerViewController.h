//
//  AddWorkerViewController.h
//  employeeApp
//
//  Created by Brian Peterman on 5/16/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddWorkerCustomView.h"
#import "employee.h"

@class AddWorkerViewController;

@protocol AddWorkerViewControllerDelegate <NSObject>

-(void) addItemViewController: (AddWorkerViewController *)controller didFinishEnteringItem:(employee *)item;

@end

@interface AddWorkerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) AddWorkerCustomView *view;
@property (weak, nonatomic) id <AddWorkerViewControllerDelegate> delegate;

@end
