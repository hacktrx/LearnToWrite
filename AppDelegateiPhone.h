//
//  AppDelegate-iPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 9/19/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationDelegate.h"

@class BrushTableViewControlleriPhone;
@class SettingsViewController;
@class ChalkboardViewControlleriPhone;


@interface AppDelegateiPhone : ApplicationDelegate {

    IBOutlet UINavigationController *navigationController;
    IBOutlet BrushTableViewControlleriPhone *brushTableViewControlleriPhone;
    IBOutlet SettingsViewController *settingsViewController;
	IBOutlet ChalkboardViewControlleriPhone *chalkboardViewControlleriPhone;

}

-(IBAction)myPopToRootViewControllerMethod:(id)sender;
-(IBAction)pushBrushTableViewController:(id)sender;
-(IBAction)pushSettingsViewController:(id)sender;


@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet BrushTableViewControlleriPhone *brushTableViewControlleriPhone;
@property (nonatomic, retain) IBOutlet SettingsViewController *settingsViewController;
@property (nonatomic, retain) IBOutlet ChalkboardViewControlleriPhone *chalkboardViewControlleriPhone;


@end
