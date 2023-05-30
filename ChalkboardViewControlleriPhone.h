//
//  ChalkboardViewControlleriPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 9/20/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "stdlib.h"
#import "time.h"
#import "AlphabetViewController.h"
#import "VolumeSliderCell.h"
#import "StrokeVolumeSliderCell.h"
#import "LetterOptionsCell.h"
#import "ChalkboardViewiPhone.h"

@class ChalkboardViewiPhone;
@class AlphabetViewController;
@class SoundEffect;
@class AAnimationViewControlleriPhone;
@class BAnimationViewControlleriPhone;
@class CAnimationViewControlleriPhone;
@class DAnimationViewControlleriPhone;
@class EAnimationViewControlleriPhone;
@class FAnimationViewControlleriPhone;
@class GAnimationViewControlleriPhone;
@class HAnimationViewControlleriPhone;
@class IAnimationViewControlleriPhone;
@class JAnimationViewControlleriPhone;
@class KAnimationViewControlleriPhone;
@class LAnimationViewControlleriPhone;
@class MAnimationViewControlleriPhone;
@class NAnimationViewControlleriPhone;
@class OAnimationViewControlleriPhone;
@class PAnimationViewControlleriPhone;
@class QAnimationViewControlleriPhone;
@class RAnimationViewControlleriPhone;
@class SAnimationViewControlleriPhone;
@class TAnimationViewControlleriPhone;
@class UAnimationViewControlleriPhone;
@class VAnimationViewControlleriPhone;
@class WAnimationViewControlleriPhone;
@class XAnimationViewControlleriPhone;
@class YAnimationViewControlleriPhone;
@class ZAnimationViewControlleriPhone;
@class ZeroAnimationViewControlleriPhone;
@class OneAnimationViewControlleriPhone;
@class TwoAnimationViewControlleriPhone;
@class ThreeAnimationViewControlleriPhone;
@class FourAnimationViewControlleriPhone;
@class FiveAnimationViewControlleriPhone;
@class SixAnimationViewControlleriPhone;
@class SevenAnimationViewControlleriPhone;
@class EightAnimationViewControlleriPhone;
@class NineAnimationViewControlleriPhone;
@class TenAnimationViewControlleriPhone;

@class LetterRecording;
@class LetterStroke;
@class StrokePoint;



@interface ChalkboardViewControlleriPhone : UIViewController <NSFetchedResultsControllerDelegate, UIScrollViewDelegate, UIActionSheetDelegate, VolumeSliderCellDelegate,StrokeVolumeSliderCellDelegate, LetterOptionsCellDelegate, ChalkboardViewDelegate, LTW_AlphabetViewDelegateiPhone> {
    
    SoundEffect         *soundFileForButton;
	SoundEffect			*clickSoundiPhone;
	SoundEffect			*eraseSoundiPhone;

    IBOutlet UIScrollView *scrollViewiPhone;    
    AlphabetViewController *alphabetViewController;
    //IBOutlet UISlider *animationSpeedSlideriPhone;
    CGFloat animationSpeediPhone;
    IBOutlet ChalkboardViewiPhone *chalkboardViewiPhone;
    IBOutlet UILabel *letterLabeliPhone;
    IBOutlet UIImageView *guidlinesImage;
    
    IBOutlet UIBarButtonItem *choosPaintbrushButton;
    
    IBOutlet UIBarButtonItem *playAnimationsButton;
    
    IBOutlet UIBarButtonItem *letterRecordingButton;    
    //Using this to match up the correct answer with a button tap.
	UIButton *correctButton;
	NSString *correctAnswer;
    IBOutlet UIButton *cancelGuessGameButtoniPhone;
	IBOutlet UIButton *replayGuessAnimationButtoniPhone;
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
	IBOutlet UIBarButtonItem *guessingGameButtoniPhone;
    
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
    
