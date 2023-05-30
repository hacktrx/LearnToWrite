//
//  ChalkboardViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "stdlib.h"
#import "time.h"
//Why do I get errors when I don't have his import here in the .h file?
#import "AlphabetViewControlleriPad.h"
#import "VolumeSliderCelliPad.h"
#import "StrokeVolumeSliderCelliPad.h"
#import "LetterOptionsCelliPad.h"
#import "ChalkboardView.h"

@class ChalkboardView;
@class AlphabetViewControlleriPad;
@class SoundEffect;
@class BrushTableViewController;
@class SettingsViewControlleriPad;
@class AAnimationViewController;
@class BAnimationViewController;
@class CAnimationViewController;
@class DAnimationViewController;
@class EAnimationViewController;
@class FAnimationViewController;
@class GAnimationViewController;
@class HAnimationViewController;
@class IAnimationViewController;
@class JAnimationViewController;
@class KAnimationViewController;
@class LAnimationViewController;
@class MAnimationViewController;
@class NAnimationViewController;
@class OAnimationViewController;
@class PAnimationViewController;
@class QAnimationViewController;
@class RAnimationViewController;
@class SAnimationViewController;
@class TAnimationViewController;
@class UAnimationViewController;
@class VAnimationViewController;
@class WAnimationViewController;
@class XAnimationViewController;
@class YAnimationViewController;
@class ZAnimationViewController;
@class ZeroAnimationViewController;
@class OneAnimationViewController;
@class TwoAnimationViewController;
@class ThreeAnimationViewController;
@class FourAnimationViewController;
@class FiveAnimationViewController;
@class SixAnimationViewController;
@class SevenAnimationViewController;
@class EightAnimationViewController;
@class NineAnimationViewController;
@class TenAnimationViewController;

@class LetterRecording;
@class LetterStroke;
@class StrokePoint;

@interface ChalkboardViewController : UIViewController <UIPopoverControllerDelegate, NSFetchedResultsControllerDelegate, UIActionSheetDelegate, VolumeSliderCellDelegateiPad,StrokeVolumeSliderCellDelegateiPad, LetterOptionsCellDelegateiPad, ChalkboardViewDelegateiPad, LTW_AlphabetViewDelegateiPad> {
    
    SoundEffect         *soundFileForButton;	
	SoundEffect			*clickSoundiPhone;
	SoundEffect			*eraseSoundiPhone;
	
	CGSize popoverContentSize;
	UIPopoverController *brushPopoverController;
	UIPopoverController *settingsPopoverController;
	IBOutlet BrushTableViewController *brushTableViewController;
	//IBOutlet AnimationSpeedViewController *animationSpeedViewController;
    
    IBOutlet UIView *numberPadView;
    AlphabetViewControlleriPad *alphabetViewController;
	//IBOutlet UISlider *animationSpeedSlider;
	CGFloat animationSpeediPhone;
	IBOutlet ChalkboardView *chalkboardView;
	IBOutlet UILabel *letterLabeliPhone;
    IBOutlet UIImageView *guidlinesImage;

    IBOutlet UIBarButtonItem *playAnimationsButton;

    UIButton *correctButton;
	NSString *correctAnswer;
    IBOutlet UIButton *cancelGuessGameButton;
	IBOutlet UIButton *replayGuessAnimationButton;
    IBOutlet UILabel *playStrokesLabel;
    IBOutlet UILabel *cancelGuessGameLabel;
	IBOutlet UILabel *replayGuessAnimationLabel;
    IBOutlet UILabel *playGuessGameLabel;


//Added for v4.0
    NSString *letterTextForInitialization;
    NSInteger integerIdentifier;
    IBOutlet UIButton *playStrokesButton;
    NSManagedObjectContext *managedObjectContext;
    NSFetchedResultsController *fetchedResultsController;
    LetterRecording *letterRecording;
    LetterStroke *myLetterStroke;
    StrokePoint *myStrokePoint;
    int myStrokeCounterInteger;
    NSTimer *myTimer;
    NSArray *arrayOfStrokes;
    int orderOfStroke;
    NSInteger myUpperLowerTotalRecordings;
    NSString *myUpperLowercategoryString;
    NSInteger myUpperTotalRecordings;
    NSString *myUppercategoryString;
    NSInteger myLowerTotalRecordings;
    NSString *myLowercategoryString;
    NSInteger myNumberTotalRecordings;
    NSString *myNumbercategoryString;

    
    //an outlet to disable the guess game button when it's playing an animation.
	IBOutlet UIBarButtonItem *guessingGameButton;
    
