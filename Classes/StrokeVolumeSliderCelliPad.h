//
//  StrokeVolumeSliderCelliPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/25/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StrokeVolumeSliderCellDelegateiPad <NSObject>

-(void)strokeSliderValueChanged:(float)sliderValue;

@end


@interface StrokeVolumeSliderCelliPad : UITableViewCell {
    
    __unsafe_unretained id<StrokeVolumeSliderCellDelegateiPad> delegate;
    
    IBOutlet UISlider *myStrokeVolumeSlider;
    
    
}

@property (readwrite, unsafe_unretained) id<StrokeVolumeSliderCellDelegateiPad> delegate;

@property (nonatomic, retain) IBOutlet UISlider *myStrokeVolumeSlider;

-(IBAction)strokeVolumeSliderValueChanged:(id)sender;

@end
