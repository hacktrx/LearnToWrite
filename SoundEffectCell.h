//
//  SoundEffectCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/4/11.
//  Copyright 2011 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SoundEffectCellDelegate <NSObject>

-(void)globalSoundButtonSwitched:(BOOL)stateOfSwitch;
-(void)strokeSoundButtonSwitched:(BOOL)stateOfSwitch;

@end


@interface SoundEffectCell : UITableViewCell {
    
    __unsafe_unretained id<SoundEffectCellDelegate> delegate;
    
    IBOutlet UISwitch *globalSoundSwitch;
    IBOutlet UILabel *cellTextLabel;
    
    IBOutlet UISwitch *strokeSoundSwitch;
    IBOutlet UILabel *strokeCellTextLabel;
}

@property (readwrite, unsafe_unretained) id<SoundEffectCellDelegate> delegate;

@property (nonatomic, retain) IBOutlet UISwitch *globalSoundSwitch;
@property (nonatomic, retain) IBOutlet UILabel *cellTextLabel;

@property (nonatomic, retain) IBOutlet UISwitch *strokeSoundSwitch;
@property (nonatomic, retain) IBOutlet UILabel *strokeCellTextLabel;

- (IBAction)globalSoundSettingChanged:(id)sender;
- (IBAction)strokeSoundSettingChanged:(id)sender;

@end
