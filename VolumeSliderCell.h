//
//  VolumeSliderCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/10/12.
//  Copyright 2012 JH Productions. All rights reserved.
//


//THIS IS THE VOLUME CELL FOR VOICE VOLUME

#import <UIKit/UIKit.h>

@protocol VolumeSliderCellDelegate <NSObject>

-(void)globalSliderValueChanged:(float)sliderValue;

@end


@interface VolumeSliderCell : UITableViewCell {
    
    __unsafe_unretained id<VolumeSliderCellDelegate> delegate;

    IBOutlet UISlider *myVolumeSlider;

    
}

@property (readwrite, unsafe_unretained) id<VolumeSliderCellDelegate> delegate;

@property (nonatomic, retain) IBOutlet UISlider *myVolumeSlider;

-(IBAction)volumeSliderValueChanged:(id)sender;

@end
