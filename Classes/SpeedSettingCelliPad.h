//
//  SpeedSettingCelliPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChalkboardViewController;

@interface SpeedSettingCelliPad : UITableViewCell {
    
    IBOutlet UISlider *myAnimationSpeedSlider;
    ChalkboardViewController *chalkboardViewController;
    
}


@property (nonatomic, retain) IBOutlet UISlider *myAnimationSpeedSlider;
@property (nonatomic, retain) ChalkboardViewController *chalkboardViewController;

- (IBAction)sliderChanged:(id)sender;


@end
