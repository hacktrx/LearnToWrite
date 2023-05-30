//
//  AnimationSpeedViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/12/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChalkboardViewController;

@interface AnimationSpeedViewController : UIViewController {
	
	IBOutlet UISlider *myAnimationSpeedSlider;
    UISwitch *globalSoundSwitch;
    UISwitch *strokeSoundSwitch;
    IBOutlet ChalkboardViewController *chalkboardViewController;
    
}

@property (nonatomic, retain) IBOutlet UISlider *myAnimationSpeedSlider;
@property (nonatomic, retain) UISwitch *globalSoundSwitch;
@property (nonatomic, retain) UISwitch *strokeSoundSwitch;
@property (nonatomic, retain) IBOutlet ChalkboardViewController *chalkboardViewController;

- (IBAction)globalSoundSettingChanged:(id)sender;
- (IBAction)strokeSoundSettingChanged:(id)sender;
-(IBAction)playSoundForButton:(id)sender;


@end