    AAnimationViewControlleriPhone *aAnimationViewControlleriPhone;
	BAnimationViewControlleriPhone *bAnimationViewControlleriPhone;
	CAnimationViewControlleriPhone *cAnimationViewControlleriPhone;
	DAnimationViewControlleriPhone *dAnimationViewControlleriPhone;
	EAnimationViewControlleriPhone *eAnimationViewControlleriPhone;
	FAnimationViewControlleriPhone *fAnimationViewControlleriPhone;
	GAnimationViewControlleriPhone *gAnimationViewControlleriPhone;
	HAnimationViewControlleriPhone *hAnimationViewControlleriPhone;
	IAnimationViewControlleriPhone *iAnimationViewControlleriPhone;
	JAnimationViewControlleriPhone *jAnimationViewControlleriPhone;
	KAnimationViewControlleriPhone *kAnimationViewControlleriPhone;
	LAnimationViewControlleriPhone *lAnimationViewControlleriPhone;
	MAnimationViewControlleriPhone *mAnimationViewControlleriPhone;
	NAnimationViewControlleriPhone *nAnimationViewControlleriPhone;
	OAnimationViewControlleriPhone *oAnimationViewControlleriPhone;
	PAnimationViewControlleriPhone *pAnimationViewControlleriPhone;
	QAnimationViewControlleriPhone *qAnimationViewControlleriPhone;
	RAnimationViewControlleriPhone *rAnimationViewControlleriPhone;
	SAnimationViewControlleriPhone *sAnimationViewControlleriPhone;
	TAnimationViewControlleriPhone *tAnimationViewControlleriPhone;
	UAnimationViewControlleriPhone *uAnimationViewControlleriPhone;
	VAnimationViewControlleriPhone *vAnimationViewControlleriPhone;
	WAnimationViewControlleriPhone *wAnimationViewControlleriPhone;
	XAnimationViewControlleriPhone *xAnimationViewControlleriPhone;
	YAnimationViewControlleriPhone *yAnimationViewControlleriPhone;
	ZAnimationViewControlleriPhone *zAnimationViewControlleriPhone;
    ZeroAnimationViewControlleriPhone *zeroAnimationViewControlleriPhone;
    OneAnimationViewControlleriPhone *oneAnimationViewControlleriPhone;
    TwoAnimationViewControlleriPhone *twoAnimationViewControlleriPhone;
    ThreeAnimationViewControlleriPhone *threeAnimationViewControlleriPhone;
    FourAnimationViewControlleriPhone *fourAnimationViewControlleriPhone;
    FiveAnimationViewControlleriPhone *fiveAnimationViewControlleriPhone;
    SixAnimationViewControlleriPhone *sixAnimationViewControlleriPhone;
    SevenAnimationViewControlleriPhone *sevenAnimationViewControlleriPhone;
    EightAnimationViewControlleriPhone *eightAnimationViewControlleriPhone;
    NineAnimationViewControlleriPhone *nineAnimationViewControlleriPhone;
    TenAnimationViewControlleriPhone *tenAnimationViewControlleriPhone;
    
    BOOL strokeSoundSettingsBoolFlag;
    float strokeVolumeValue;
    float globalVolumeValue;
    
    NSInteger currentButtonView;

    //TODO: Put the rest here.
    
}


@property (nonatomic, assign) CGFloat animationSpeediPhone;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewiPhone;
@property (nonatomic, retain) AlphabetViewController *alphabetViewController;
@property (nonatomic, retain) IBOutlet ChalkboardViewiPhone *chalkboardViewiPhone;
@property (nonatomic, retain) IBOutlet UILabel *letterLabeliPhone;
@property (nonatomic, retain) IBOutlet UIImageView *guidlinesImage;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *choosPaintbrushButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *playAnimationsButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *letterRecordingButton;
@property (nonatomic, retain) SoundEffect *soundFileForButton;
@property (nonatomic, retain) SoundEffect *clickSoundiPhone;
@property (nonatomic, retain) SoundEffect *eraseSoundiPhone;

