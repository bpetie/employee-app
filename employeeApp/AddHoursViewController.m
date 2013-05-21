//
//  AddHoursViewController.m
//  employeeApp
//
//  Created by Brian Peterman on 5/20/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "AddHoursViewController.h"

@interface AddHoursViewController ()

@end

@implementation AddHoursViewController

@synthesize datePicker, name;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = [[AddHoursView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.pagingEnabled = YES;

    
    [self.view.hoursTextField setReturnKeyType:UIReturnKeyDone];
    self.view.hoursTextField.delegate = self;
    self.view.dateTextField.delegate = self;
    self.view.notesTextField.delegate = self;
    
    
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.view.dateTextField.inputView = datePicker;
    
    UIToolbar* keyboardDoneDateButtonView = [[UIToolbar alloc] init];
    keyboardDoneDateButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneDateButtonView.translucent = YES;
    keyboardDoneDateButtonView.tintColor = nil;
    [keyboardDoneDateButtonView sizeToFit];
    
    UIBarButtonItem* doneButtonDate = [[UIBarButtonItem alloc]
                            initWithTitle:@"Done"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(doneDateClicked:)];
    
    [keyboardDoneDateButtonView setItems:[NSArray arrayWithObjects:doneButtonDate, nil]];
    self.view.dateTextField.inputAccessoryView = keyboardDoneDateButtonView;


    
    UIToolbar* keyboardDoneNotesButtonView = [[UIToolbar alloc] init];
    keyboardDoneNotesButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneNotesButtonView.translucent = YES;
    keyboardDoneNotesButtonView.tintColor = nil;
    [keyboardDoneNotesButtonView sizeToFit];
    
    UIBarButtonItem* doneButtonNotes = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(doneNotesClicked:)];
    
    [keyboardDoneNotesButtonView setItems:[NSArray arrayWithObjects:doneButtonNotes, nil]];
    self.view.notesTextField.inputAccessoryView = keyboardDoneNotesButtonView;

    
    [self.view.workerTextField setText:name];
    
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIButtonTypeRoundedRect target:self action:@selector(saveToHoursScreen)];

}

#pragma mark stuff for scrolling the frame
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%f,%f", textField.frame.origin.x, textField.frame.origin.y);
    self.view.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 216);
    [self.view scrollRectToVisible:CGRectMake(0, textField.frame.origin.y - 40, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    self.view.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 216);
    [self.view scrollRectToVisible:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
}

- (void) textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"%f,%f", textView.frame.origin.x, textView.frame.origin.y);
    self.view.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 216);
    [self.view scrollRectToVisible:CGRectMake(0, textView.frame.origin.y - 40, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
}

- (void) textViewDidEndEditing:(UITextView *)textView
{
    self.view.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 216);
    [self.view scrollRectToVisible:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
}


#pragma mark idk leftover
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark begin date stuff 

- (void)setDateClicked:(id)sender {
    [self.view.dateTextField becomeFirstResponder];
}

- (void)doneDateClicked:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d, yyyy"];
    
    self.view.dateTextField.text = [dateFormatter stringFromDate:[datePicker date]];
    [self.view.dateTextField resignFirstResponder];
}

- (void) doneNotesClicked:(id)sender
{
    [self.view.notesTextField resignFirstResponder];

}

- (void) datePickerValueChanged:(id)sender 
{
}

#pragma mark keyboard down on done
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark save to hours
- (void) saveToHoursScreen {
    if ([self.view.dateTextField.text length] > 0 && [self.view.hoursTextField.text length] > 0) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterLongStyle];
        NSDate *dateString = [df dateFromString:self.view.dateTextField.text];
        double hoursDouble = [self.view.hoursTextField.text doubleValue];
        NSString *notesString = self.view.notesTextField.text;
        shift *passBackShift = [[shift alloc] initWithDate:dateString hours:hoursDouble notes:notesString];
        
        [self.delegate addItemViewController:self didFinishEnteringItem:passBackShift];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Attention"
                              message: @"You must enter hours and date before confirming"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
