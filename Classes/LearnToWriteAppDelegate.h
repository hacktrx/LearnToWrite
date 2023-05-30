//
//  LearnToWriteAppDelegate.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright Steamer Trunk Records 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationDelegate.h"

@class ChalkboardViewController;

@interface LearnToWriteAppDelegate : ApplicationDelegate {

    IBOutlet ChalkboardViewController *chalkboardViewController;

}

@property (nonatomic, retain) IBOutlet ChalkboardViewController *chalkboardViewController;

@end

