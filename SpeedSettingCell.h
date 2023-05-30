//
//  SpeedSettingCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/30/11.
//  Copyright 2011 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChalkboardViewControlleriPhone;

@interface SpeedSettingCell : UITableViewCell {
    
    IBOutlet UISlider *myAnimationSpeedSlider;
    ChalkboardViewControlleriPhone *chalkboardViewController;
    
}


@property (nonatomic, retain) IBOutlet UISlider *myAnimationSpeedSlider;
@property (nonatomic, retain) ChalkboardViewControlleriPhone *chalkboardViewController;

- (IBAction)sliderChanged:(id)sender;


@end
