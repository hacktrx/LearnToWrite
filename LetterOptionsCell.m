//
//  LetterOptionsCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/26/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import "LetterOptionsCell.h"

@implementation LetterOptionsCell
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
    
    NSLog(@"globalSoundSettingChanged fired in SoundEffectCell");
    
    [[self delegate] paperLinesButtonSwitched:self.paperLinesSwitch.on];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

