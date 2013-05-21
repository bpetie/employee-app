//
//  AppDelegate.h
//  employeeApp
//
//  Created by Brian Peterman on 5/15/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WorkersViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WorkersViewController *workersViewController;

@property (strong, nonatomic,) UINavigationController *masterNavigationController;

@end
