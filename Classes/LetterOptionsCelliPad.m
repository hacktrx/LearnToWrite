//
//  LetterOptionsCelliPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/30/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "LetterOptionsCelliPad.h"

@implementation LetterOptionsCelliPad
@synthesize delegate;
@synthesize paperLinesSwitch;
@synthesize paperLinesCellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)linesSettingChanged:(id)sender {
    
    NSLog(@"globalSoundSettingChanged fired in SoundEffectCelliPad");
    
    [[self delegate] paperLinesButtonSwitched:self.paperLinesSwitch.on];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

