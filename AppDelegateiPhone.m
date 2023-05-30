//
//  AppDelegate-iPhone.m
//  LearnToWrite
//
//  Created by Justin Hackett on 9/19/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import "AppDelegateiPhone.h"
#import "BrushTableViewControlleriPhone.h"
#import "SettingsViewController.h"
#import "ChalkboardViewControlleriPhone.h"

@implementation AppDelegateiPhone

@synthesize navigationController;
@synthesize brushTableViewControlleriPhone;
@synthesize settingsViewController;
@synthesize chalkboardViewControlleriPhone;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        
    // Override point for customization after application launch
    	
	//implement this to hide status bar
	//[application setStatusBarHidden:YES animated:NO];
    
    //Get a notification of when a brush has been selected so I can pop to the root view controller.
    //Doing this instead of using the normal navigation arrow on the nav bar because if I display the
    //nav bar when I push the brushTableViewController I don't have a way to make the nav bar hidden
    //once I go back to the root chalkboard view.
    
    //Added for v4.0
    //Passing the managedObjectContext to the topViewController of the navigationController stack
    //which happens to be the chalkboardViewControlleriPhone.
    NSLog(@"The navigationController's topViewController is %@", navigationController.topViewController);
    self.chalkboardViewControlleriPhone.managedObjectContext = [self managedObjectContext];
    
#pragma mark Get Rid Of Notifications
    //Get rid of the notifications by using protocols or delegation.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myPopToRootViewControllerMethod:)
										   		 name:@"brushHasBeenSelected" object:nil];
    
    [self.chalkboardViewControlleriPhone emptyDatabaseOfStrokes];
    
	[window addSubview:navigationController.view];
    [window makeKeyAndVisible];

    return YES;
    
    //HELP WITH PASSING THE MANAGEDOBJECTCONTEXT::::
    /*
     UITabBarController *rootNavigationController = (UITabBarController *)self.window.rootViewController;
     NSLog(@"The rootViewController is %@", self.window.rootViewController);
     PatternTableViewController *myViewController = (PatternTableViewController *)[rootNavigationController selectedViewController];
     // Configure myViewController.
     self.patternTableViewController = myViewController;
     
     patternTableViewController.managedObjectContext = managedObjectContext_;
     */
    /*
     UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
     PatternTableViewController *aViewController = [[tabBarController viewControllers] objectAtIndex:0];
     self.patternTableViewController = aViewController;
     
     patternTableViewController.managedObjectContext = managedObjectContext_;
     */
    
	
	//[window addSubview:reiningPatternsNavigationController.view];
    //[window makeKeyAndVisible];
    
    //UITabBarController *navigationController = (UITabBarController *)self.window.rootViewController;
    //PatternTableViewController *controller = (PatternTableViewController *)navigationController.topViewController;
    //self.patternTableViewController = controller;
    //controller.managedObjectContext = managedObjectContext_;
    
    //UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    //PatternTableViewController *controller = (PatternTableViewController *)navigationController.topViewController;
    //self.patternTableViewController.managedObjectContext = self.managedObjectContext;
    /*
     UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
     UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
     PlayersViewController *playersViewController = [[navigationController viewControllers] objectAtIndex:0];
     playersViewController.players = players;
     */


}


/*
- (void)applicationDidEnterBackground:(UIApplication *)application {
	NSLog(@"applicationDidEnterBackground called in AppDelegateiPhone");
    [super applicationDidEnterBackground:application];
}
*/


-(IBAction)pushBrushTableViewController:(id)sender {
    
    [self.chalkboardViewControlleriPhone cancelPlayDataStrokes];
    
    [self.chalkboardViewControlleriPhone playTheClickSound];
    
    BrushTableViewControlleriPhone *viewController = [[BrushTableViewControlleriPhone alloc] initWithNibName:@"BrushTableViewControlleriPhone" bundle:nil];
    
    self.brushTableViewControlleriPhone = viewController;
    
    [self.navigationController pushViewController:brushTableViewControlleriPhone animated:YES];
	//Stop animations when pushing this new view controller;
	[chalkboardViewControlleriPhone stopAnimationsiPhone];
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(IBAction)myPopToRootViewControllerMethod:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"myPopToRootViewControllerMethod just fired in AppDelegateiPhone");
}


-(IBAction)pushSettingsViewController:(id)sender {
    
    if (self.settingsViewController == nil) {
    
    SettingsViewController *viewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    self.settingsViewController = viewController;

    //Give the settingsViewController a reference to the instance of the ChalkboardViewControlleriPhone.
    self.settingsViewController.chalkboardViewControlleriPhone = self.chalkboardViewControlleriPhone;
    
    [self.navigationController pushViewController:settingsViewController animated:YES];
        
	//Stop animations when pushing this new view controller;
	[chalkboardViewControlleriPhone stopAnimationsiPhone];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];

        NSInteger upperLowerLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForUpperLowerCategory];
        NSInteger upperLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForUpperCategory];
        NSInteger lowerLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForLowerCategory];
        NSInteger numbersCount = [self.chalkboardViewControlleriPhone getRecordingsForNumberCategory];

        [self.settingsViewController updateUpperLowerString:[NSString stringWithFormat:@"%d", upperLowerLettersCount]];
        [self.settingsViewController updateUpperString:[NSString stringWithFormat:@"%d", upperLettersCount]];
        [self.settingsViewController updateLowerString:[NSString stringWithFormat:@"%d", lowerLettersCount]];
        [self.settingsViewController updateNumberString:[NSString stringWithFormat:@"%d", numbersCount]];
         NSLog(@"the upperLowerLettersCount is %d", upperLowerLettersCount);
        
        
    }
    
    else {
        
        NSLog(@"The settingsViewController was not nil");
        [self.navigationController pushViewController:settingsViewController animated:YES];
        //Stop animations when pushing this new view controller;
        [chalkboardViewControlleriPhone stopAnimationsiPhone];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        NSInteger upperLowerLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForUpperLowerCategory];
        NSInteger upperLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForUpperCategory];
        NSInteger lowerLettersCount = [self.chalkboardViewControlleriPhone getRecordingsForLowerCategory];
        NSInteger numbersCount = [self.chalkboardViewControlleriPhone getRecordingsForNumberCategory];
        
        [self.settingsViewController updateUpperLowerString:[NSString stringWithFormat:@"%d", upperLowerLettersCount]];
        [self.settingsViewController updateUpperString:[NSString stringWithFormat:@"%d", upperLettersCount]];
        [self.settingsViewController updateLowerString:[NSString stringWithFormat:@"%d", lowerLettersCount]];
        [self.settingsViewController updateNumberString:[NSString stringWithFormat:@"%d", numbersCount]];
            
    }
}



/**
 Save changes in the application's managed object context before the application terminates.
 */

/*
- (void)applicationWillTerminate:(UIApplication *)application {
	
}
*/


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end

