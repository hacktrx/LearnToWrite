//
//  SpeedSettingCelliPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "SpeedSettingCelliPad.h"
#import "ChalkboardViewController.h"

@implementation SpeedSettingCelliPad

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
    
    [chalkboardViewController changeAnimationSpeed:sender];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
