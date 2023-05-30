//
//  SettingsViewControlleriPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/16/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpeedSettingCelliPad;
@class LetterOptionsCelliPad;
@class ChalkboardViewController;
@class ButtonSelectionCelliPad;
@class VolumeSliderCelliPad;
@class StrokeVolumeSliderCelliPad;

@interface SettingsViewControlleriPad : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet SpeedSettingCelliPad *speedSettingCell;
    IBOutlet LetterOptionsCelliPad *paperLinesCell;
    IBOutlet ButtonSelectionCelliPad *buttonSelectionCell;
    IBOutlet VolumeSliderCelliPad *volumeSliderCell;
    IBOutlet StrokeVolumeSliderCelliPad *strokeVolumeSliderCell;
    
    //Added for v4.0
    IBOutlet UIImageView *upperLowerStrokeImageView;
    IBOutlet UILabel *upperLowerStrokeLabel;
    IBOutlet UIImageView *upperStrokeImageView;
    IBOutlet UILabel *upperStrokeLabel;
    IBOutlet UIImageView *lowerStrokeImageView;
    IBOutlet UILabel *lowerStrokeLabel;
    IBOutlet UIImageView *numberStrokeImageView;
    IBOutlet UILabel *numberStrokeLabel;
    NSString *upperLowerString;
    NSString *upperString;
    NSString *lowerString;
    NSString *numberString;

    //IBOutlet UIBarButtonItem *saveButton;
    
    ChalkboardViewController *chalkboardViewController;
    
    
}

@property (nonatomic, retain) IBOutlet SpeedSettingCelliPad *speedSettingCell;
@property (nonatomic, retain) IBOutlet LetterOptionsCelliPad *paperLinesCell;
@property (nonatomic, retain) IBOutlet ButtonSelectionCelliPad *buttonSelectionCell;
@property (nonatomic, retain) IBOutlet VolumeSliderCelliPad *volumeSliderCell;
@property (nonatomic, retain) IBOutlet StrokeVolumeSliderCelliPad *strokeVolumeSliderCell;
@property (nonatomic, strong) IBOutlet UIImageView *upperLowerStrokeImageView;
@property (nonatomic, strong) IBOutlet UILabel *upperLowerStrokeLabel;
@property (nonatomic, strong) IBOutlet UIImageView *upperStrokeImageView;
@property (nonatomic, strong) IBOutlet UILabel *upperStrokeLabel;
@property (nonatomic, strong) IBOutlet UIImageView *lowerStrokeImageView;
@property (nonatomic, strong) IBOutlet UILabel *lowerStrokeLabel;
@property (nonatomic, strong) IBOutlet UIImageView *numberStrokeImageView;
@property (nonatomic, strong) IBOutlet UILabel *numberStrokeLabel;
@property (nonatomic, strong) NSString *upperLowerString;
@property (nonatomic, strong) NSString *upperString;
@property (nonatomic, strong) NSString *lowerString;
@property (nonatomic, strong) NSString *numberString;

@property (nonatomic, retain) ChalkboardViewController *chalkboardViewController;


//- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

-(IBAction)playSoundForButton:(id)sender;
-(void)updateUpperLowerString:(NSString *)text;
-(void)updateUpperString:(NSString *)text;
-(void)updateLowerString:(NSString *)text;
-(void)updateNumberString:(NSString *)text;
-(void)updateUpperLowerIcon;
-(void)updateUpperIcon;
-(void)updateLowerIcon;
-(void)updateNumberIcon;


//Use this to add a barbutton item to the nav bar. Also, I would need to add
//a barbuttonitem to the nib and make the connections to my save method (if that's
//what I choose the button to do.
//@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButton;
//-(IBAction)save:(id)sender;

@end
