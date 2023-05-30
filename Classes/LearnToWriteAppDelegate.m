//
//  LearnToWriteAppDelegate.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright Steamer Trunk Records 2010. All rights reserved.
//

#import "LearnToWriteAppDelegate.h"
#import "ChalkboardViewController.h"

@implementation LearnToWriteAppDelegate

@synthesize chalkboardViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    NSLog(@"didFinishLaunchingWithOptions fired in LearnToWriteAppDelegate");

    // Override point for customization after application launch
	
	//implement this to hide status bar
	//[application setStatusBarHidden:YES animated:NO];
    
//Added this for v4.0
    self.chalkboardViewController.managedObjectContext = [self managedObjectContext];
    
    [self.chalkboardViewController emptyDatabaseOfStrokes];
    
    [window addSubview:self.chalkboardViewController.view];
    [window makeKeyAndVisible];

	return YES;
}


/*
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 
- (void)applicationWillTerminate:(UIApplication *)application {
 
}
*/

#pragma mark -
#pragma mark Memory management



@end