@property (nonatomic, retain) UIButton *correctButton;
@property (nonatomic, retain) NSString *correctAnswer;

@property (nonatomic, retain) IBOutlet UIButton *cancelGuessGameButtoniPhone;
@property (nonatomic, retain) IBOutlet UIButton *replayGuessAnimationButtoniPhone;
@property (nonatomic, retain) IBOutlet UILabel *playStrokesLabel;
@property (nonatomic, retain) IBOutlet UILabel *cancelGuessGameLabel;
@property (nonatomic, retain) IBOutlet UILabel *replayGuessAnimationLabel;
@property (nonatomic, retain) IBOutlet UILabel *playGuessGameLabel;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *guessingGameButtoniPhone;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *eraseButtoniPhone;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *settingsMenuButtoniPhone;

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



@property (nonatomic, retain) AAnimationViewControlleriPhone *aAnimationViewControlleriPhone;
@property (nonatomic, retain) BAnimationViewControlleriPhone *bAnimationViewControlleriPhone;
@property (nonatomic, retain) CAnimationViewControlleriPhone *cAnimationViewControlleriPhone;
@property (nonatomic, retain) DAnimationViewControlleriPhone *dAnimationViewControlleriPhone;
@property (nonatomic, retain) EAnimationViewControlleriPhone *eAnimationViewControlleriPhone;
@property (nonatomic, retain) FAnimationViewControlleriPhone *fAnimationViewControlleriPhone;
@property (nonatomic, retain) GAnimationViewControlleriPhone *gAnimationViewControlleriPhone;
@property (nonatomic, retain) HAnimationViewControlleriPhone *hAnimationViewControlleriPhone;
@property (nonatomic, retain) IAnimationViewControlleriPhone *iAnimationViewControlleriPhone;
@property (nonatomic, retain) JAnimationViewControlleriPhone *jAnimationViewControlleriPhone;
@property (nonatomic, retain) KAnimationViewControlleriPhone *kAnimationViewControlleriPhone;
@property (nonatomic, retain) LAnimationViewControlleriPhone *lAnimationViewControlleriPhone;
@property (nonatomic, retain) MAnimationViewControlleriPhone *mAnimationViewControlleriPhone;
@property (nonatomic, retain) NAnimationViewControlleriPhone *nAnimationViewControlleriPhone;
@property (nonatomic, retain) OAnimationViewControlleriPhone *oAnimationViewControlleriPhone;
@property (nonatomic, retain) PAnimationViewControlleriPhone *pAnimationViewControlleriPhone;
@property (nonatomic, retain) QAnimationViewControlleriPhone *qAnimationViewControlleriPhone;
@property (nonatomic, retain) RAnimationViewControlleriPhone *rAnimationViewControlleriPhone;
@property (nonatomic, retain) SAnimationViewControlleriPhone *sAnimationViewControlleriPhone;
@property (nonatomic, retain) TAnimationViewControlleriPhone *tAnimationViewControlleriPhone;
@property (nonatomic, retain) UAnimationViewControlleriPhone *uAnimationViewControlleriPhone;
@property (nonatomic, retain) VAnimationViewControlleriPhone *vAnimationViewControlleriPhone;
@property (nonatomic, retain) WAnimationViewControlleriPhone *wAnimationViewControlleriPhone;
@property (nonatomic, retain) XAnimationViewControlleriPhone *xAnimationViewControlleriPhone;
@property (nonatomic, retain) YAnimationViewControlleriPhone *yAnimationViewControlleriPhone;
@property (nonatomic, retain) ZAnimationViewControlleriPhone *zAnimationViewControlleriPhone;
@property (nonatomic, retain) ZeroAnimationViewControlleriPhone *zeroAnimationViewControlleriPhone;
@property (nonatomic, retain) OneAnimationViewControlleriPhone *oneAnimationViewControlleriPhone;
@property (nonatomic, retain) TwoAnimationViewControlleriPhone *twoAnimationViewControlleriPhone;
@property (nonatomic, retain) ThreeAnimationViewControlleriPhone *threeAnimationViewControlleriPhone;
@property (nonatomic, retain) FourAnimationViewControlleriPhone *fourAnimationViewControlleriPhone;
@property (nonatomic, retain) FiveAnimationViewControlleriPhone *fiveAnimationViewControlleriPhone;
@property (nonatomic, retain) SixAnimationViewControlleriPhone *sixAnimationViewControlleriPhone;
@property (nonatomic, retain) SevenAnimationViewControlleriPhone *sevenAnimationViewControlleriPhone;
@property (nonatomic, retain) EightAnimationViewControlleriPhone *eightAnimationViewControlleriPhone;
@property (nonatomic, retain) NineAnimationViewControlleriPhone *nineAnimationViewControlleriPhone;
@property (nonatomic, retain) TenAnimationViewControlleriPhone *tenAnimationViewControlleriPhone;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;
@property (nonatomic, readwrite) float strokeVolumeValue;
@property (nonatomic, readwrite) float globalVolumeValue;

