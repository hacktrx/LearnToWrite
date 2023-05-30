//
//  SpeedSettingCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/30/11.
//  Copyright 2011 JH Productions. All rights reserved.
//

#import "SpeedSettingCell.h"
#import "ChalkboardViewControlleriPhone.h"

@implementation SpeedSettingCell

@synthesize myAnimationSpeedSlider;
@synthesize chalkboardViewController;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (IBAction)sliderChanged:(id)sender {
    
    self.myAnimationSpeedSlider = (UISlider *) sender;
        
    NSLog(@"sliderChanged fired in speedSettingCell with value of %f", self.myAnimationSpeedSlider.value);

    CGFloat myFloat = self.myAnimationSpeedSlider.value;
    NSLog(@"The value of myFloat in SpeedSettingCell for the animation speed is %f", myFloat);

    [chalkboardViewController changeAnimationSpeediPhone:sender];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
