//
//  VolumeSliderCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/10/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import "VolumeSliderCell.h"

@implementation VolumeSliderCell

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
    
    NSLog(@"volumeSliderValueChanged fired in VolumeSliderCell");
    
    [[self delegate] globalSliderValueChanged:self.myVolumeSlider.value];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
