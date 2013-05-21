//
//  AddWorkerCustomView.h
//  employeeApp
//
//  Created by Brian Peterman on 5/16/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AddWorkerCustomView : UIView

@property UILabel *nameLabel;
@property UILabel *gradYearLabel;
@property UITextField *nameTextField;
@property UIPickerView *gradYearPicker;
@property NSMutableArray *gradYearPickerRange;

@end
