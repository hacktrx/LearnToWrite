//
//  VolumeSliderCelliPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "VolumeSliderCelliPad.h"

@implementation VolumeSliderCelliPad

@synthesize delegate;
@synthesize myVolumeSlider;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction)volumeSliderValueChanged:(id)sender {
    
    NSLog(@"volumeSliderValueChanged fired in VolumeSliderCelliPad");
    
    [[self delegate] globalSliderValueChanged:self.myVolumeSlider.value];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