	//an outlet to disable the refresh button when the alphabet buttons are minimized
    IBOutlet UIBarButtonItem *eraseButtoniPhone;
    IBOutlet UIBarButtonItem *settingsMenuButtoniPhone;

    //This is used in an if statement in the letterButton methods so the animations
	//don't play when playing the guessing game.
	BOOL guessingGameEnabled;
    
    //These are for the random animation functionality.
	int randomStartGameNumber;
	int randomRightAnswerNumber;
	int randomWrongAnswerNumber;

    AAnimationViewController *aAnimationViewControlleriPhone;
	BAnimationViewController *bAnimationViewControlleriPhone;
	CAnimationViewController *cAnimationViewControlleriPhone;
	DAnimationViewController *dAnimationViewControlleriPhone;
	EAnimationViewController *eAnimationViewControlleriPhone;
	FAnimationViewController *fAnimationViewControlleriPhone;
	GAnimationViewController *gAnimationViewControlleriPhone;
	HAnimationViewController *hAnimationViewControlleriPhone;
	IAnimationViewController *iAnimationViewControlleriPhone;
	JAnimationViewController *jAnimationViewControlleriPhone;
	KAnimationViewController *kAnimationViewControlleriPhone;
	LAnimationViewController *lAnimationViewControlleriPhone;
	MAnimationViewController *mAnimationViewControlleriPhone;
	NAnimationViewController *nAnimationViewControlleriPhone;
	OAnimationViewController *oAnimationViewControlleriPhone;
	PAnimationViewController *pAnimationViewControlleriPhone;
	QAnimationViewController *qAnimationViewControlleriPhone;
	RAnimationViewController *rAnimationViewControlleriPhone;
	SAnimationViewController *sAnimationViewControlleriPhone;
	TAnimationViewController *tAnimationViewControlleriPhone;
	UAnimationViewController *uAnimationViewControlleriPhone;
	VAnimationViewController *vAnimationViewControlleriPhone;
	WAnimationViewController *wAnimationViewControlleriPhone;
	XAnimationViewController *xAnimationViewControlleriPhone;
	YAnimationViewController *yAnimationViewControlleriPhone;
	ZAnimationViewController *zAnimationViewControlleriPhone;
    ZeroAnimationViewController *zeroAnimationViewControlleriPhone;
    OneAnimationViewController *oneAnimationViewControlleriPhone;
    TwoAnimationViewController *twoAnimationViewControlleriPhone;
    ThreeAnimationViewController *threeAnimationViewControlleriPhone;
    FourAnimationViewController *fourAnimationViewControlleriPhone;
    FiveAnimationViewController *fiveAnimationViewControlleriPhone;
    SixAnimationViewController *sixAnimationViewControlleriPhone;
    SevenAnimationViewController *sevenAnimationViewControlleriPhone;
    EightAnimationViewController *eightAnimationViewControlleriPhone;
    NineAnimationViewController *nineAnimationViewControlleriPhone;
    TenAnimationViewController *tenAnimationViewControlleriPhone;


    BOOL strokeSoundSettingsBoolFlag;
    float strokeVolumeValue;
    float globalVolumeValue;
    
    NSInteger currentButtonView;

    IBOutlet SettingsViewControlleriPad *settingsViewController;
	
}

@property (nonatomic) CGSize popoverContentSize;
@property (nonatomic, retain) UIPopoverController *brushPopoverController;
@property (nonatomic, retain) UIPopoverController *settingsPopoverController;
@property (nonatomic, retain) IBOutlet BrushTableViewController *brushTableViewController;
@property (nonatomic, assign) CGFloat animationSpeediPhone;
@property (nonatomic, retain) AlphabetViewControlleriPad *alphabetViewController;
@property (nonatomic, retain) IBOutlet UIView *numberPadView;
@property (nonatomic, retain) IBOutlet ChalkboardView *chalkboardView;
@property (nonatomic, retain) IBOutlet UILabel *letterLabeliPhone;
@property (nonatomic, retain) IBOutlet UIImageView *guidlinesImage;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *playAnimationsButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *letterRecordingButton;
@property (nonatomic, retain) SoundEffect *soundFileForButton;
@property (nonatomic, retain) SoundEffect *clickSoundiPhone;
@property (nonatomic, retain) SoundEffect *eraseSoundiPhone;

@property (nonatomic, retain) UIButton *correctButton;
@property (nonatomic, retain) NSString *correctAnswer;

