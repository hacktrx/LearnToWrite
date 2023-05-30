//
//  SettingsViewControlleriPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 1/28/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FancyView_iPhone;

@interface SettingsViewControlleriPhone : UIViewController <UIScrollViewDelegate> {
    
    IBOutlet FancyView_iPhone *fancyView;
}

@property (nonatomic, retain) IBOutlet FancyView_iPhone *fancyView;

@end
