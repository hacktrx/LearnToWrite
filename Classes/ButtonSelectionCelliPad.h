//
//  ButtonSelectionCelliPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentedSwitchDelegateiPad <NSObject>

- (void)segmentedSwitchPressediPad:(NSInteger)selectedSegment;

@end


@interface ButtonSelectionCelliPad : UITableViewCell {
    
    __unsafe_unretained id <SegmentedSwitchDelegateiPad> delegate;
    
    IBOutlet UISegmentedControl *mySegmentedControl;
    NSInteger selectedSwitchSegment;
    
}

@property (readwrite, unsafe_unretained) id <SegmentedSwitchDelegateiPad> delegate;

@property (nonatomic, retain) IBOutlet UISegmentedControl *mySegmentedControl;
@property (nonatomic, readwrite) NSInteger selectedSwitchSegment;


-(IBAction)segmentControlValueChanged;

@end
