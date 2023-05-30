//
//  SoundEffectCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 6/4/11.
//  Copyright 2011 JH Productions. All rights reserved.
//

#import "SoundEffectCell.h"


@implementation SoundEffectCell

@synthesize delegate;
@synthesize globalSoundSwitch;
@synthesize cellTextLabel;
@synthesize strokeSoundSwitch;
@synthesize strokeCellTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        }
    return self;
}

- (IBAction)globalSoundSettingChanged:(id)sender {
    
    NSLog(@"globalSoundSettingChanged fired in SoundEffectCell");
    
    [[self delegate] globalSoundButtonSwitched:self.globalSoundSwitch.on];
}

- (IBAction)strokeSoundSettingChanged:(id)sender {
    
    NSLog(@"strokeSoundSettingChanged fired in SoundEffectCell");
    
    [[self delegate] strokeSoundButtonSwitched:self.strokeSoundSwitch.on];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

