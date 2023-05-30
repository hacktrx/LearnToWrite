//
//  ButtonSelectionCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 1/29/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentedSwitchDelegate <NSObject>

- (void)segmentedSwitchPressed:(NSInteger)selectedSegment;

@end


@interface ButtonSelectionCell : UITableViewCell {
    
    __unsafe_unretained id <SegmentedSwitchDelegate> delegate;

    IBOutlet UISegmentedControl *mySegmentedControl;
    NSInteger selectedSwitchSegment;
        
}

@property (readwrite, unsafe_unretained) id <SegmentedSwitchDelegate> delegate;

@property (nonatomic, retain) IBOutlet UISegmentedControl *mySegmentedControl;
@property (nonatomic, readwrite) NSInteger selectedSwitchSegment;


-(IBAction)segmentControlValueChanged;

@end
