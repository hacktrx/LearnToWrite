//
//  ButtonSelectionCelliPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "ButtonSelectionCelliPad.h"

@implementation ButtonSelectionCelliPad

@synthesize delegate;
@synthesize mySegmentedControl;
@synthesize selectedSwitchSegment;


-(IBAction)segmentControlValueChanged {
    
    NSLog(@"segmentControlValueChanged fired in ButtonSelectionCelliPad");

    [[self delegate] segmentedSwitchPressediPad:mySegmentedControl.selectedSegmentIndex];
}

-(void)awakeFromNib {
    
    [super awakeFromNib];
    NSLog(@"awakeFromNib just fired in ButtonSelectionCelliPad");
}

//jh - I don't know when this gets called.
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"initWithStyle just fired in ButtonSelectionCell");
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