@property (nonatomic, retain) IBOutlet UIButton *cancelGuessGameButton;
@property (nonatomic, retain) IBOutlet UIButton *replayGuessAnimationButton;
@property (nonatomic, retain) IBOutlet UILabel *playStrokesLabel;
@property (nonatomic, retain) IBOutlet UILabel *cancelGuessGameLabel;
@property (nonatomic, retain) IBOutlet UILabel *replayGuessAnimationLabel;
@property (nonatomic, retain) IBOutlet UILabel *playGuessGameLabel;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *guessingGameButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *eraseButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *settingsMenuButton;

//Added for v4.0
@property (nonatomic, strong) NSString *letterTextForInitialization;
@property (nonatomic, readwrite) NSInteger integerIdentifier;
@property (nonatomic, retain) IBOutlet UIButton *playStrokesButton;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) LetterRecording *letterRecording;
@property (nonatomic, retain) LetterStroke *myLetterStroke;
@property (nonatomic, retain) StrokePoint *myStrokePoint;
@property (nonatomic, retain) NSTimer *myTimer;
@property (nonatomic, strong) NSArray *arrayOfStrokes;
@property (nonatomic, readwrite) NSInteger myUpperLowerTotalRecordings;
@property (nonatomic, strong) NSString *myUpperLowerCatergoryString;
@property (nonatomic, readwrite) NSInteger myUpperTotalRecordings;
@property (nonatomic, strong) NSString *myUpperCatergoryString;
@property (nonatomic, readwrite) NSInteger myLowerTotalRecordings;
@property (nonatomic, strong) NSString *myLowerCatergoryString;
@property (nonatomic, readwrite) NSInteger myNumberTotalRecordings;
@property (nonatomic, strong) NSString *myNumberCatergoryString;



@property (nonatomic, retain) AAnimationViewController *aAnimationViewControlleriPhone;
@property (nonatomic, retain) BAnimationViewController *bAnimationViewControlleriPhone;
@property (nonatomic, retain) CAnimationViewController *cAnimationViewControlleriPhone;
@property (nonatomic, retain) DAnimationViewController *dAnimationViewControlleriPhone;
@property (nonatomic, retain) EAnimationViewController *eAnimationViewControlleriPhone;
@property (nonatomic, retain) FAnimationViewController *fAnimationViewControlleriPhone;
@property (nonatomic, retain) GAnimationViewController *gAnimationViewControlleriPhone;
@property (nonatomic, retain) HAnimationViewController *hAnimationViewControlleriPhone;
@property (nonatomic, retain) IAnimationViewController *iAnimationViewControlleriPhone;
@property (nonatomic, retain) JAnimationViewController *jAnimationViewControlleriPhone;
@property (nonatomic, retain) KAnimationViewController *kAnimationViewControlleriPhone;
@property (nonatomic, retain) LAnimationViewController *lAnimationViewControlleriPhone;
@property (nonatomic, retain) MAnimationViewController *mAnimationViewControlleriPhone;
@property (nonatomic, retain) NAnimationViewController *nAnimationViewControlleriPhone;
@property (nonatomic, retain) OAnimationViewController *oAnimationViewControlleriPhone;
@property (nonatomic, retain) PAnimationViewController *pAnimationViewControlleriPhone;
@property (nonatomic, retain) QAnimationViewController *qAnimationViewControlleriPhone;
@property (nonatomic, retain) RAnimationViewController *rAnimationViewControlleriPhone;
@property (nonatomic, retain) SAnimationViewController *sAnimationViewControlleriPhone;
@property (nonatomic, retain) TAnimationViewController *tAnimationViewControlleriPhone;
@property (nonatomic, retain) UAnimationViewController *uAnimationViewControlleriPhone;
@property (nonatomic, retain) VAnimationViewController *vAnimationViewControlleriPhone;
@property (nonatomic, retain) WAnimationViewController *wAnimationViewControlleriPhone;
@property (nonatomic, retain) XAnimationViewController *xAnimationViewControlleriPhone;
@property (nonatomic, retain) YAnimationViewController *yAnimationViewControlleriPhone;
@property (nonatomic, retain) ZAnimationViewController *zAnimationViewControlleriPhone;
@property (nonatomic, retain) ZeroAnimationViewController *zeroAnimationViewControlleriPhone;
@property (nonatomic, retain) OneAnimationViewController *oneAnimationViewControlleriPhone;
@property (nonatomic, retain) TwoAnimationViewController *twoAnimationViewControlleriPhone;
@property (nonatomic, retain) ThreeAnimationViewController *threeAnimationViewControlleriPhone;
@property (nonatomic, retain) FourAnimationViewController *fourAnimationViewControlleriPhone;
@property (nonatomic, retain) FiveAnimationViewController *fiveAnimationViewControlleriPhone;
@property (nonatomic, retain) SixAnimationViewController *sixAnimationViewControlleriPhone;
@property (nonatomic, retain) SevenAnimationViewController *sevenAnimationViewControlleriPhone;
@property (nonatomic, retain) EightAnimationViewController *eightAnimationViewControlleriPhone;
@property (nonatomic, retain) NineAnimationViewController *nineAnimationViewControlleriPhone;
@property (nonatomic, retain) TenAnimationViewController *tenAnimationViewControlleriPhone;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;
@property (nonatomic, readwrite) float strokeVolumeValue;
@property (nonatomic, readwrite) float globalVolumeValue;