@property (nonatomic, readwrite) NSInteger currentButtonView;

//Called from the letterRecording button.
-(IBAction)showActionSheet:(id)sender;

//Called from the speedSettingCell
-(IBAction)changeAnimationSpeediPhone:(id)sender;

//Called from the start guessing game button.
-(IBAction)guessGameButtonPressed:(id)sender;

-(void)playUpperLowerRandomAnimation;
-(void)playUpperRandomAnimation;
-(void)playLowerRandomAnimation;
-(void)playNumberRandomAnimation;

//Methods to play correct animation sequence.
-(IBAction)playAnimationiPhone:(id)sender;
-(void)playUpperLowerAnimation;
-(void)playUpperAnimation;
-(void)playLowerAnimation;
-(void)playNumberAnimation;

//Called in the change letter method when a new letter is selected.
-(void)sayLetteriPhone;

//Main method to change letter label.
//Changed for v4.0. Made this a delegate method of the AlphabetViewController.
//-(void)changeLetteriPhone:(NSString *)textForLabel:(NSInteger)buttonIdentifier;

//Resets the toolbar buttons and the letter label to default state.
//Changed for v4.0. Made this a delegate method of the AlphabetViewController.
//-(void)buttonStyleChanged;

//This plays the erase sound when the erase button is pressed.
-(IBAction)eraseButtonPressediPhone:(id)sender;

-(void)changeWritingBrushiPhone:(NSNotification *)notification;

//this activates on a notification from ChalkboardView that a touch has occurred in the drawing
//view, then this method enables the erase button.
-(void)enableEraseButtoniPhone:(NSNotification *)notification;

//this activates on a notification from ChalkboardView that the chalkboard has been erased in the drawing
//view, then this method disables the erase button.
-(void)disableEraseButtoniPhone:(NSNotification *)notification;

-(IBAction)cancelGuessGame:(id)sender;
-(IBAction)replayGuessAnimationiPhone:(id)sender;
-(void)replayUpperLowerRandomAnimation;
-(void)replayUpperRandomAnimation;
-(void)replayLowerRandomAnimation;
-(void)replayNumberRandomAnimation;

//This method chooses a random audio file to play when the guess game is started.
-(void)startGuessGameAudioiPhone;
-(void)playGuessLetterAudio;
-(void)playGuessNumberAudio;
//This method chooses a random audio file to play when a letter is correctly guessed.
-(void)rightAnswerAudioiPhone;
//This method chooses a random audio file to play when a letter is incorrectly guessed.
-(void)wrongAnswerAudioiPhone;
//this stops animations...duh!
-(void)stopAnimationsiPhone;
-(void)playTheClickSound;

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


