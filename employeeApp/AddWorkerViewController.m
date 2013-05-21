//
//  AddWorkerViewController.m
//  employeeApp
//
//  Created by Brian Peterman on 5/16/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "AddWorkerViewController.h"
#import "WorkersViewController.h"
#import "employee.h"   



@interface AddWorkerViewController () 

@property (strong, nonatomic) NSMutableArray *gradYearPickerRange;

@end

@implementation AddWorkerViewController

@synthesize gradYearPickerRange, delegate;

- (id) init {
    self = [super init];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setTitle:@"Add Worker"];
    
    
    self.view = [[AddWorkerCustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.view.gradYearPicker.delegate = self;
    self.view.gradYearPicker.dataSource = self;
    self.view.gradYearPicker.showsSelectionIndicator = YES;
    self.view.gradYearPicker.opaque = NO;
    
    [self.view.nameTextField setReturnKeyType:UIReturnKeyDone];
    self.view.nameTextField.delegate = self;
    
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIButtonTypeRoundedRect target:self action:@selector(saveToWorkersScreen)];
    
    self.gradYearPickerRange=[[NSMutableArray alloc] init];
    for(int i=2011; i<2030; i++)
    {
        [self.gradYearPickerRange addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

#pragma mark keyboard down on done 
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark gradYearPicker datasource
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView
 numberOfRowsInComponent:(NSInteger)component {
    return [gradYearPickerRange count];
}
 
- (NSString *) pickerView:(UIPickerView *)pickerView
              titleForRow:(NSInteger)row
             forComponent:(NSInteger)component
{
    return [gradYearPickerRange objectAtIndex:row];
}


#pragma mark implementation for the confirm button
-(void) saveToWorkersScreen
{
    if ([self.view.nameTextField.text length] > 0) {
        NSInteger row=[self.view.gradYearPicker selectedRowInComponent:0];
        NSString *gradYearString=[self.gradYearPickerRange objectAtIndex: row];
        employee *passBackEmployee = [[employee alloc] initWithName:self.view.nameTextField.text andGradYear: gradYearString];
        [self.delegate addItemViewController:self didFinishEnteringItem:passBackEmployee];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    else {

        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Attention"
                              message: @"You must enter your name before confirming"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark random crap
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