@property (nonatomic, readwrite) NSInteger currentButtonView;

@property (nonatomic, retain) IBOutlet SettingsViewControlleriPad *settingsViewController;

//Called from the speedSettingCell
-(IBAction)changeAnimationSpeed:(id)sender;

//Called from the start guessing game button.
-(IBAction)guessGameButtonPressed:(id)sender;

-(void)playUpperLowerRandomAnimation;
-(void)playUpperRandomAnimation;
-(void)playLowerRandomAnimation;
-(void)playNumberRandomAnimation;

//Methods to play correct animation sequence.
-(IBAction)playAnimation:(id)sender;
-(void)playUpperLowerAnimation;
-(void)playUpperAnimation;
-(void)playLowerAnimation;
-(void)playNumberAnimation;

//Called from the say letter button.
-(void)sayLetteriPad;

//Main method to change letter label.
//Changed for v4.0. Made this a delegate method of the AlphabetViewController.
//-(void)changeLetter:(NSString *)textForLabel:(NSInteger)buttonIdentifier;

//Resets the toolbar buttons and the letter label to default state.
//Changed for v4.0. Made this a delegate method of the AlphabetViewController.
//-(void)buttonStyleChanged;

//This plays the erase sound when the erase button is pressed.
-(IBAction)eraseButtonPressed:(id)sender;

-(void)changeWritingBrush:(NSNotification *)notification;

//this activates on a notification from ChalkboardView that a touch has occurred in the drawing
//view, then this method enables the erase button.
-(void)enableEraseButton:(NSNotification *)notification;

//this activates on a notification from ChalkboardView that the chalkboard has been erased in the drawing
//view, then this method disables the erase button.
-(void)disableEraseButton:(NSNotification *)notification;

-(IBAction)cancelGuessGame:(id)sender;
-(IBAction)replayGuessAnimation:(id)sender;
-(void)replayUpperLowerRandomAnimation;
-(void)replayUpperRandomAnimation;
-(void)replayLowerRandomAnimation;
-(void)replayNumberRandomAnimation;

//This method chooses a random audio file to play when the guess game is started.
-(void)startGuessGameAudio;
-(void)playGuessLetterAudio;
-(void)playGuessNumberAudio;

//This method chooses a random audio file to play when a letter is correctly guessed.
-(void)rightAnswerAudio;

//This method chooses a random audio file to play when a letter is incorrectly guessed.
-(void)wrongAnswerAudio;

//this stops animations...duh!
-(void)stopAnimationsiPhone;
-(void)playTheClickSound;
-(IBAction)activatePopoverMenu:(id)sender;
-(IBAction)activateSettingsPopoverMenu:(id)sender;
//this activates on a notification from BrushTableViewController that a brush has been selected,
//then this method dismisses the popover immediately.
-(void)dismissMyPopover:(NSNotification *)notification;

//Added for v4.0
-(NSArray *)getRecordingsForLetter:(NSString *)letter;
-(void)createLetterRecordingForLetter:(NSString *)letter;
-(NSArray *)getStrokePoints;
-(NSArray *)getStrokesForLetterRecording:(LetterRecording *)myLetterRecording;
//-(NSArray *)getStrokesForLetter:(NSString *)letter;
-(void)initializeDefaultLetterView;
-(void)emptyDatabaseOfStrokes;
-(void)resetTheStrokes;
-(void)loadLetterRecordingForLetterLabel:(NSString *)letterLabel;
-(IBAction)playDataStrokes:(id)sender;
-(void)cancelPlayDataStrokes;
-(void)startDataTimer;
-(void)myTimedDataFunction;
-(void)playbackLetterStroke:(LetterStroke *)letterStroke;
-(void)resetLetterRecording;
-(NSString *)setMyRecordingCategory;
-(NSInteger)getRecordingsForUpperLowerCategory;
-(NSInteger)getRecordingsForUpperCategory;
-(NSInteger)getRecordingsForLowerCategory;
-(NSInteger)getRecordingsForNumberCategory;

@end
