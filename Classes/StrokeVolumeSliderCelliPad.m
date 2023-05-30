//
//  StrokeVolumeSliderCelliPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "StrokeVolumeSliderCelliPad.h"

@implementation StrokeVolumeSliderCelliPad

@synthesize delegate;
@synthesize myStrokeVolumeSlider;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction)strokeVolumeSliderValueChanged:(id)sender {
    
    NSLog(@"strokeVolumeSliderValueChanged fired in StrokeVolumeSliderCelliPad");
    
    [[self delegate] strokeSliderValueChanged:self.myStrokeVolumeSlider.value];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
