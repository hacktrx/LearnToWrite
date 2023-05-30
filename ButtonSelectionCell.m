//
//  ButtonSelectionCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 1/29/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import "ButtonSelectionCell.h"

@implementation ButtonSelectionCell

@synthesize delegate;
@synthesize mySegmentedControl;
@synthesize selectedSwitchSegment;

-(IBAction)segmentControlValueChanged {
    
    [[self delegate] segmentedSwitchPressed:mySegmentedControl.selectedSegmentIndex];
}

-(void)awakeFromNib {
    
    [super awakeFromNib];
    NSLog(@"awakeFromNib just fired in ButtonSelectionCell");
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
