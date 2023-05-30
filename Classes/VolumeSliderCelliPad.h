//
//  VolumeSliderCelliPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VolumeSliderCellDelegateiPad <NSObject>

-(void)globalSliderValueChanged:(float)sliderValue;

@end


@interface VolumeSliderCelliPad : UITableViewCell {
    
    __unsafe_unretained id<VolumeSliderCellDelegateiPad> delegate;
    
    IBOutlet UISlider *myVolumeSlider;
    
    
}

@property (readwrite, unsafe_unretained) id<VolumeSliderCellDelegateiPad> delegate;

@property (nonatomic, retain) IBOutlet UISlider *myVolumeSlider;

-(IBAction)volumeSliderValueChanged:(id)sender;

@end
