//
//  StrokeVolumeSliderCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/10/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StrokeVolumeSliderCellDelegate <NSObject>

-(void)strokeSliderValueChanged:(float)sliderValue;

@end


@interface StrokeVolumeSliderCell : UITableViewCell {
    
    __unsafe_unretained id<StrokeVolumeSliderCellDelegate> delegate;
    
    IBOutlet UISlider *myStrokeVolumeSlider;

    
}

@property (readwrite, unsafe_unretained) id<StrokeVolumeSliderCellDelegate> delegate;

@property (nonatomic, retain) IBOutlet UISlider *myStrokeVolumeSlider;

-(IBAction)strokeVolumeSliderValueChanged:(id)sender;

@end
