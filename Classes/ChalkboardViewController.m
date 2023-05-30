//
//  ChalkboardViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import "ChalkboardViewController.h"
#import "ChalkboardView.h"
#import "SoundEffect.h"
#import "BrushTableViewController.h"
//#import "AnimationSpeedViewController.h"
#import "AAnimationViewController.h"
#import "BAnimationViewController.h"
#import "CAnimationViewController.h"
#import "DAnimationViewController.h"
#import "EAnimationViewController.h"
#import "FAnimationViewController.h"
#import "GAnimationViewController.h"
#import "HAnimationViewController.h"
#import "IAnimationViewController.h"
#import "JAnimationViewController.h"
#import "KAnimationViewController.h"
#import "LAnimationViewController.h"
#import "MAnimationViewController.h"
#import "NAnimationViewController.h"
#import "OAnimationViewController.h"
#import "PAnimationViewController.h"
#import "QAnimationViewController.h"
#import "RAnimationViewController.h"
#import "SAnimationViewController.h"
#import "TAnimationViewController.h"
#import "UAnimationViewController.h"
#import "VAnimationViewController.h"
#import "WAnimationViewController.h"
#import "XAnimationViewController.h"
#import "YAnimationViewController.h"
#import "ZAnimationViewController.h"
#import "ZeroAnimationViewController.h"
#import "OneAnimationViewController.h"
#import "TwoAnimationViewController.h"
#import "ThreeAnimationViewController.h"
#import "FourAnimationViewController.h"
#import "FiveAnimationViewController.h"
#import "SixAnimationViewController.h"
#import "SevenAnimationViewController.h"
#import "EightAnimationViewController.h"
#import "NineAnimationViewController.h"
#import "TenAnimationViewController.h"

#import "ButtonStyleDefinitions.h"

#import "SettingsViewControlleriPad.h"
#import "AlphabetViewControlleriPad.h"

#import "LetterRecording.h"
#import "StrokePoint.h"
#import "LetterStroke.h"

@implementation ChalkboardViewController

@synthesize popoverContentSize;
@synthesize brushPopoverController;
@synthesize numberPadView;
@synthesize animationSpeediPhone;
@synthesize alphabetViewController;
@synthesize chalkboardView;
@synthesize letterLabeliPhone;
@synthesize guidlinesImage;
@synthesize playAnimationsButton;
@synthesize letterRecordingButton;
@synthesize settingsPopoverController;
@synthesize brushTableViewController;
@synthesize soundFileForButton;
@synthesize clickSoundiPhone;
@synthesize eraseSoundiPhone;
@synthesize correctButton;
@synthesize correctAnswer;
@synthesize cancelGuessGameButton;
@synthesize replayGuessAnimationButton;
@synthesize playStrokesLabel;
@synthesize cancelGuessGameLabel;
@synthesize replayGuessAnimationLabel;
@synthesize playGuessGameLabel;

@synthesize guessingGameButton;
@synthesize eraseButton;
@synthesize settingsMenuButton;

@synthesize aAnimationViewControlleriPhone;
@synthesize bAnimationViewControlleriPhone;
@synthesize cAnimationViewControlleriPhone;
@synthesize dAnimationViewControlleriPhone;
@synthesize eAnimationViewControlleriPhone;
@synthesize fAnimationViewControlleriPhone;
@synthesize gAnimationViewControlleriPhone;
@synthesize hAnimationViewControlleriPhone;
@synthesize iAnimationViewControlleriPhone;
@synthesize jAnimationViewControlleriPhone;
@synthesize kAnimationViewControlleriPhone;
@synthesize lAnimationViewControlleriPhone;
@synthesize mAnimationViewControlleriPhone;
@synthesize nAnimationViewControlleriPhone;
@synthesize oAnimationViewControlleriPhone;
@synthesize pAnimationViewControlleriPhone;
@synthesize qAnimationViewControlleriPhone;
@synthesize rAnimationViewControlleriPhone;
@synthesize sAnimationViewControlleriPhone;
@synthesize tAnimationViewControlleriPhone;
@synthesize uAnimationViewControlleriPhone;
@synthesize vAnimationViewControlleriPhone;
@synthesize wAnimationViewControlleriPhone;
@synthesize xAnimationViewControlleriPhone;
@synthesize yAnimationViewControlleriPhone;
@synthesize zAnimationViewControlleriPhone;
@synthesize zeroAnimationViewControlleriPhone;
@synthesize oneAnimationViewControlleriPhone;
@synthesize twoAnimationViewControlleriPhone;
@synthesize threeAnimationViewControlleriPhone;
@synthesize fourAnimationViewControlleriPhone;
@synthesize fiveAnimationViewControlleriPhone;
@synthesize sixAnimationViewControlleriPhone;
@synthesize sevenAnimationViewControlleriPhone;
@synthesize eightAnimationViewControlleriPhone;
@synthesize nineAnimationViewControlleriPhone;
@synthesize tenAnimationViewControlleriPhone;

@synthesize strokeSoundSettingsBoolFlag;
@synthesize strokeVolumeValue;
@synthesize globalVolumeValue;
@synthesize currentButtonView;

@synthesize settingsViewController;

//Added for v4.0
@synthesize letterTextForInitialization;
@synthesize integerIdentifier;
@synthesize playStrokesButton;
@synthesize managedObjectContext;
@synthesize fetchedResultsController;
@synthesize letterRecording;
@synthesize myLetterStroke;
@synthesize myStrokePoint;
@synthesize myTimer;
@synthesize arrayOfStrokes;
@synthesize myUpperLowerTotalRecordings;
@synthesize myUpperLowerCatergoryString;
@synthesize myUpperTotalRecordings;
@synthesize myUpperCatergoryString;
@synthesize myLowerTotalRecordings;
@synthesize myLowerCatergoryString;
@synthesize myNumberTotalRecordings;
@synthesize myNumberCatergoryString;

#pragma mark - When the View Loads

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear fired in ChalkboardViewControlleriPhone, animationSpeediPhone is a value of %f", animationSpeediPhone);
    
    [self initializeDefaultLetterView];
}


- (void)viewDidLoad {
            
    AlphabetViewControlleriPad *myAlphabetViewController = [[AlphabetViewControlleriPad alloc] initWithNibName:@"AlphabetViewControlleriPad" bundle:nil];
    self.alphabetViewController = myAlphabetViewController;
    
    self.alphabetViewController.chalkboardViewController = self;
    [self.numberPadView addSubview:alphabetViewController.view];
    self.currentButtonView = 0;
	
	// Load the sounds
	NSBundle *mainBundle = [NSBundle mainBundle];	

	clickSoundiPhone =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"Click" ofType:@"caf"]];
	eraseSoundiPhone =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"Erase" ofType:@"caf"]];

	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissMyPopover:)
												 name:@"brushHasBeenSelected" object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableEraseButton:)
												 name:@"touchOccuredInView" object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disableEraseButton:)
												 name:@"chalkboardErased" object:nil];
    
    animationSpeediPhone = -1;
    self.strokeSoundSettingsBoolFlag = YES;
    self.strokeVolumeValue = .5;
    self.globalVolumeValue = .5;
	guessingGameEnabled = NO;
    self.letterLabeliPhone.font = [UIFont fontWithName:@"SchZBPrint-Regular" size:200.0];
	self.playAnimationsButton.enabled = YES;
	[self.chalkboardView setDelegate:self];
    [self.alphabetViewController setDelegate:self];
    self.playStrokesButton.hidden = YES;
    self.playStrokesLabel.hidden = YES;
    
	//TODO : This is how to use device notifications.
	/*
	//Begin genterating notification so I can stop animations when the device is going to rotate.
	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
												 name:UIDeviceOrientationDidChangeNotification object:nil];
	*/
	
	//Creating an array of strings that we'll use for the random animation button.
	//myLetterButtonMethodsArray = [NSArray arrayWithObjects:@"changeLetterA:", @"changeLetterB:", nil ];	
	
    //Register for a notification that will be activated with the stroke sound switch.
/*    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStrokeSoundSettingsBoolFlag)
												 name:@"strokeSoundSettingChanged" object:nil];
    
    //Register for a notification that will be activated with the voice sound switch.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeGlobalSoundSettingsBoolFlag)
												 name:@"globalSoundSettingChanged" object:nil];
*/    
    
    
    NSLog(@"StrokeSoundSettingsBoolFlag in viewDidLoad of ChalkboardViewController iPad is %d", self.strokeSoundSettingsBoolFlag);
            
	
    CGPoint labelCenter = self.letterLabeliPhone.center;
    NSLog(@"The letterLabel center is %f,%f", labelCenter.x, labelCenter.y);
    
    //Added for v4.0 to set the letterLabel to the right position for Retina 4.
    if (self.view.bounds.size.height > 480) {
        float newCenterY = (self.letterLabeliPhone.center.y - 44);
        float newCenterX = self.letterLabeliPhone.center.x;
        CGPoint newCenter = (CGPointMake(newCenterX, newCenterY));
        [self.letterLabeliPhone setCenter:newCenter];
    }

    [super viewDidLoad];
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}
 */


#pragma mark - Recording Categories for Recording

//This assigns a string to the categoryString property so it can be used to set the category string in each
//letter recording that is created. The category string of the recording is then used in a fetch later on to
//allow me to sort how many recordings with strokes there are for each writing category. That is then used
//to set the recording icons on the segmented switch.
-(NSString *)setMyRecordingCategory {
    
    NSString *myCategoryString;
    NSInteger categoryInteger;
    categoryInteger = self.currentButtonView;
    
    switch (categoryInteger) {
        case 0:
            myCategoryString = @"UpperLowerLetters";
            break;
        case 1:
            myCategoryString = @"UpperLetters";
            break;
        case 2:
            myCategoryString = @"LowerLetters";
            break;
        case 3:
            myCategoryString = @"Numbers";
            break;
            
        default:
            break;
    }
    
    return myCategoryString;
}



-(NSInteger)getRecordingsForUpperLowerCategory {
    
    self.myUpperLowerCatergoryString = @"UpperLowerLetters";
    
    LetterRecording *theLetterRecording;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.myUpperLowerCatergoryString];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    
    //If there is a letter recording returned than it is assigned to the letterRecording property.
    if ([array count] >= 1) {
        
        NSLog(@"The array count is %d", [array count]);
        
        
        int i;
        int countOfLetterRecordingsArray = [array count];
        NSInteger count = 0;
        
        for (i = 0; i < countOfLetterRecordingsArray; i++) {
            
            theLetterRecording = [array objectAtIndex:i];
            
            if ([theLetterRecording.letterStrokes count] > 0) {
                
                count++;
            }
            
            self.myUpperLowerTotalRecordings = count;
            
        }
        
    }
    
    return self.myUpperLowerTotalRecordings;
}



-(NSInteger)getRecordingsForUpperCategory {
    
    self.myUpperCatergoryString = @"UpperLetters";
    
    LetterRecording *theLetterRecording;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.myUpperCatergoryString];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    
    //If there is a letter recording returned than it is assigned to the letterRecording property.
    if ([array count] >= 1) {
        
        int i;
        int countOfLetterRecordingsArray = [array count];
        NSInteger count = 0;
        
        for (i = 0; i < countOfLetterRecordingsArray; i++) {
            
            theLetterRecording = [array objectAtIndex:i];
            
            if ([theLetterRecording.letterStrokes count] > 0) {
                
                count++;
            }
            
            self.myUpperTotalRecordings = count;
            
        }
        
    }
    
    return self.myUpperTotalRecordings;
}


-(NSInteger)getRecordingsForLowerCategory {
    
    self.myLowerCatergoryString = @"LowerLetters";
    
    LetterRecording *theLetterRecording;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.myLowerCatergoryString];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    
    //If there is a letter recording returned than it is assigned to the letterRecording property.
    if ([array count] >= 1) {
        
        int i;
        int countOfLetterRecordingsArray = [array count];
        NSInteger count = 0;
        
        for (i = 0; i < countOfLetterRecordingsArray; i++) {
            
            theLetterRecording = [array objectAtIndex:i];
            
            if ([theLetterRecording.letterStrokes count] > 0) {
                
                count++;
            }
            
            self.myLowerTotalRecordings = count;
            
        }
        
    }
    
    return self.myLowerTotalRecordings;
}



-(NSInteger)getRecordingsForNumberCategory {
    
    self.myNumberCatergoryString = @"Numbers";
    
    LetterRecording *theLetterRecording;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.myNumberCatergoryString];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    
    //If there is a letter recording returned than it is assigned to the letterRecording property.
    if ([array count] >= 1) {
        
        int i;
        int countOfLetterRecordingsArray = [array count];
        NSInteger count = 0;
        
        for (i = 0; i < countOfLetterRecordingsArray; i++) {
            
            theLetterRecording = [array objectAtIndex:i];
            
            if ([theLetterRecording.letterStrokes count] > 0) {
                
                count++;
            }
            
            self.myNumberTotalRecordings = count;
            
        }
        
    }
    
    return self.myNumberTotalRecordings;
}



#pragma mark - Retrieving Letter Recording For Letter Label

-(NSArray *)getRecordingsForLetter:(NSString *)letter {
    
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"letterIdentifier == %@", (NSString *)letter];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    return array;
    
}

-(void)createLetterRecordingForLetter:(NSString *)letter {
    
    LetterRecording *newLetterRecording = [NSEntityDescription insertNewObjectForEntityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    
    self.letterRecording = newLetterRecording;
    self.letterRecording.letterIdentifier = (NSString *)letter;
    self.letterRecording.delayBetweenStrokes = [NSNumber numberWithFloat:1.0];
    //self.letterRecording.recordingDate =
    self.letterRecording.category = [self setMyRecordingCategory];

    //Now we commit the changes and save the context.
    NSError *error;
    [self.managedObjectContext save:&error];
    
}


-(NSArray *)getStrokePoints {
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"letterStroke" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *strokePointsArray = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (strokePointsArray == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    return strokePointsArray;
}


-(NSArray *)getStrokesForLetterRecording:(LetterRecording *)myLetterRecording {
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"LetterStroke" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"letterRecording == %@", (LetterRecording *)myLetterRecording];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *currentLetterStrokesArray = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (currentLetterStrokesArray == nil)
    {
        // Deal with error...
        NSLog(@"Returned a nil array - ERROR");
    }
    
    return currentLetterStrokesArray;
}



#pragma mark - Set Initial Letter View

-(void)initializeDefaultLetterView {
    
    NSLog(@"initializeDefaultLetterView fired zippy");
    
    orderOfStroke = 0;
    
    [NSFetchedResultsController deleteCacheWithName:@"Root"];
    self.fetchedResultsController = nil;
    NSLog(@"The currentButtonView is %i", self.currentButtonView);
    
    switch (self.currentButtonView) {
        case 0:
            self.letterLabeliPhone.text = @"Aa";
            break;
        case 1:
            self.letterLabeliPhone.text = @"A";
            break;
        case 2:
            self.letterLabeliPhone.text = @"a";
            break;
        case 3:
            self.letterLabeliPhone.text = @"0";
            break;
            
        default:
            break;
    }
    
    NSArray *array = [self getRecordingsForLetter:self.letterLabeliPhone.text];
    
    if ([array count] == 0) {
        [self createLetterRecordingForLetter:self.letterLabeliPhone.text];
        
//Zippy, this seems to work fine for the iPad, but the iPHone is something I'm looking at. It's calling
//it twice, here and again below in the log.
        [self.alphabetViewController initializingDisplayedLetter:self.letterLabeliPhone.text];
        self.playStrokesButton.hidden = YES;
        self.playStrokesLabel.hidden = YES;

    }
    
    if ([array count] >= 1) {
        
        [self.alphabetViewController initializingDisplayedLetter:self.letterLabeliPhone.text];
        self.letterRecording = [array objectAtIndex:0];
        
        if ([self.letterRecording.letterStrokes count] > 0) {
            
            self.playStrokesButton.hidden = NO;
            self.playStrokesLabel.hidden = NO;

            //[alphabetViewController.activatedButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [self.alphabetViewController buttonTextForSavedStrokes];
            
            //Added for v4.0
            //This is where the method goes to unhide the buttons. I probably tell the AppDelegate something here.
        }
        
        if ([self.letterRecording.letterStrokes count] == 0) {
            self.playStrokesButton.hidden = YES;
            self.playStrokesLabel.hidden = YES;

            //[alphabetViewController.activatedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.alphabetViewController buttonTextForNoStrokes];
            
            //Added for v4.0
            //This is where I put the method to hide all of the letter recording icons on the segmented control.
            //If there is a letter recording but no strokes to play back then the icons should be hidden.
        }
    }
}


#pragma mark - LetterOptionsCellDelegate

-(void)paperLinesButtonSwitched:(BOOL)stateOfSwitch {
    
    if (stateOfSwitch == 1) {
        self.guidlinesImage.hidden = NO;
    }
    
    else {
        self.guidlinesImage.hidden = YES;
    }
}

#pragma mark - VolumeSliderCellDelegate

-(void)globalSliderValueChanged:(float)sliderValue {
    
    self.globalVolumeValue = sliderValue;
    self.clickSoundiPhone.myAudioPlayer.volume = sliderValue;
    self.eraseSoundiPhone.myAudioPlayer.volume = sliderValue;
    
}

#pragma mark - StrokeVolumeSliderCellDelegate

-(void)strokeSliderValueChanged:(float)sliderValue {
    
    self.strokeVolumeValue = sliderValue;
    
}


#pragma mark - Erase Recordings Action Sheet

-(IBAction)showActionSheet:(id)sender {
    
    [self stopAnimationsiPhone];
    [self cancelPlayDataStrokes];
    
    UIActionSheet *eraseRecordingsQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Reset Recordings" otherButtonTitles:nil];
    
    eraseRecordingsQuery.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    //[eraseRecordingsQuery showFromToolbar:self.navigationController.toolbar];
    [eraseRecordingsQuery showFromBarButtonItem:sender animated:YES];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            //Destructive Button Clicked
            
//Zippy, this seems to work ok.
            if (guessingGameEnabled == YES) {
                [self cancelGuessGame:nil];
                NSLog(@"cancelGuessGame was just called");
            }
            
            self.playStrokesButton.hidden = YES;
            self.playStrokesLabel.hidden = YES;
            [chalkboardView erase];
            [self emptyDatabaseOfStrokes];
            [self initializeDefaultLetterView];
            break;
        case 1:
            //Cancel Button Clicked
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Empty Database of Saved Strokes

-(void)emptyDatabaseOfStrokes {
    
    [self.alphabetViewController resetButtonLabelTextColor];
    NSArray *totalStrokePointsArray = [self getStrokePoints];
    
    if ([totalStrokePointsArray count] >= 1) {
        int i;
        int countOfStrokePointsArray = [totalStrokePointsArray count];
        NSError *error;
        for (i = 0; i < countOfStrokePointsArray; i++) {
            
            [managedObjectContext deleteObject:[totalStrokePointsArray objectAtIndex:i]];
            [self.managedObjectContext save:&error];
        }
    }
}


#pragma mark - Erase Button

-(IBAction)eraseButtonPressed:(id)sender {
    [self cancelPlayDataStrokes];
    orderOfStroke = 0;
    [self resetLetterRecording];
	[eraseSoundiPhone play];
	[chalkboardView erase];
}

- (void)enableEraseButton:(NSNotification *)notification {
	self.eraseButton.enabled = YES;
}

- (void)disableEraseButton:(NSNotification *)notification {
	self.eraseButton.enabled = NO;
}


#pragma mark - AlphabetViewController Delegate Methods

#pragma mark - Button Style Changed

-(void)buttonStyleChanged {
    
    [chalkboardView erase];
    [self initializeDefaultLetterView];
    self.soundFileForButton = nil;
    self.replayGuessAnimationButton.hidden = YES;
    self.replayGuessAnimationLabel.hidden = YES;
    self.guessingGameButton.enabled = YES;
    self.cancelGuessGameButton.hidden = YES;
    self.cancelGuessGameLabel.hidden = YES;

    if (guessingGameEnabled == YES) {
        [self cancelGuessGame:nil];
        NSLog(@"cancelGuessGame was just called");
    }
}


-(void)changeLetteriPad:(NSString *)letter forButton:(NSInteger)buttonIdentifier {
    
    orderOfStroke = 0;
    [NSFetchedResultsController deleteCacheWithName:@"Root"];
    self.fetchedResultsController = nil;
    [self.chalkboardView erase];
    
    //NSLog(@"The center of the big letter is %f, %f", self.letterLabeliPhone.center.x, self.letterLabeliPhone.center.y);
    letterLabeliPhone.text = letter;
    self.soundFileForButton = nil;
    
	if (guessingGameEnabled == NO) {
        self.playAnimationsButton.enabled = YES;
        [self stopAnimationsiPhone];
        [self loadLetterRecordingForLetterLabel:self.letterLabeliPhone.text];
        [self sayLetteriPad];
	}
    
    if (guessingGameEnabled == YES) {
        
        if (integerIdentifier == buttonIdentifier) {
            
            [self rightAnswerAudio];
            [self loadLetterRecordingForLetterLabel:self.letterLabeliPhone.text];
            guessingGameEnabled = NO;
            self.guessingGameButton.enabled = YES;
            self.playAnimationsButton.enabled = YES;
            self.replayGuessAnimationButton.hidden = YES;
            self.replayGuessAnimationLabel.hidden = YES;
            self.cancelGuessGameButton.hidden = YES;
            self.cancelGuessGameLabel.hidden = YES;

        }
        
        else {
            [self wrongAnswerAudio];
            self.playAnimationsButton.enabled = NO;
		}
	}
}


#pragma mark -
#pragma mark Load Letter Recording


-(void)loadLetterRecordingForLetterLabel:(NSString *)letterLabel {
    
    
    NSArray *array = [self getRecordingsForLetter:letterLabel];
    
    //If there is a letter recording returned than it is assigned to the letterRecording property.
    if ([array count] >= 1) {
        self.letterRecording = [array objectAtIndex:0];
        
        if ([self.letterRecording.letterStrokes count] > 0) {
            
            self.playStrokesButton.hidden = NO;
            self.playStrokesLabel.hidden = NO;
            //[alphabetViewController.activatedButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [self.alphabetViewController buttonTextForSavedStrokes];
        }
        
        if ([self.letterRecording.letterStrokes count] == 0) {
            
            self.playStrokesButton.hidden = YES;
            self.playStrokesLabel.hidden = YES;
            //[alphabetViewController.activatedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.alphabetViewController buttonTextForNoStrokes];
        }
    }
    
    
    if ([array count] == 0) {
        self.playStrokesButton.hidden = YES;
        self.playStrokesLabel.hidden = YES;
        [self createLetterRecordingForLetter:letterLabel];
    }
}




#pragma mark - ChalkboardView Delegate Methods

-(void)resetTheStrokes {
    
    NSArray *currentLetterStrokesArray = [self getStrokesForLetterRecording:self.letterRecording];
    
    if ([currentLetterStrokesArray count] >= 1) {
        
        
        int i;
        int strokeArrayCount = [currentLetterStrokesArray count];
        for (i = 0; i < strokeArrayCount; i++) {
            
            [managedObjectContext deleteObject:[currentLetterStrokesArray objectAtIndex:i]];
            NSError *error;
            [self.managedObjectContext save:&error];
        }
    }
}


- (void)chalkboardView:(ChalkboardView *)chalkboardView firstTouchAtPoint:(CGPoint)point {

    if (guessingGameEnabled == NO) {
        if (orderOfStroke == 0) {
            [self cancelPlayDataStrokes];
            [self resetTheStrokes];
            self.playStrokesButton.hidden = NO;
            self.playStrokesLabel.hidden = NO;
            //[alphabetViewController.activatedButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [self.alphabetViewController buttonTextForSavedStrokes];
        }
        
        LetterStroke *newLetterStroke = [NSEntityDescription insertNewObjectForEntityForName:@"LetterStroke" inManagedObjectContext:self.managedObjectContext];
        self.myLetterStroke = newLetterStroke;
        
        [self.letterRecording addLetterStrokesObject:self.myLetterStroke];
        self.myLetterStroke.strokeIdentifier = [NSNumber numberWithInt:orderOfStroke];
        
        StrokePoint *newPoint = [NSEntityDescription insertNewObjectForEntityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
        self.myStrokePoint = newPoint;
        self.myStrokePoint.strokePointX = [NSNumber numberWithFloat:point.x];
        self.myStrokePoint.strokePointY = [NSNumber numberWithFloat:point.y];
        self.myStrokePoint.letter = self.letterLabeliPhone.text;
        self.myStrokePoint.strokeNumber = [NSNumber numberWithInt:orderOfStroke];
        [self.myLetterStroke addStrokePointsObject:self.myStrokePoint];
        
        NSError *error = nil;
        [self.managedObjectContext save:&error];
        
    }
}


- (void)chalkboardView:(ChalkboardView *)chalkboardView nextTouchAtPoint:(CGPoint)point {
        
    if (guessingGameEnabled == NO) {
        
        StrokePoint *newPoint = [NSEntityDescription insertNewObjectForEntityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
        self.myStrokePoint = newPoint;
        self.myStrokePoint.strokePointX = [NSNumber numberWithFloat:point.x];
        self.myStrokePoint.strokePointY = [NSNumber numberWithFloat:point.y];
        self.myStrokePoint.letter = self.letterLabeliPhone.text;
        self.myStrokePoint.strokeNumber = [NSNumber numberWithInt:orderOfStroke];
        [self.myLetterStroke addStrokePointsObject:self.myStrokePoint];
        
        NSError *error = nil;
        [self.managedObjectContext save:&error];
        
    }
}


- (void)chalkboardView:(ChalkboardView *)chalkboardView lastTouchAtPoint:(CGPoint)point {
        
    if (guessingGameEnabled == NO) {
        
        orderOfStroke++;
        
        StrokePoint *newPoint = [NSEntityDescription insertNewObjectForEntityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
        self.myStrokePoint = newPoint;
        self.myStrokePoint.strokePointX = [NSNumber numberWithFloat:point.x];
        self.myStrokePoint.strokePointY = [NSNumber numberWithFloat:point.y];
        self.myStrokePoint.letter = self.letterLabeliPhone.text;
        self.myStrokePoint.strokeNumber = [NSNumber numberWithInt:orderOfStroke];
        [self.myLetterStroke addStrokePointsObject:self.myStrokePoint];
        
        NSError *error = nil;
        [self.managedObjectContext save:&error];

    }
}



#pragma mark - Play Strokes Methods

-(IBAction)playDataStrokes:(id)sender {
    
    [self cancelPlayDataStrokes];
    
    [chalkboardView erase];
    orderOfStroke = 0;

    //Just added this for v4.0 to make the play strokes action use the yellow pen color.
    //I'm not using this at this point. If I do use it I will need to create a pointer in the brushViewController to this
    //chalkboardViewController and have a pointer here that holds the currently selected brush image's string. Then whenever
    //the playing of strokes is finished or cancelled for some reason I will use that string to set the pen color back
    //to the correct brush that was being used before playing back the strokes. I need to check with Cheryl and see if she
    //thinks this is a good idea or not first.
    /*
     [ChalkboardViewiPhone setMyBrushImageiPhone:[UIImage imageNamed:@"21SolidYellow"]];
     NSLog(@"Value of myBrushImage is after selecting it in the menu is %@\n", [ChalkboardViewiPhone getMyBrushImageiPhone]);
     //post notification so the two ChalkboardViewControllers can change the brush and, so the iPad one can dismiss the popover - j
     [[NSNotificationCenter defaultCenter] postNotificationName:@"brushHasBeenSelected" object:self];
     */    

    
    //The other thing that empties the cache and nil's the results controller is when a new letter is selected.
    [NSFetchedResultsController deleteCacheWithName:@"Root"];
    self.fetchedResultsController = nil;

        NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        
         //Replace this implementation with code to handle the error appropriately.
         
         //abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
       // NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
       // abort();
    }
    
    self.arrayOfStrokes = fetchedResultsController.fetchedObjects;
    
    [self startDataTimer];
    
}


-(void)cancelPlayDataStrokes {
    
    [myTimer invalidate];
}


#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    // Set up the fetched results controller if needed.
    if (fetchedResultsController == nil) {
        // Create the fetch request for the entity.
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        // Edit the entity name as appropriate.
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"LetterStroke" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSPredicate *myPredicate = [NSPredicate predicateWithFormat:@"letterRecording == %@", self.letterRecording];
        [fetchRequest setPredicate:myPredicate];
        
        // Edit the sort key as appropriate.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"strokeIdentifier" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
        aFetchedResultsController.delegate = self;
        self.fetchedResultsController = aFetchedResultsController;
        
    }
	
	return fetchedResultsController;
    
}


//Starts the timer activating myTimeFunction after 1 second.
-(void)startDataTimer {
    
    myStrokeCounterInteger = 0;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(myTimedDataFunction) userInfo:nil repeats:YES];
    
}

-(void)myTimedDataFunction {
    
    //Crashes if the array has no objects and this method is called. Have to have this in an if statement.
    if (self.arrayOfStrokes.count >= 1) {
        [self playbackLetterStroke:[arrayOfStrokes objectAtIndex:myStrokeCounterInteger]];
    }
    
    myStrokeCounterInteger++;
    if (myStrokeCounterInteger >= self.arrayOfStrokes.count) {
        [myTimer invalidate];
    }
    
}

//Added for v4.0
-(void)playbackLetterStroke:(LetterStroke *)letterStroke {
    
    NSLog(@"playbackLetterStroke fired.");
    CGRect	bounds = self.chalkboardView.bounds;
    NSUInteger myCount = letterStroke.strokePoints.count;
    NSUInteger i;
    
    for (i = 0; i < myCount - 1; ++i) {
        
        
        //NSManagedObjectContext *moc = [self managedObjectContext];
        NSEntityDescription *entityDescription = [NSEntityDescription
                                                  entityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDescription];
        
        // Set example predicate and sort orderings...
        //NSNumber *numberOfStroke = [NSNumber numberWithUnsignedInt:strokeIdentifier];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"letterStroke == %@", letterStroke];
        [request setPredicate:predicate];
        
        //Don't need a sortDescriptor for this fetch.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"strokeNumber" ascending:YES];
        [request setSortDescriptors:@[sortDescriptor]];
        
        NSError *error;
        NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
        if (array == nil) {
            // Deal with error...
            NSLog(@"Returned a nil array - ERROR");
        }
        
        StrokePoint *myFirstPoint = [array objectAtIndex:i];
        NSNumber *firstPointX = myFirstPoint.strokePointX;
        NSNumber *firstPointY = myFirstPoint.strokePointY;
        
        CGPoint firstPoint = CGPointMake([firstPointX floatValue], [firstPointY floatValue]);
        
        StrokePoint *mySecondPoint = [array objectAtIndex:(i +1)];
        NSNumber *secondPointX = mySecondPoint.strokePointX;
        NSNumber *secondPointY = mySecondPoint.strokePointY;
        
        CGPoint secondPoint = CGPointMake([secondPointX floatValue], [secondPointY floatValue]);
        
        firstPoint.y = bounds.size.height - firstPoint.y;
        secondPoint.y = bounds.size.height - secondPoint.y;
        
        [chalkboardView drawStrokeFromPoint:firstPoint toPoint:secondPoint];
    }
    
    [self resetLetterRecording];
}

//Added for v4.0
//When you change the letter it resets the strokes.
-(void)resetLetterRecording {
    
    NSLog(@"resetLetterRecording fired.");
    self.eraseButton.enabled = YES;
}


#pragma mark - Play Letter Animation and Sound

-(IBAction)playAnimation:(id)sender {
    
    switch (currentButtonView) {
        case UPPER_AND_LOWER_CASE_BUTTONS:
            [self playUpperLowerAnimation];
            break;
        case UPPER_CASE_BUTTONS:
            [self playUpperAnimation];
            break;
        case LOWER_CASE_BUTTONS:
            [self playLowerAnimation];
            break;
        case NUMBER_BUTTONS:
            [self playNumberAnimation];
            break;
            
        default:
            break;
    }
}

-(void)playUpperLowerAnimation {
    
	[clickSoundiPhone play];
    
    
    
	if ([letterLabeliPhone.text isEqualToString:@"Aa"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"Aa";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
        
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[aAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Bb"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"Bb";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		
		[bAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Cc"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"Cc";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[cAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Dd"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"Dd";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Ee"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"Ee";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone playAnimation];
	}
    
	if ([letterLabeliPhone.text isEqualToString:@"Ff"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"Ff";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Gg"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"Gg";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Hh"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"Hh";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Ii"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"Ii";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Jj"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"Jj";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Kk"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"Kk";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Ll"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"Ll";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Mm"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"Mm";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[mAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Nn"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"Nn";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Oo"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"Oo";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Pp"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"Pp";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Qq"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Qq";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Rr"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"Rr";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[rAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Ss"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"Ss";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone playAnimation];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Tt"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"Tt";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Uu"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"Uu";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Vv"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"Vv";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Ww"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"Ww";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [wAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Xx"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"Xx";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Yy"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Yy";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone playAnimation];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Zz"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Zz";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone playAnimation];
	}
	
    //Put the rest here.
}

-(void)playUpperAnimation {
    
    if ([letterLabeliPhone.text isEqualToString:@"A"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"A";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[aAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"B"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
                                                                                                                      bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"B";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[bAnimationViewControlleriPhone playAnimation];
	}
    
	if ([letterLabeliPhone.text isEqualToString:@"C"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"C";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[cAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"D"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"D";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"E"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"E";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone playAnimation];
	}
    
	if ([letterLabeliPhone.text isEqualToString:@"F"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"F";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"G"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"G";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"H"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"H";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"I"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"I";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"J"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"J";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"K"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"K";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"L"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"L";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"M"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"M";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[mAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"N"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"N";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"O"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"O";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"P"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"P";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Q"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"R"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"R";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[rAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"S"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"S";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone playAnimation];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"T"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"T";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"U"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"U";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"V"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"V";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"W"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"W";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [wAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"X"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"X";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Y"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone playAnimation];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"Z"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone playAnimation];
	}
    
    
    //The rest here.
}

-(void)playLowerAnimation {
    
    //These two next methods are for working this out.
    if ([letterLabeliPhone.text isEqualToString:@"a"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"a";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[aAnimationViewControlleriPhone showDotStrokeFour];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"b"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
                                                                                                                      bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"b";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[bAnimationViewControlleriPhone showDotStrokeThree];
	}
    
	if ([letterLabeliPhone.text isEqualToString:@"c"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"c";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[cAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"d"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"d";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"e"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"e";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone showDotStrokeFive];
	}
    
	if ([letterLabeliPhone.text isEqualToString:@"f"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"f";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone showDotStrokeFour];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"g"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"g";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"h"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"h";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone showDotStrokeFour];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"i"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"i";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone showDotStrokeFour];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"j"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"j";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"k"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"k";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"l"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"l";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"m"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"m";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[mAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"n"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"n";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"o"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"o";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"p"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"p";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"q"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"r"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"r";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[rAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"s"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"s";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"t"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"t";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"u"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"u";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"v"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"v";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"w"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"w";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [wAnimationViewControlleriPhone showDotStrokeTwo];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"x"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"x";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone showDotStrokeThree];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"y"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"z"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone showDotStrokeTwo];
	}
    
    
    //The rest here.
}

-(void)playNumberAnimation {
    
    [clickSoundiPhone play];
    
    
    
	if ([letterLabeliPhone.text isEqualToString:@"0"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZeroAnimationViewController *zeroAnimationControlleriPhone = [[ZeroAnimationViewController alloc] initWithNibName:@"ZeroAnimationViewController"
                                                                                                                               bundle:nil];
		self.zeroAnimationViewControlleriPhone = zeroAnimationControlleriPhone;
        self.zeroAnimationViewControlleriPhone.currentLetter = @"0";
        
        self.zeroAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:zeroAnimationViewControlleriPhone.view atIndex:6];
		
		[zeroAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.zeroAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zeroAnimationViewControlleriPhone playAnimation];
	}
	
	if ([letterLabeliPhone.text isEqualToString:@"1"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OneAnimationViewController *oneAnimationControlleriPhone = [[OneAnimationViewController alloc] initWithNibName:@"OneAnimationViewController"
                                                                                                                            bundle:nil];
		self.oneAnimationViewControlleriPhone = oneAnimationControlleriPhone;
        self.oneAnimationViewControlleriPhone.currentLetter = @"1";
        
        self.oneAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:oneAnimationViewControlleriPhone.view atIndex:6];
		
		[oneAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.oneAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oneAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"2"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TwoAnimationViewController *twoAnimationControlleriPhone = [[TwoAnimationViewController alloc] initWithNibName:@"TwoAnimationViewController"
                                                                                                                            bundle:nil];
		self.twoAnimationViewControlleriPhone = twoAnimationControlleriPhone;
        self.twoAnimationViewControlleriPhone.currentLetter = @"2";
        
        self.twoAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:twoAnimationViewControlleriPhone.view atIndex:6];
		
		[twoAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.twoAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[twoAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"3"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ThreeAnimationViewController *threeAnimationControlleriPhone = [[ThreeAnimationViewController alloc] initWithNibName:@"ThreeAnimationViewController"
                                                                                                                                  bundle:nil];
		self.threeAnimationViewControlleriPhone = threeAnimationControlleriPhone;
        self.threeAnimationViewControlleriPhone.currentLetter = @"3";
        
        self.threeAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:threeAnimationViewControlleriPhone.view atIndex:6];
		
		[threeAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.threeAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[threeAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"4"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FourAnimationViewController *fourAnimationControlleriPhone = [[FourAnimationViewController alloc] initWithNibName:@"FourAnimationViewController"
                                                                                                                               bundle:nil];
		self.fourAnimationViewControlleriPhone = fourAnimationControlleriPhone;
        self.fourAnimationViewControlleriPhone.currentLetter = @"4";
        
        self.fourAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fourAnimationViewControlleriPhone.view atIndex:6];
		
		[fourAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fourAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fourAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"5"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FiveAnimationViewController *fiveAnimationControlleriPhone = [[FiveAnimationViewController alloc] initWithNibName:@"FiveAnimationViewController"
                                                                                                                               bundle:nil];
		self.fiveAnimationViewControlleriPhone = fiveAnimationControlleriPhone;
        self.fiveAnimationViewControlleriPhone.currentLetter = @"5";
        
        self.fiveAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fiveAnimationViewControlleriPhone.view atIndex:6];
		
		[fiveAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fiveAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fiveAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"6"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SixAnimationViewController *sixAnimationControlleriPhone = [[SixAnimationViewController alloc] initWithNibName:@"SixAnimationViewController"
                                                                                                                            bundle:nil];
		self.sixAnimationViewControlleriPhone = sixAnimationControlleriPhone;
        self.sixAnimationViewControlleriPhone.currentLetter = @"6";
        
        self.sixAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sixAnimationViewControlleriPhone.view atIndex:6];
		
		[sixAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sixAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sixAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"7"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SevenAnimationViewController *sevenAnimationControlleriPhone = [[SevenAnimationViewController alloc] initWithNibName:@"SevenAnimationViewController"
                                                                                                                                  bundle:nil];
		self.sevenAnimationViewControlleriPhone = sevenAnimationControlleriPhone;
        self.sevenAnimationViewControlleriPhone.currentLetter = @"7";
        
        self.sevenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sevenAnimationViewControlleriPhone.view atIndex:6];
		
		[sevenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sevenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sevenAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"8"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EightAnimationViewController *eightAnimationControlleriPhone = [[EightAnimationViewController alloc] initWithNibName:@"EightAnimationViewController"
                                                                                                                                  bundle:nil];
		self.eightAnimationViewControlleriPhone = eightAnimationControlleriPhone;
        self.eightAnimationViewControlleriPhone.currentLetter = @"8";
        
        self.eightAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:eightAnimationViewControlleriPhone.view atIndex:6];
		
		[eightAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.eightAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eightAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"9"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NineAnimationViewController *nineAnimationControlleriPhone = [[NineAnimationViewController alloc] initWithNibName:@"NineAnimationViewController"
                                                                                                                               bundle:nil];
		self.nineAnimationViewControlleriPhone = nineAnimationControlleriPhone;
        self.nineAnimationViewControlleriPhone.currentLetter = @"9";
        
        self.nineAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:nineAnimationViewControlleriPhone.view atIndex:6];
		
		[nineAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.nineAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nineAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nineAnimationViewControlleriPhone playAnimation];
	}
    
    if ([letterLabeliPhone.text isEqualToString:@"10"]) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TenAnimationViewController *tenAnimationControlleriPhone = [[TenAnimationViewController alloc] initWithNibName:@"TenAnimationViewController"
                                                                                                                            bundle:nil];
		self.tenAnimationViewControlleriPhone = tenAnimationControlleriPhone;
        self.tenAnimationViewControlleriPhone.currentLetter = @"10";
        
        self.tenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:tenAnimationViewControlleriPhone.view atIndex:6];
		
		[tenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.tenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tenAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tenAnimationViewControlleriPhone playAnimation];
	}
    
}

#pragma mark - Play Letter Animation and Sound

-(void)sayLetteriPad {
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    //Check to see if soundForButton is nil. Every time a letter button is pressed we set it to nil again.
    if ([letterLabeliPhone.text hasSuffix:@"a"] || [letterLabeliPhone.text hasPrefix:@"A"]) {
		NSLog(@"Yes, the button has the suffix a or prefix A");
        
        NSLog(@"soundForButton was nil");
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayA" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];
        
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"b"] || [letterLabeliPhone.text hasPrefix:@"B"]) {
		NSLog(@"Yes, the button has the suffix b or prefix B");
        
        NSLog(@"soundForButton was nil");
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayB" ofType:@"caf"]];        
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];
        
	}
	
    if ([letterLabeliPhone.text hasSuffix:@"c"] || [letterLabeliPhone.text hasPrefix:@"C"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayC" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"d"] || [letterLabeliPhone.text hasPrefix:@"D"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayD" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"e"] || [letterLabeliPhone.text hasPrefix:@"E"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayE" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"f"] || [letterLabeliPhone.text hasPrefix:@"F"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayF" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"g"] || [letterLabeliPhone.text hasPrefix:@"G"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayG" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"h"] || [letterLabeliPhone.text hasPrefix:@"H"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayH" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"i"] || [letterLabeliPhone.text hasPrefix:@"I"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayI" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"j"] || [letterLabeliPhone.text hasPrefix:@"J"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayJ" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"k"] || [letterLabeliPhone.text hasPrefix:@"K"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayK" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"l"] || [letterLabeliPhone.text hasPrefix:@"L"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayL" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"m"] || [letterLabeliPhone.text hasPrefix:@"M"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayM" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"n"] || [letterLabeliPhone.text hasPrefix:@"N"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayN" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"o"] || [letterLabeliPhone.text hasPrefix:@"O"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayO" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"p"] || [letterLabeliPhone.text hasPrefix:@"P"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayP" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"q"] || [letterLabeliPhone.text hasPrefix:@"Q"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayQ" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"r"] || [letterLabeliPhone.text hasPrefix:@"R"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayR" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"s"] || [letterLabeliPhone.text hasPrefix:@"S"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayS" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"t"] || [letterLabeliPhone.text hasPrefix:@"T"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayT" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"u"] || [letterLabeliPhone.text hasPrefix:@"U"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayU" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"v"] || [letterLabeliPhone.text hasPrefix:@"V"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayV" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"w"] || [letterLabeliPhone.text hasPrefix:@"W"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayW" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"x"] || [letterLabeliPhone.text hasPrefix:@"X"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayX" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"y"] || [letterLabeliPhone.text hasPrefix:@"Y"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayY" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"z"] || [letterLabeliPhone.text hasPrefix:@"Z"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"SayZ" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"0"] || [letterLabeliPhone.text hasPrefix:@"0"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say0" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"1"] || [letterLabeliPhone.text hasPrefix:@"1"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say1" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"2"] || [letterLabeliPhone.text hasPrefix:@"2"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say2" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"3"] || [letterLabeliPhone.text hasPrefix:@"3"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say3" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"4"] || [letterLabeliPhone.text hasPrefix:@"4"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say4" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"5"] || [letterLabeliPhone.text hasPrefix:@"5"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say5" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"6"] || [letterLabeliPhone.text hasPrefix:@"6"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say6" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"7"] || [letterLabeliPhone.text hasPrefix:@"7"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say7" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"8"] || [letterLabeliPhone.text hasPrefix:@"8"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say8" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"9"] || [letterLabeliPhone.text hasPrefix:@"9"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say9" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    if ([letterLabeliPhone.text hasSuffix:@"10"] || [letterLabeliPhone.text hasPrefix:@"10"]) {
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"Say10" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        [soundFileForButton play];
	}
    
    //Put the rest here.
}

#pragma mark - Start Guessing Game

//This button starts the guess game and fires one of four methods based on which button styles are displayed.
-(IBAction)guessGameButtonPressed:(id)sender {
    
    [self.chalkboardView erase];
    self.cancelGuessGameButton.hidden = NO;
    self.cancelGuessGameLabel.hidden = NO;
    self.playStrokesButton.hidden = YES;
    self.playStrokesLabel.hidden = YES;

    NSLog(@"The currentButtonView integer is %i", currentButtonView);
    
    switch (currentButtonView) {
        case UPPER_AND_LOWER_CASE_BUTTONS:
            [self playUpperLowerRandomAnimation];
            break;
        case UPPER_CASE_BUTTONS:
            [self playUpperRandomAnimation];
            break;
        case LOWER_CASE_BUTTONS:
            [self playLowerRandomAnimation];
            break;
        case NUMBER_BUTTONS:
            [self playNumberRandomAnimation];
            break;
            
        default:
            break;
    }
}

#pragma mark - Cancel Guessing Game

-(IBAction)cancelGuessGame:(id)sender {
    
    //Added for guess game label.
    self.playGuessGameLabel.alpha = 0.0;
    
    [self.chalkboardView erase];
    [self stopAnimationsiPhone];
    guessingGameEnabled = NO;
    self.replayGuessAnimationButton.hidden = YES;
    self.replayGuessAnimationLabel.hidden = YES;
    self.guessingGameButton.enabled = YES;
    self.playAnimationsButton.enabled = YES;
    self.cancelGuessGameButton.hidden = YES;
    self.cancelGuessGameLabel.hidden = YES;
    [self initializeDefaultLetterView];
}

#pragma mark - Guessing Game Animation

-(void)playUpperLowerRandomAnimation {
	
    NSLog(@"playUpperLowerRandomAnimation fired");
    
    [self startGuessGameAudio];
    
	guessingGameEnabled = YES;
	self.letterLabeliPhone.text = @"";
	self.playAnimationsButton.enabled = NO;
	self.guessingGameButton.enabled = NO;
	self.replayGuessAnimationButton.hidden = NO;
    self.replayGuessAnimationLabel.hidden = NO;
	//Activate the method that plays the audio declaring the start of the guess game.
	
	//Assign a random integer from 0 to whatever the number of animation view controllers there are (0 to 25 = A to Z).
	srandom(time(NULL));
	integerIdentifier = random() % 25;
	
	//Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == UPPER_AND_LOWER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"Aa";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationViewControlleriPhone.view atIndex:6];
		//[self.view insertSubview:aAnimationViewControlleriPhone.view aboveSubview:self.letterLabeliPhone];
        
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
		//NSLog("The index of aAnimationViewController is %i", [[self.view superview] indexOfAccessibilityElement:self.aAnimationViewControlleriPhone.view]);
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[aAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Aa";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"Bb";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[bAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Bb";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"Cc";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[cAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Cc";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"Dd";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Dd";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"Ee";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ee";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"Ff";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ff";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"Gg";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Gg";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"Hh";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Hh";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"Ii";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ii";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"Jj";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;

		[jAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Jj";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"Kk";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;

		[kAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Kk";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"Ll";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ll";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
        MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"Mm";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[mAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Mm";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"Nn";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Nn";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"Oo";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Oo";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"Pp";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;

		[pAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Pp";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Qq";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Qq";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"Rr";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[rAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Rr";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"Ss";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ss";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"Tt";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Tt";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"Uu";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;

		[uAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Uu";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"Vv";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Vv";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"Ww";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[wAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Ww";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"Xx";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Xx";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Yy";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Yy";
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Zz";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Zz";
	}
	
	//put the rest here.
}

-(void)playUpperRandomAnimation {
    
    NSLog(@"playUpperRandomAnimation fired");
    
    [self startGuessGameAudio];
    
	guessingGameEnabled = YES;
	self.letterLabeliPhone.text = @"";
	self.playAnimationsButton.enabled = NO;
	self.guessingGameButton.enabled = NO;
	self.replayGuessAnimationButton.hidden = NO;
    self.replayGuessAnimationLabel.hidden = NO;
	//Activate the method that plays the audio declaring the start of the guess game.
    
    //I don't think I need the time(NULL) function.
    //srandom(time(NULL));
	//Assign a random integer from 26 to 51.    
    integerIdentifier = 26 + arc4random() % (51+1-26);
    
	//Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == UPPER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"A";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[aAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"A";
        
	}
	
	if (integerIdentifier == UPPER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"B";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
        [bAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"B";
	}
	
	if (integerIdentifier == UPPER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"C";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[cAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"C";
	}
	
	if (integerIdentifier == UPPER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"D";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"D";
	}
	
	if (integerIdentifier == UPPER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"E";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
		//These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"E";
	}
	
	if (integerIdentifier == UPPER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"F";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"F";
	}
	
	if (integerIdentifier == UPPER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"G";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"G";
	}
	
	if (integerIdentifier == UPPER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"H";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone playAnimation];
        
		self.correctAnswer = @"H";
	}
	
	if (integerIdentifier == UPPER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"I";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"I";
	}
	
	if (integerIdentifier == UPPER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"J";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"J";
	}
	
	if (integerIdentifier == UPPER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"K";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"K";
	}
	
	if (integerIdentifier == UPPER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"L";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"L";
	}
	
	if (integerIdentifier == UPPER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
        MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"M";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [mAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"M";
	}
	
	if (integerIdentifier == UPPER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"N";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"N";
	}
	
	if (integerIdentifier == UPPER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"O";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"O";
	}
	
	if (integerIdentifier == UPPER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"P";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"P";
	}
	
	if (integerIdentifier == UPPER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Q";
	}
	
	if (integerIdentifier == UPPER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"R";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [rAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"R";
	}
	
	if (integerIdentifier == UPPER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"S";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"S";
	}
	
	if (integerIdentifier == UPPER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"T";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"T";
	}
	
	if (integerIdentifier == UPPER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"U";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"U";
	}
	
	if (integerIdentifier == UPPER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"V";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"V";
	}
	
	if (integerIdentifier == UPPER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"W";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[wAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"W";
	}
	
	if (integerIdentifier == UPPER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"X";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"X";
	}
	
	if (integerIdentifier == UPPER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Y";
	}
	
	if (integerIdentifier == UPPER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone playAnimation];
		
		self.correctAnswer = @"Z";
	}
	
	//put the rest here.
}

-(void)playLowerRandomAnimation {
    
    NSLog(@"playLowerRandomAnimation fired");
    
    [self startGuessGameAudio];
    
	guessingGameEnabled = YES;
	self.letterLabeliPhone.text = @"";
	self.playAnimationsButton.enabled = NO;
	self.guessingGameButton.enabled = NO;
	self.replayGuessAnimationButton.hidden = NO;
    self.replayGuessAnimationLabel.hidden = NO;
	//Activate the method that plays the audio declaring the start of the guess game.
	
    //I don't think I need the time(NULL) function.
    //srandom(time(NULL));
	//Assign a random integer from 52 to 77.    
    integerIdentifier = 52 + arc4random() % (77+1-52);
    NSLog(@"The integerIdentifier for the guess game is %i", integerIdentifier);
    
	//Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == LOWER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"a";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[aAnimationViewControlleriPhone showDotStrokeFour];
		
		self.correctAnswer = @"a";
        
	}
	
	if (integerIdentifier == LOWER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"b";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
        [bAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"b";
	}
	
	if (integerIdentifier == LOWER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"c";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[cAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"c";
	}
	
	if (integerIdentifier == LOWER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"d";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"d";
	}
	
	if (integerIdentifier == LOWER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"e";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
		//These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone showDotStrokeFive];
		
		self.correctAnswer = @"e";
	}
	
	if (integerIdentifier == LOWER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"f";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone showDotStrokeFour];
		
		self.correctAnswer = @"f";
	}
	
	if (integerIdentifier == LOWER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"g";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"g";
	}
	
	if (integerIdentifier == LOWER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"h";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone showDotStrokeFour];
		
		self.correctAnswer = @"h";
	}
	
	if (integerIdentifier == LOWER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"i";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone showDotStrokeFour];
		
		self.correctAnswer = @"i";
	}
	
	if (integerIdentifier == LOWER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"j";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"j";
	}
	
	if (integerIdentifier == LOWER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"k";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"k";
	}
	
	if (integerIdentifier == LOWER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"l";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"l";
	}
	
	if (integerIdentifier == LOWER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
        MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"m";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [mAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"m";
	}
	
	if (integerIdentifier == LOWER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"n";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"n";
	}
	
	if (integerIdentifier == LOWER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"o";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"o";
	}
	
	if (integerIdentifier == LOWER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"p";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"p";
	}
	
	if (integerIdentifier == LOWER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"q";
	}
	
	if (integerIdentifier == LOWER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"r";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [rAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"r";
	}
	
	if (integerIdentifier == LOWER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"s";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"s";
	}
	
	if (integerIdentifier == LOWER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"t";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"t";
	}
	
	if (integerIdentifier == LOWER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"u";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"u";
	}
	
	if (integerIdentifier == LOWER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"v";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"v";
	}
	
	if (integerIdentifier == LOWER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"w";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[wAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"w";
	}
	
	if (integerIdentifier == LOWER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"x";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"x";
	}
	
	if (integerIdentifier == LOWER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone showDotStrokeThree];
		
		self.correctAnswer = @"y";
	}
	
	if (integerIdentifier == LOWER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone showDotStrokeTwo];
		
		self.correctAnswer = @"z";
	}
	
	//put the rest here.
    
}

-(void)playNumberRandomAnimation {
    
    NSLog(@"playNumberRandomAnimation fired");
    
    [self startGuessGameAudio];
    
	guessingGameEnabled = YES;
	self.letterLabeliPhone.text = @"";
	self.playAnimationsButton.enabled = NO;
	self.guessingGameButton.enabled = NO;
	self.replayGuessAnimationButton.hidden = NO;
    self.replayGuessAnimationLabel.hidden = NO;
	//Activate the method that plays the audio declaring the start of the guess game.
    
    //I don't think I need the time(NULL) function.
    //srandom(time(NULL));
	//Assign a random integer from 78 to 88.    
    integerIdentifier = 78 + arc4random() % (88+1-78);
    
	if (integerIdentifier == NUMBER_0) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZeroAnimationViewController *zeroAnimationControlleriPhone = [[ZeroAnimationViewController alloc] initWithNibName:@"ZeroAnimationViewController"
                                                                                                                               bundle:nil];
		self.zeroAnimationViewControlleriPhone = zeroAnimationControlleriPhone;
        self.zeroAnimationViewControlleriPhone.currentLetter = @"0";
        
        self.zeroAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:zeroAnimationViewControlleriPhone.view atIndex:6];
		
		[zeroAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.zeroAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zeroAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == NUMBER_1) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OneAnimationViewController *oneAnimationControlleriPhone = [[OneAnimationViewController alloc] initWithNibName:@"OneAnimationViewController"
                                                                                                                            bundle:nil];
		self.oneAnimationViewControlleriPhone = oneAnimationControlleriPhone;
        self.oneAnimationViewControlleriPhone.currentLetter = @"1";
        
        self.oneAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:oneAnimationViewControlleriPhone.view atIndex:6];
		
		[oneAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.oneAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oneAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_2) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TwoAnimationViewController *twoAnimationControlleriPhone = [[TwoAnimationViewController alloc] initWithNibName:@"TwoAnimationViewController"
                                                                                                                            bundle:nil];
		self.twoAnimationViewControlleriPhone = twoAnimationControlleriPhone;
        self.twoAnimationViewControlleriPhone.currentLetter = @"2";
        
        self.twoAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:twoAnimationViewControlleriPhone.view atIndex:6];
		
		[twoAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.twoAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[twoAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_3) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ThreeAnimationViewController *threeAnimationControlleriPhone = [[ThreeAnimationViewController alloc] initWithNibName:@"ThreeAnimationViewController"
                                                                                                                                  bundle:nil];
		self.threeAnimationViewControlleriPhone = threeAnimationControlleriPhone;
        self.threeAnimationViewControlleriPhone.currentLetter = @"3";
        
        self.threeAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:threeAnimationViewControlleriPhone.view atIndex:6];
		
		[threeAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.threeAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[threeAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_4) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FourAnimationViewController *fourAnimationControlleriPhone = [[FourAnimationViewController alloc] initWithNibName:@"FourAnimationViewController"
                                                                                                                               bundle:nil];
		self.fourAnimationViewControlleriPhone = fourAnimationControlleriPhone;
        self.fourAnimationViewControlleriPhone.currentLetter = @"4";
        
        self.fourAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fourAnimationViewControlleriPhone.view atIndex:6];
		
		[fourAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fourAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fourAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_5) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FiveAnimationViewController *fiveAnimationControlleriPhone = [[FiveAnimationViewController alloc] initWithNibName:@"FiveAnimationViewController"
                                                                                                                               bundle:nil];
		self.fiveAnimationViewControlleriPhone = fiveAnimationControlleriPhone;
        self.fiveAnimationViewControlleriPhone.currentLetter = @"5";
        
        self.fiveAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fiveAnimationViewControlleriPhone.view atIndex:6];
		
		[fiveAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fiveAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fiveAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_6) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SixAnimationViewController *sixAnimationControlleriPhone = [[SixAnimationViewController alloc] initWithNibName:@"SixAnimationViewController"
                                                                                                                            bundle:nil];
		self.sixAnimationViewControlleriPhone = sixAnimationControlleriPhone;
        self.sixAnimationViewControlleriPhone.currentLetter = @"6";
        
        self.sixAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sixAnimationViewControlleriPhone.view atIndex:6];
		
		[sixAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sixAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sixAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_7) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SevenAnimationViewController *sevenAnimationControlleriPhone = [[SevenAnimationViewController alloc] initWithNibName:@"SevenAnimationViewController"
                                                                                                                                  bundle:nil];
		self.sevenAnimationViewControlleriPhone = sevenAnimationControlleriPhone;
        self.sevenAnimationViewControlleriPhone.currentLetter = @"7";
        
        self.sevenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sevenAnimationViewControlleriPhone.view atIndex:6];
		
		[sevenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sevenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sevenAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_8) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EightAnimationViewController *eightAnimationControlleriPhone = [[EightAnimationViewController alloc] initWithNibName:@"EightAnimationViewController"
                                                                                                                                  bundle:nil];
		self.eightAnimationViewControlleriPhone = eightAnimationControlleriPhone;
        self.eightAnimationViewControlleriPhone.currentLetter = @"8";
        
        self.eightAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:eightAnimationViewControlleriPhone.view atIndex:6];
		
		[eightAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.eightAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eightAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_9) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NineAnimationViewController *nineAnimationControlleriPhone = [[NineAnimationViewController alloc] initWithNibName:@"NineAnimationViewController"
                                                                                                                               bundle:nil];
		self.nineAnimationViewControlleriPhone = nineAnimationControlleriPhone;
        self.nineAnimationViewControlleriPhone.currentLetter = @"9";
        
        self.nineAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:nineAnimationViewControlleriPhone.view atIndex:6];
		
		[nineAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.nineAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nineAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nineAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_10) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TenAnimationViewController *tenAnimationControlleriPhone = [[TenAnimationViewController alloc] initWithNibName:@"TenAnimationViewController"
                                                                                                                            bundle:nil];
		self.tenAnimationViewControlleriPhone = tenAnimationControlleriPhone;
        self.tenAnimationViewControlleriPhone.currentLetter = @"10";
        
        self.tenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:tenAnimationViewControlleriPhone.view atIndex:6];
		
		[tenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.tenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tenAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tenAnimationViewControlleriPhone playAnimation];
	}
    
}

#pragma mark - Replay Guessing Game Animation

-(IBAction)replayGuessAnimation:(id)sender {
	
	switch (currentButtonView) {
        case UPPER_AND_LOWER_CASE_BUTTONS:
            [self replayUpperLowerRandomAnimation];
            break;
        case UPPER_CASE_BUTTONS:
            [self replayUpperRandomAnimation];
            break;
        case LOWER_CASE_BUTTONS:
            [self replayLowerRandomAnimation];
            break;
        case NUMBER_BUTTONS:
            [self replayNumberRandomAnimation];
            break;
            
        default:
            break;
    }
    
}



-(void)replayUpperLowerRandomAnimation {
    
    [clickSoundiPhone play];
    self.letterLabeliPhone.text = @"";
	
	//Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == UPPER_AND_LOWER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"Aa";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[aAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"Bb";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		
		[bAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"Cc";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[cAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"Dd";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[dAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"Ee";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[eAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == UPPER_AND_LOWER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"Ff";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[fAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"Gg";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[gAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"Hh";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[hAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"Ii";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[iAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"Jj";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[jAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"Kk";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[kAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"Ll";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[lAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"Mm";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[mAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"Nn";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[nAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"Oo";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[oAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"Pp";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[pAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Qq";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[qAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"Rr";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[rAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"Ss";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[sAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"Tt";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[tAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"Uu";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[uAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"Vv";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[vAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"Ww";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[wAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"Xx";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[xAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Yy";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[yAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_AND_LOWER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Zz";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
		[zAnimationViewControlleriPhone playAnimation];
	}
	
    //Put the rest here.
    
}

-(void)replayUpperRandomAnimation {
    
    [clickSoundiPhone play];
    self.letterLabeliPhone.text = @"";
	
	//Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == UPPER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"A";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
		[aAnimationViewControlleriPhone playAnimation];
        
	}
    
    if (integerIdentifier == UPPER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"B";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
        [bAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"C";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[cAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"D";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"E";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
		//These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone playAnimation];
        
    }
	
	if (integerIdentifier == UPPER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"F";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"G";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"H";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone playAnimation];
        
	}
	
	if (integerIdentifier == UPPER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"I";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"J";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"K";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone playAnimation];
		
    }
	
	if (integerIdentifier == UPPER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"L";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
        MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"M";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [mAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"N";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"O";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"P";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"Q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"R";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [rAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"S";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"T";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"U";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"V";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"W";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[wAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"X";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"Y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone playAnimation];
		
	}
	
	if (integerIdentifier == UPPER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"Z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone playAnimation];
		
	}
	
	//put the rest here.
    
    
}

-(void)replayLowerRandomAnimation {
    
    [clickSoundiPhone play];
    self.letterLabeliPhone.text = @"";
    
    //Each possible random number integer corresponds to a letter animation A thru Z.
	if (integerIdentifier == LOWER_A) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		AAnimationViewController *aAnimationControlleriPhone = [[AAnimationViewController alloc] initWithNibName:@"AAnimationViewController"
                                                                                                                      bundle:nil];
		self.aAnimationViewControlleriPhone = aAnimationControlleriPhone;
        self.aAnimationViewControlleriPhone.currentLetter = @"a";
        
        self.aAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:aAnimationControlleriPhone.view atIndex:6];
		
		[aAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.aAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.aAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[aAnimationViewControlleriPhone showDotStrokeFour];
        
	}
	
	if (integerIdentifier == LOWER_B) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		BAnimationViewController *bAnimationControlleriPhone = [[BAnimationViewController alloc] initWithNibName:@"BAnimationViewController"
																													  bundle:nil];
		self.bAnimationViewControlleriPhone = bAnimationControlleriPhone;
        self.bAnimationViewControlleriPhone.currentLetter = @"b";
        
        self.bAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:bAnimationControlleriPhone.view atIndex:6];
		
		[bAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.bAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.bAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
		
        [bAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_C) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		CAnimationViewController *cAnimationControlleriPhone = [[CAnimationViewController alloc] initWithNibName:@"CAnimationViewController"
																													  bundle:nil];
		self.cAnimationViewControlleriPhone = cAnimationControlleriPhone;
        self.cAnimationViewControlleriPhone.currentLetter = @"c";
        
        self.cAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:cAnimationControlleriPhone.view atIndex:6];
		
		[cAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.cAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.cAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[cAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_D) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		DAnimationViewController *dAnimationControlleriPhone = [[DAnimationViewController alloc] initWithNibName:@"DAnimationViewController"
																													  bundle:nil];
		self.dAnimationViewControlleriPhone = dAnimationControlleriPhone;
        self.dAnimationViewControlleriPhone.currentLetter = @"d";
        
        self.dAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:dAnimationControlleriPhone.view atIndex:6];
		
		[dAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.dAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.dAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[dAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_E) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EAnimationViewController *eAnimationControlleriPhone = [[EAnimationViewController alloc] initWithNibName:@"EAnimationViewController"
																													  bundle:nil];
		self.eAnimationViewControlleriPhone = eAnimationControlleriPhone;
        self.eAnimationViewControlleriPhone.currentLetter = @"e";
        
        self.eAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:eAnimationControlleriPhone.view atIndex:6];
		
		[eAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
		//These are for changing the volume of the strokes.
        self.eAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.eAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eAnimationViewControlleriPhone showDotStrokeFive];
		
	}
	
	if (integerIdentifier == LOWER_F) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FAnimationViewController *fAnimationControlleriPhone = [[FAnimationViewController alloc] initWithNibName:@"FAnimationViewController"
																													  bundle:nil];
		self.fAnimationViewControlleriPhone = fAnimationControlleriPhone;
        self.fAnimationViewControlleriPhone.currentLetter = @"f";
        
        self.fAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:fAnimationControlleriPhone.view atIndex:6];
		
		[fAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.fAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fAnimationViewControlleriPhone showDotStrokeFour];
		
	}
	
	if (integerIdentifier == LOWER_G) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		GAnimationViewController *gAnimationControlleriPhone = [[GAnimationViewController alloc] initWithNibName:@"GAnimationViewController"
																													  bundle:nil];
		self.gAnimationViewControlleriPhone = gAnimationControlleriPhone;
        self.gAnimationViewControlleriPhone.currentLetter = @"g";
        
        self.gAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:gAnimationControlleriPhone.view atIndex:6];
		
		[gAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.gAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.gAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[gAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_H) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		HAnimationViewController *hAnimationControlleriPhone = [[HAnimationViewController alloc] initWithNibName:@"HAnimationViewController"
																													  bundle:nil];
		self.hAnimationViewControlleriPhone = hAnimationControlleriPhone;
        self.hAnimationViewControlleriPhone.currentLetter = @"h";
        
        self.hAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:hAnimationControlleriPhone.view atIndex:6];
		
		[hAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.hAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.hAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[hAnimationViewControlleriPhone showDotStrokeFour];
		
	}
	
	if (integerIdentifier == LOWER_I) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		IAnimationViewController *iAnimationControlleriPhone = [[IAnimationViewController alloc] initWithNibName:@"IAnimationViewController"
																													  bundle:nil];
		self.iAnimationViewControlleriPhone = iAnimationControlleriPhone;
        self.iAnimationViewControlleriPhone.currentLetter = @"i";
        
        self.iAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:iAnimationControlleriPhone.view atIndex:6];
		
		[iAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.iAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.iAnimationViewControlleriPhone.stroke5Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[iAnimationViewControlleriPhone showDotStrokeFour];
		
	}
	
	if (integerIdentifier == LOWER_J) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		JAnimationViewController *jAnimationControlleriPhone = [[JAnimationViewController alloc] initWithNibName:@"JAnimationViewController"
																													  bundle:nil];
		self.jAnimationViewControlleriPhone = jAnimationControlleriPhone;
        self.jAnimationViewControlleriPhone.currentLetter = @"j";
        
        self.jAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:jAnimationControlleriPhone.view atIndex:6];
		
		[jAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.jAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.jAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[jAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_K) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		KAnimationViewController *kAnimationControlleriPhone = [[KAnimationViewController alloc] initWithNibName:@"KAnimationViewController"
																													  bundle:nil];
		self.kAnimationViewControlleriPhone = kAnimationControlleriPhone;
        self.kAnimationViewControlleriPhone.currentLetter = @"k";
        
        self.kAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:kAnimationControlleriPhone.view atIndex:6];
		
		[kAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.kAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.kAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[kAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_L) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		LAnimationViewController *lAnimationControlleriPhone = [[LAnimationViewController alloc] initWithNibName:@"LAnimationViewController"
																													  bundle:nil];
		self.lAnimationViewControlleriPhone = lAnimationControlleriPhone;
        self.lAnimationViewControlleriPhone.currentLetter = @"l";
        
        self.lAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:lAnimationControlleriPhone.view atIndex:6];
		
		[lAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.lAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.lAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[lAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_M) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
        MAnimationViewController *mAnimationControlleriPhone = [[MAnimationViewController alloc] initWithNibName:@"MAnimationViewController"
																													  bundle:nil];
		self.mAnimationViewControlleriPhone = mAnimationControlleriPhone;
        self.mAnimationViewControlleriPhone.currentLetter = @"m";
        
        self.mAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:mAnimationControlleriPhone.view atIndex:6];
		
		[mAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.mAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.mAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [mAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_N) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		NAnimationViewController *nAnimationControlleriPhone = [[NAnimationViewController alloc] initWithNibName:@"NAnimationViewController"
																													  bundle:nil];
		self.nAnimationViewControlleriPhone = nAnimationControlleriPhone;
        self.nAnimationViewControlleriPhone.currentLetter = @"n";
        
        self.nAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:nAnimationControlleriPhone.view atIndex:6];
		
		[nAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.nAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_O) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		OAnimationViewController *oAnimationControlleriPhone = [[OAnimationViewController alloc] initWithNibName:@"OAnimationViewController"
																													  bundle:nil];
		self.oAnimationViewControlleriPhone = oAnimationControlleriPhone;
        self.oAnimationViewControlleriPhone.currentLetter = @"o";
        
        self.oAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:oAnimationControlleriPhone.view atIndex:6];
		
		[oAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.oAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.oAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_P) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		PAnimationViewController *pAnimationControlleriPhone = [[PAnimationViewController alloc] initWithNibName:@"PAnimationViewController"
																													  bundle:nil];
		self.pAnimationViewControlleriPhone = pAnimationControlleriPhone;
        self.pAnimationViewControlleriPhone.currentLetter = @"p";
        
        self.pAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:pAnimationControlleriPhone.view atIndex:6];
		
		[pAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.pAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.pAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[pAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_Q) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		QAnimationViewController *qAnimationControlleriPhone = [[QAnimationViewController alloc] initWithNibName:@"QAnimationViewController"
																													  bundle:nil];
		self.qAnimationViewControlleriPhone = qAnimationControlleriPhone;
        self.qAnimationViewControlleriPhone.currentLetter = @"q";
        
        self.qAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:qAnimationControlleriPhone.view atIndex:6];
		
		[qAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.qAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.qAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[qAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_R) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		RAnimationViewController *rAnimationControlleriPhone = [[RAnimationViewController alloc] initWithNibName:@"RAnimationViewController"
																													  bundle:nil];
		self.rAnimationViewControlleriPhone = rAnimationControlleriPhone;
        self.rAnimationViewControlleriPhone.currentLetter = @"r";
        
        self.rAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:rAnimationControlleriPhone.view atIndex:6];
		
		[rAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.rAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.rAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
        [rAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_S) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SAnimationViewController *sAnimationControlleriPhone = [[SAnimationViewController alloc] initWithNibName:@"SAnimationViewController"
																													  bundle:nil];
		self.sAnimationViewControlleriPhone = sAnimationControlleriPhone;
        self.sAnimationViewControlleriPhone.currentLetter = @"s";
        
        self.sAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:sAnimationControlleriPhone.view atIndex:6];
		
		[sAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.sAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.sAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_T) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TAnimationViewController *tAnimationControlleriPhone = [[TAnimationViewController alloc] initWithNibName:@"TAnimationViewController"
																													  bundle:nil];
		self.tAnimationViewControlleriPhone = tAnimationControlleriPhone;
        self.tAnimationViewControlleriPhone.currentLetter = @"t";
        
        self.tAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:tAnimationControlleriPhone.view atIndex:6];
		
		[tAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        self.tAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_U) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		UAnimationViewController *uAnimationControlleriPhone = [[UAnimationViewController alloc] initWithNibName:@"UAnimationViewController"
																													  bundle:nil];
		self.uAnimationViewControlleriPhone = uAnimationControlleriPhone;
        self.uAnimationViewControlleriPhone.currentLetter = @"u";
        
        self.uAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:uAnimationControlleriPhone.view atIndex:6];
		
		[uAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.uAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.uAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[uAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_V) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		VAnimationViewController *vAnimationControlleriPhone = [[VAnimationViewController alloc] initWithNibName:@"VAnimationViewController"
																													  bundle:nil];
		self.vAnimationViewControlleriPhone = vAnimationControlleriPhone;
        self.vAnimationViewControlleriPhone.currentLetter = @"v";
        
        self.vAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:vAnimationControlleriPhone.view atIndex:6];
		
		[vAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.vAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.vAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[vAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_W) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		WAnimationViewController *wAnimationControlleriPhone = [[WAnimationViewController alloc] initWithNibName:@"WAnimationViewController"
																													  bundle:nil];
		self.wAnimationViewControlleriPhone = wAnimationControlleriPhone;
        self.wAnimationViewControlleriPhone.currentLetter = @"w";
        
        self.wAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:wAnimationControlleriPhone.view atIndex:6];
		
		[wAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.wAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.wAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[wAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	if (integerIdentifier == LOWER_X) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
		
		XAnimationViewController *xAnimationControlleriPhone = [[XAnimationViewController alloc] initWithNibName:@"XAnimationViewController"
																													  bundle:nil];
		self.xAnimationViewControlleriPhone = xAnimationControlleriPhone;
        self.xAnimationViewControlleriPhone.currentLetter = @"x";
        
        self.xAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:xAnimationControlleriPhone.view atIndex:6];
		
		[xAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.xAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.xAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[xAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_Y) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		YAnimationViewController *yAnimationControlleriPhone = [[YAnimationViewController alloc] initWithNibName:@"YAnimationViewController"
																													  bundle:nil];
		self.yAnimationViewControlleriPhone = yAnimationControlleriPhone;
        self.yAnimationViewControlleriPhone.currentLetter = @"y";
        
        self.yAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:yAnimationControlleriPhone.view atIndex:6];
		
		[yAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.yAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke3Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.yAnimationViewControlleriPhone.stroke4Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[yAnimationViewControlleriPhone showDotStrokeThree];
		
	}
	
	if (integerIdentifier == LOWER_Z) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZAnimationViewController *zAnimationControlleriPhone = [[ZAnimationViewController alloc] initWithNibName:@"ZAnimationViewController"
																													  bundle:nil];
		self.zAnimationViewControlleriPhone = zAnimationControlleriPhone;
        self.zAnimationViewControlleriPhone.currentLetter = @"z";
        
        self.zAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
        [self.view insertSubview:zAnimationControlleriPhone.view atIndex:6];
		
		[zAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
		
        //These are for changing the volume of the strokes.
        self.zAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.zAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zAnimationViewControlleriPhone showDotStrokeTwo];
		
	}
	
	//put the rest here.
    
    
}

-(void)replayNumberRandomAnimation {
    
    [clickSoundiPhone play];
    self.letterLabeliPhone.text = @"";
    
    if (integerIdentifier == NUMBER_0) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ZeroAnimationViewController *zeroAnimationControlleriPhone = [[ZeroAnimationViewController alloc] initWithNibName:@"ZeroAnimationViewController"
                                                                                                                               bundle:nil];
		self.zeroAnimationViewControlleriPhone = zeroAnimationControlleriPhone;
        self.zeroAnimationViewControlleriPhone.currentLetter = @"0";
        
        self.zeroAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:zeroAnimationViewControlleriPhone.view atIndex:6];
		
		[zeroAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.zeroAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[zeroAnimationViewControlleriPhone playAnimation];
	}
	
	if (integerIdentifier == NUMBER_1) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		OneAnimationViewController *oneAnimationControlleriPhone = [[OneAnimationViewController alloc] initWithNibName:@"OneAnimationViewController"
                                                                                                                            bundle:nil];
		self.oneAnimationViewControlleriPhone = oneAnimationControlleriPhone;
        self.oneAnimationViewControlleriPhone.currentLetter = @"1";
        
        self.oneAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:oneAnimationViewControlleriPhone.view atIndex:6];
		
		[oneAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.oneAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[oneAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_2) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TwoAnimationViewController *twoAnimationControlleriPhone = [[TwoAnimationViewController alloc] initWithNibName:@"TwoAnimationViewController"
                                                                                                                            bundle:nil];
		self.twoAnimationViewControlleriPhone = twoAnimationControlleriPhone;
        self.twoAnimationViewControlleriPhone.currentLetter = @"2";
        
        self.twoAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:twoAnimationViewControlleriPhone.view atIndex:6];
		
		[twoAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.twoAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[twoAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_3) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		ThreeAnimationViewController *threeAnimationControlleriPhone = [[ThreeAnimationViewController alloc] initWithNibName:@"ThreeAnimationViewController"
                                                                                                                                  bundle:nil];
		self.threeAnimationViewControlleriPhone = threeAnimationControlleriPhone;
        self.threeAnimationViewControlleriPhone.currentLetter = @"3";
        
        self.threeAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:threeAnimationViewControlleriPhone.view atIndex:6];
		
		[threeAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.threeAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[threeAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_4) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FourAnimationViewController *fourAnimationControlleriPhone = [[FourAnimationViewController alloc] initWithNibName:@"FourAnimationViewController"
                                                                                                                               bundle:nil];
		self.fourAnimationViewControlleriPhone = fourAnimationControlleriPhone;
        self.fourAnimationViewControlleriPhone.currentLetter = @"4";
        
        self.fourAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fourAnimationViewControlleriPhone.view atIndex:6];
		
		[fourAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fourAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fourAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_5) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		FiveAnimationViewController *fiveAnimationControlleriPhone = [[FiveAnimationViewController alloc] initWithNibName:@"FiveAnimationViewController"
                                                                                                                               bundle:nil];
		self.fiveAnimationViewControlleriPhone = fiveAnimationControlleriPhone;
        self.fiveAnimationViewControlleriPhone.currentLetter = @"5";
        
        self.fiveAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:fiveAnimationViewControlleriPhone.view atIndex:6];
		
		[fiveAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.fiveAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[fiveAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_6) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SixAnimationViewController *sixAnimationControlleriPhone = [[SixAnimationViewController alloc] initWithNibName:@"SixAnimationViewController"
                                                                                                                            bundle:nil];
		self.sixAnimationViewControlleriPhone = sixAnimationControlleriPhone;
        self.sixAnimationViewControlleriPhone.currentLetter = @"6";
        
        self.sixAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sixAnimationViewControlleriPhone.view atIndex:6];
		
		[sixAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sixAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sixAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_7) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		SevenAnimationViewController *sevenAnimationControlleriPhone = [[SevenAnimationViewController alloc] initWithNibName:@"SevenAnimationViewController"
                                                                                                                                  bundle:nil];
		self.sevenAnimationViewControlleriPhone = sevenAnimationControlleriPhone;
        self.sevenAnimationViewControlleriPhone.currentLetter = @"7";
        
        self.sevenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:sevenAnimationViewControlleriPhone.view atIndex:6];
		
		[sevenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.sevenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[sevenAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_8) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		EightAnimationViewController *eightAnimationControlleriPhone = [[EightAnimationViewController alloc] initWithNibName:@"EightAnimationViewController"
                                                                                                                                  bundle:nil];
		self.eightAnimationViewControlleriPhone = eightAnimationControlleriPhone;
        self.eightAnimationViewControlleriPhone.currentLetter = @"8";
        
        self.eightAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:eightAnimationViewControlleriPhone.view atIndex:6];
		
		[eightAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.eightAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[eightAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_9) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		NineAnimationViewController *nineAnimationControlleriPhone = [[NineAnimationViewController alloc] initWithNibName:@"NineAnimationViewController"
                                                                                                                               bundle:nil];
		self.nineAnimationViewControlleriPhone = nineAnimationControlleriPhone;
        self.nineAnimationViewControlleriPhone.currentLetter = @"9";
        
        self.nineAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:nineAnimationViewControlleriPhone.view atIndex:6];
		
		[nineAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.nineAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.nineAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[nineAnimationViewControlleriPhone playAnimation];
	}
    
	if (integerIdentifier == NUMBER_10) {
		
		//Calls my stopAnimations method.
		[self stopAnimationsiPhone];
        
		TenAnimationViewController *tenAnimationControlleriPhone = [[TenAnimationViewController alloc] initWithNibName:@"TenAnimationViewController"
                                                                                                                            bundle:nil];
		self.tenAnimationViewControlleriPhone = tenAnimationControlleriPhone;
        self.tenAnimationViewControlleriPhone.currentLetter = @"10";
        
        self.tenAnimationViewControlleriPhone.strokeSoundSettingsBoolFlag = self.strokeSoundSettingsBoolFlag;
        
		[self.view insertSubview:tenAnimationViewControlleriPhone.view atIndex:6];
		
		[tenAnimationViewControlleriPhone alterAnimationSpeed:animationSpeediPhone];
        
        //These are for changing the volume of the strokes.
        self.tenAnimationViewControlleriPhone.stroke1Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        self.tenAnimationViewControlleriPhone.stroke2Sound.myAudioPlayer.volume = self.strokeVolumeValue;
        
		[tenAnimationViewControlleriPhone playAnimation];
	}
    
}

#pragma mark - Guessing Game Audio

-(void)startGuessGameAudio {
    
    if (self.alphabetViewController.view == alphabetViewController.numbersView) {
        [self playGuessNumberAudio];
    }
    
    else {
        [self playGuessLetterAudio];
    }
}

//This method chooses a random audio file to play when the guess game is started.
-(void)playGuessLetterAudio {
    NSLog(@"startGuessGameAudioiPhone fired");
        
    NSBundle *mainBundle = [NSBundle mainBundle];
	
	//Assign a random integer from 0 to 8 for the 9 different start game audio files.
	srandom(time(NULL));
	randomStartGameNumber = random() % 9;
    
    
	if (randomStartGameNumber == 0) {
        
        //Added for guess game label.
        self.playGuessGameLabel.text = @"What letter am I tracing?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start1" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 1) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"What letter is it tracing?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start2" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 2) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Can you guess the letter?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start3" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 3) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Which letter is it?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start4" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 4) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Can you guess the letter?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start5" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 5) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Which letter is this tracing?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start6" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 6) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"The ball is going to trace a letter.";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start7" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 7) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Which letter is this?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start8" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 8) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Can you guess this letter?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"start9" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
}

//This method chooses a random audio file to play when the guess number game is started.
-(void)playGuessNumberAudio {
    NSLog(@"playGuessNumberAudio fired");
    
    NSBundle *mainBundle = [NSBundle mainBundle];
	
	//Assign a random integer from 0 to 4 for the 5 different start game audio files.
	srandom(time(NULL));
	randomStartGameNumber = random() % 4;
	
	if (randomStartGameNumber == 0) {
        
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Can you guess the number?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"startnumbers1" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 1) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Which number is this?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"startnumbers2" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 2) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Try to guess the number?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"startnumbers3" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
	
	if (randomStartGameNumber == 3) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"What number do you think this is?";
        self.playGuessGameLabel.alpha = 1.0;
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"startnumbers4" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        [soundFileForButton play];
    }
    
}


//This method chooses a random audio file to play when a letter is correctly guessed.
-(void)rightAnswerAudio {
    
    [UIView animateWithDuration:4.0 animations:^{
        self.playGuessGameLabel.alpha = 1.0;
        self.playGuessGameLabel.alpha = 0.0;
    }];
    
    
    NSBundle *mainBundle = [NSBundle mainBundle];
	
	//Assign a random integer from 0 to 9 for the 10 different correct answer audio files.
	srandom(time(NULL));
	randomRightAnswerNumber = random() % 10;
	
	if (randomRightAnswerNumber == 0) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Good job!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise1" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 1) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Brilliant!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise2" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 2) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Wonderful!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise3" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 3) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Way to go!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise4" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 4) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Way to go!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise5" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 5) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Brilliant!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise6" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 6) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Perfect!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise7" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 7) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Good job!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise8" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 8) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Awesome!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise9" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomRightAnswerNumber == 9) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Right on!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"praise10" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
}

//This method chooses a random audio file to play when a letter is incorrectly guessed.
-(void)wrongAnswerAudio {
    
    NSBundle *mainBundle = [NSBundle mainBundle];
	
	//Assign a random integer from 0 to 9 for the 10 different bad answer audio files.
	srandom(time(NULL));
	randomWrongAnswerNumber = random() % 10;
	
	if (randomWrongAnswerNumber == 0) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Oops!";
        
        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong1" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 1) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Try again!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong2" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 2) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Sorry!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong3" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 3) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Incorrect!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong4" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 4) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"That's wrong!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong5" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 5) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Sorry!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong6" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 6) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Keep trying!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong7" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 7) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"That's wrong!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong8" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 8) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Try again!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong9" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
	
	if (randomWrongAnswerNumber == 9) {
		
        //Added for guess game label.
        self.playGuessGameLabel.text = @"Incorrect!";

        self.soundFileForButton = [SoundEffect soundEffectWithContentsOfFile:[mainBundle pathForResource:@"wrong10" ofType:@"caf"]];
        soundFileForButton.myAudioPlayer.volume = globalVolumeValue;
        NSLog(@"globalVolumeValue in sayLetteriPhone method has value of %f", globalVolumeValue);
        
        [soundFileForButton play];	}
}


#pragma mark - Change Writing Brush

-(void)changeWritingBrush:(NSNotification *)notification {
    
	[self.chalkboardView changeBrush:nil];
}

#pragma mark -


-(void)playTheClickSound {
    [clickSoundiPhone play];
}


//Activated from the slider changing in the speed setting cell.
-(IBAction)changeAnimationSpeed:(id)sender {
    
	UISlider *slider = (UISlider *)sender;
	animationSpeediPhone = slider.value;
    NSLog(@"changeAnimationSpeed fired in ChalkboardViewController with value of %f", animationSpeediPhone);
}

- (void)stopAnimationsiPhone {
	
	NSLog(@"stopAnimations just fired");
	
    [self cancelPlayDataStrokes];

	//Call necessary methods to stop sound effects and animations if the animationViewController is not currently nil.
    
	//if (aAnimationViewControlleriPhone) {
    
    NSLog(@"The if statement fired for aAnimationViewControlleriPhone");
    self.aAnimationViewControlleriPhone.view.hidden = YES;
    [aAnimationViewControlleriPhone.view removeFromSuperview];
    self.aAnimationViewControlleriPhone.view = nil;
    self.aAnimationViewControlleriPhone.stroke1Sound = nil;
    self.aAnimationViewControlleriPhone.stroke2Sound = nil;
    self.aAnimationViewControlleriPhone.stroke3Sound = nil;
    self.aAnimationViewControlleriPhone.stroke4Sound = nil;
    self.aAnimationViewControlleriPhone.stroke5Sound = nil;
    self.aAnimationViewControlleriPhone = nil;
	//}
	
	//if (bAnimationViewControlleriPhone) {
    
    self.bAnimationViewControlleriPhone.view.hidden = YES;
    [bAnimationViewControlleriPhone.view removeFromSuperview];
    self.bAnimationViewControlleriPhone.view = nil;
    self.bAnimationViewControlleriPhone.stroke1Sound = nil;
    self.bAnimationViewControlleriPhone.stroke2Sound = nil;
    self.bAnimationViewControlleriPhone.stroke3Sound = nil;
    self.bAnimationViewControlleriPhone.stroke4Sound = nil;
    self.bAnimationViewControlleriPhone = nil;
	//}
	
	//if (cAnimationViewControlleriPhone) {
    
    NSLog(@"The if statement fired for cAnimationViewControlleriPhone");
    self.cAnimationViewControlleriPhone.view.hidden = YES;
    [cAnimationViewControlleriPhone.view removeFromSuperview];
    self.cAnimationViewControlleriPhone.view = nil;
    self.cAnimationViewControlleriPhone.stroke1Sound = nil;
    self.cAnimationViewControlleriPhone.stroke2Sound = nil;
    self.cAnimationViewControlleriPhone = nil;
	//}
	
	//if (dAnimationViewControlleriPhone) {
    
    self.dAnimationViewControlleriPhone.view.hidden = YES;
    [dAnimationViewControlleriPhone.view removeFromSuperview];
    self.dAnimationViewControlleriPhone.view = nil;
    self.dAnimationViewControlleriPhone.stroke1Sound = nil;
    self.dAnimationViewControlleriPhone.stroke2Sound = nil;
    self.dAnimationViewControlleriPhone.stroke3Sound = nil;
    self.dAnimationViewControlleriPhone.stroke4Sound = nil;
    self.dAnimationViewControlleriPhone = nil;
	//}
	
	//if (eAnimationViewControlleriPhone) {
    
    self.eAnimationViewControlleriPhone.view.hidden = YES;
    [eAnimationViewControlleriPhone.view removeFromSuperview];
    self.eAnimationViewControlleriPhone.view = nil;
    self.eAnimationViewControlleriPhone.stroke1Sound = nil;
    self.eAnimationViewControlleriPhone.stroke2Sound = nil;
    self.eAnimationViewControlleriPhone.stroke3Sound = nil;
    self.eAnimationViewControlleriPhone.stroke4Sound = nil;
    self.eAnimationViewControlleriPhone.stroke5Sound = nil;
    self.eAnimationViewControlleriPhone = nil;
	//}
	
	//if (fAnimationViewControlleriPhone) {
    
    self.fAnimationViewControlleriPhone.view.hidden = YES;
    [fAnimationViewControlleriPhone.view removeFromSuperview];
    self.fAnimationViewControlleriPhone.view = nil;
    self.fAnimationViewControlleriPhone.stroke1Sound = nil;
    self.fAnimationViewControlleriPhone.stroke2Sound = nil;
    self.fAnimationViewControlleriPhone.stroke3Sound = nil;
    self.fAnimationViewControlleriPhone.stroke4Sound = nil;
    self.fAnimationViewControlleriPhone.stroke5Sound = nil;
    self.fAnimationViewControlleriPhone = nil;
	//}
	
	//if (gAnimationViewControlleriPhone) {
    
    self.gAnimationViewControlleriPhone.view.hidden = YES;
    [gAnimationViewControlleriPhone.view removeFromSuperview];
    self.gAnimationViewControlleriPhone.view = nil;
    self.gAnimationViewControlleriPhone.stroke1Sound = nil;
    self.gAnimationViewControlleriPhone.stroke2Sound = nil;
    self.gAnimationViewControlleriPhone.stroke3Sound = nil;
    self.gAnimationViewControlleriPhone = nil;
	//}
	
	//if (hAnimationViewControlleriPhone) {
    
    self.hAnimationViewControlleriPhone.view.hidden = YES;
    [hAnimationViewControlleriPhone.view removeFromSuperview];
    self.hAnimationViewControlleriPhone.view = nil;
    self.hAnimationViewControlleriPhone.stroke1Sound = nil;
    self.hAnimationViewControlleriPhone.stroke2Sound = nil;
    self.hAnimationViewControlleriPhone.stroke3Sound = nil;
    self.hAnimationViewControlleriPhone.stroke4Sound = nil;
    self.hAnimationViewControlleriPhone.stroke5Sound = nil;
    self.hAnimationViewControlleriPhone = nil;
	//}
	
	//if (iAnimationViewControlleriPhone) {
    
    self.iAnimationViewControlleriPhone.view.hidden = YES;
    [iAnimationViewControlleriPhone.view removeFromSuperview];
    self.iAnimationViewControlleriPhone.view = nil;
    self.iAnimationViewControlleriPhone.stroke1Sound = nil;
    self.iAnimationViewControlleriPhone.stroke2Sound = nil;
    self.iAnimationViewControlleriPhone.stroke3Sound = nil;
    self.iAnimationViewControlleriPhone.stroke4Sound = nil;
    self.iAnimationViewControlleriPhone.stroke5Sound = nil;
    
    self.iAnimationViewControlleriPhone = nil;
	//}
	
	//if (jAnimationViewControlleriPhone) {
    
    self.jAnimationViewControlleriPhone.view.hidden = YES;
    [jAnimationViewControlleriPhone.view removeFromSuperview];
    self.jAnimationViewControlleriPhone.view = nil;
    self.jAnimationViewControlleriPhone.stroke1Sound = nil;
    self.jAnimationViewControlleriPhone.stroke2Sound = nil;
    self.jAnimationViewControlleriPhone.stroke3Sound = nil;
    self.jAnimationViewControlleriPhone.stroke4Sound = nil;
    
    self.jAnimationViewControlleriPhone = nil;
	//}
	
	//if (kAnimationViewControlleriPhone) {
    
    self.kAnimationViewControlleriPhone.view.hidden = YES;
    [kAnimationViewControlleriPhone.view removeFromSuperview];
    self.kAnimationViewControlleriPhone.view = nil;
    self.kAnimationViewControlleriPhone.stroke1Sound = nil;
    self.kAnimationViewControlleriPhone.stroke2Sound = nil;
    self.kAnimationViewControlleriPhone.stroke3Sound = nil;
    self.kAnimationViewControlleriPhone.stroke4Sound = nil;
    self.kAnimationViewControlleriPhone = nil;
	//}
	
	//if (lAnimationViewControlleriPhone) {
    
    self.lAnimationViewControlleriPhone.view.hidden = YES;
    [lAnimationViewControlleriPhone.view removeFromSuperview];
    self.lAnimationViewControlleriPhone.view = nil;
    self.lAnimationViewControlleriPhone.stroke1Sound = nil;
    self.lAnimationViewControlleriPhone.stroke2Sound = nil;
    self.lAnimationViewControlleriPhone = nil;
	//}
	
	//if (mAnimationViewControlleriPhone) {
    
    self.mAnimationViewControlleriPhone.view.hidden = YES;
    [mAnimationViewControlleriPhone.view removeFromSuperview];
    self.mAnimationViewControlleriPhone.view = nil;
    self.mAnimationViewControlleriPhone.stroke1Sound = nil;
    self.mAnimationViewControlleriPhone.stroke2Sound = nil;
    self.mAnimationViewControlleriPhone.stroke3Sound = nil;
    self.mAnimationViewControlleriPhone = nil;
	//}
	
	//if (nAnimationViewControlleriPhone) {
    
    self.nAnimationViewControlleriPhone.view.hidden = YES;
    [nAnimationViewControlleriPhone.view removeFromSuperview];
    self.nAnimationViewControlleriPhone.view = nil;
    self.nAnimationViewControlleriPhone.stroke1Sound = nil;
    self.nAnimationViewControlleriPhone.stroke2Sound = nil;
    self.nAnimationViewControlleriPhone.stroke3Sound = nil;
    self.nAnimationViewControlleriPhone = nil;
	//}
	
	//if (oAnimationViewControlleriPhone) {
    
    self.oAnimationViewControlleriPhone.view.hidden = YES;
    [oAnimationViewControlleriPhone.view removeFromSuperview];
    self.oAnimationViewControlleriPhone.view = nil;
    self.oAnimationViewControlleriPhone.stroke1Sound = nil;
    self.oAnimationViewControlleriPhone.stroke2Sound = nil;
    self.oAnimationViewControlleriPhone = nil;
	//}
	
	//if (pAnimationViewControlleriPhone) {
    
    self.pAnimationViewControlleriPhone.view.hidden = YES;
    [pAnimationViewControlleriPhone.view removeFromSuperview];
    self.pAnimationViewControlleriPhone.view = nil;
    self.pAnimationViewControlleriPhone.stroke1Sound = nil;
    self.pAnimationViewControlleriPhone.stroke2Sound = nil;
    self.pAnimationViewControlleriPhone.stroke3Sound = nil;
    self.pAnimationViewControlleriPhone.stroke4Sound = nil;
    self.pAnimationViewControlleriPhone = nil;
	//}
	
	//if (qAnimationViewControlleriPhone) {
    
    self.qAnimationViewControlleriPhone.view.hidden = YES;
    [qAnimationViewControlleriPhone.view removeFromSuperview];
    self.qAnimationViewControlleriPhone.view = nil;
    self.qAnimationViewControlleriPhone.stroke1Sound = nil;
    self.qAnimationViewControlleriPhone.stroke2Sound = nil;
    self.qAnimationViewControlleriPhone.stroke3Sound = nil;
    self.qAnimationViewControlleriPhone.stroke4Sound = nil;
    self.qAnimationViewControlleriPhone = nil;
	//}
	
	//if (rAnimationViewControlleriPhone) {
    
    self.rAnimationViewControlleriPhone.view.hidden = YES;
    [rAnimationViewControlleriPhone.view removeFromSuperview];
    self.rAnimationViewControlleriPhone.view = nil;
    self.rAnimationViewControlleriPhone.stroke1Sound = nil;
    self.rAnimationViewControlleriPhone.stroke2Sound = nil;
    self.rAnimationViewControlleriPhone.stroke3Sound = nil;
    self.rAnimationViewControlleriPhone.stroke4Sound = nil;
    self.rAnimationViewControlleriPhone = nil;
	//}
	
	//if (sAnimationViewControlleriPhone) {
    
    self.sAnimationViewControlleriPhone.view.hidden = YES;
    [sAnimationViewControlleriPhone.view removeFromSuperview];
    self.sAnimationViewControlleriPhone.view = nil;
    self.sAnimationViewControlleriPhone.stroke1Sound = nil;
    self.sAnimationViewControlleriPhone.stroke2Sound = nil;
    self.sAnimationViewControlleriPhone = nil;
	//}
	
	//if (tAnimationViewControlleriPhone) {
    
    self.tAnimationViewControlleriPhone.view.hidden = YES;
    [tAnimationViewControlleriPhone.view removeFromSuperview];
    self.tAnimationViewControlleriPhone.view = nil;
    self.tAnimationViewControlleriPhone.stroke1Sound = nil;
    self.tAnimationViewControlleriPhone.stroke2Sound = nil;
    self.tAnimationViewControlleriPhone.stroke3Sound = nil;
    self.tAnimationViewControlleriPhone.stroke4Sound = nil;
    self.tAnimationViewControlleriPhone = nil;
	//}
	
	//if (uAnimationViewControlleriPhone) {
    
    self.uAnimationViewControlleriPhone.view.hidden = YES;
    [uAnimationViewControlleriPhone.view removeFromSuperview];
    self.uAnimationViewControlleriPhone.view = nil;
    self.uAnimationViewControlleriPhone.stroke1Sound = nil;
    self.uAnimationViewControlleriPhone.stroke2Sound = nil;
    self.uAnimationViewControlleriPhone.stroke3Sound = nil;
    self.uAnimationViewControlleriPhone = nil;
	//}
	
	//if (vAnimationViewControlleriPhone) {
    
    self.vAnimationViewControlleriPhone.view.hidden = YES;
    [vAnimationViewControlleriPhone.view removeFromSuperview];
    self.vAnimationViewControlleriPhone.view = nil;
    self.vAnimationViewControlleriPhone.stroke1Sound = nil;
    self.vAnimationViewControlleriPhone.stroke2Sound = nil;
    self.vAnimationViewControlleriPhone = nil;
	//}
	
	//if (wAnimationViewControlleriPhone) {
    
    self.wAnimationViewControlleriPhone.view.hidden = YES;
    [wAnimationViewControlleriPhone.view removeFromSuperview];
    self.wAnimationViewControlleriPhone.view = nil;
    self.wAnimationViewControlleriPhone.stroke1Sound = nil;
    self.wAnimationViewControlleriPhone.stroke2Sound = nil;
    self.wAnimationViewControlleriPhone = nil;
	//}
	
	//if (xAnimationViewControlleriPhone) {
    
    self.xAnimationViewControlleriPhone.view.hidden = YES;
    [xAnimationViewControlleriPhone.view removeFromSuperview];
    self.xAnimationViewControlleriPhone.view = nil;
    self.xAnimationViewControlleriPhone.stroke1Sound = nil;
    self.xAnimationViewControlleriPhone.stroke2Sound = nil;
    self.xAnimationViewControlleriPhone.stroke3Sound = nil;
    self.xAnimationViewControlleriPhone.stroke4Sound = nil;
    self.xAnimationViewControlleriPhone = nil;
	//}
	
	//if (yAnimationViewControlleriPhone) {
    
    self.yAnimationViewControlleriPhone.view.hidden = YES;
    [yAnimationViewControlleriPhone.view removeFromSuperview];
    self.yAnimationViewControlleriPhone.view = nil;
    self.yAnimationViewControlleriPhone.stroke1Sound = nil;
    self.yAnimationViewControlleriPhone.stroke2Sound = nil;
    self.yAnimationViewControlleriPhone.stroke3Sound = nil;
    self.yAnimationViewControlleriPhone.stroke4Sound = nil;
    self.yAnimationViewControlleriPhone = nil;
	//}
	
	//if (zAnimationViewControlleriPhone) {
    
    self.zAnimationViewControlleriPhone.view.hidden = YES;
    [zAnimationViewControlleriPhone.view removeFromSuperview];
    self.zAnimationViewControlleriPhone.view = nil;
    self.zAnimationViewControlleriPhone.stroke1Sound = nil;
    self.zAnimationViewControlleriPhone.stroke2Sound = nil;
    self.zAnimationViewControlleriPhone = nil;
	//}
	
    //if (zeroAnimationViewControlleriPhone) {
    
    self.zeroAnimationViewControlleriPhone.view.hidden = YES;
    [zeroAnimationViewControlleriPhone.view removeFromSuperview];
    self.zeroAnimationViewControlleriPhone.view = nil;
    self.zeroAnimationViewControlleriPhone.stroke1Sound = nil;
    self.zeroAnimationViewControlleriPhone = nil;
	//}
    
    //if (oneAnimationViewControlleriPhone) {
    
    self.oneAnimationViewControlleriPhone.view.hidden = YES;
    [oneAnimationViewControlleriPhone.view removeFromSuperview];
    self.oneAnimationViewControlleriPhone.view = nil;
    self.oneAnimationViewControlleriPhone.stroke1Sound = nil;
    self.oneAnimationViewControlleriPhone = nil;
	//}
    
    //if (twoAnimationViewControlleriPhone) {
    
    self.twoAnimationViewControlleriPhone.view.hidden = YES;
    [twoAnimationViewControlleriPhone.view removeFromSuperview];
    self.twoAnimationViewControlleriPhone.view = nil;
    self.twoAnimationViewControlleriPhone.stroke1Sound = nil;
    self.twoAnimationViewControlleriPhone = nil;
	//}
    
    //if (threeAnimationViewControlleriPhone) {
    
    self.threeAnimationViewControlleriPhone.view.hidden = YES;
    [threeAnimationViewControlleriPhone.view removeFromSuperview];
    self.threeAnimationViewControlleriPhone.view = nil;
    self.threeAnimationViewControlleriPhone.stroke1Sound = nil;
    self.threeAnimationViewControlleriPhone = nil;
	//}
    
    //if (fourAnimationViewControlleriPhone) {
    
    self.fourAnimationViewControlleriPhone.view.hidden = YES;
    [fourAnimationViewControlleriPhone.view removeFromSuperview];
    self.fourAnimationViewControlleriPhone.view = nil;
    self.fourAnimationViewControlleriPhone.stroke1Sound = nil;
    self.fourAnimationViewControlleriPhone.stroke2Sound = nil;
    self.fourAnimationViewControlleriPhone = nil;
	//}
    
    //if (fiveAnimationViewControlleriPhone) {
    
    self.fiveAnimationViewControlleriPhone.view.hidden = YES;
    [fiveAnimationViewControlleriPhone.view removeFromSuperview];
    self.fiveAnimationViewControlleriPhone.view = nil;
    self.fiveAnimationViewControlleriPhone.stroke1Sound = nil;
    self.fiveAnimationViewControlleriPhone = nil;
	//}
    
    //if (sixAnimationViewControlleriPhone) {
    
    self.sixAnimationViewControlleriPhone.view.hidden = YES;
    [sixAnimationViewControlleriPhone.view removeFromSuperview];
    self.sixAnimationViewControlleriPhone.view = nil;
    self.sixAnimationViewControlleriPhone.stroke1Sound = nil;
    self.sixAnimationViewControlleriPhone = nil;
	//}
    
    //if (sevenAnimationViewControlleriPhone) {
    
    self.sevenAnimationViewControlleriPhone.view.hidden = YES;
    [sevenAnimationViewControlleriPhone.view removeFromSuperview];
    self.sevenAnimationViewControlleriPhone.view = nil;
    self.sevenAnimationViewControlleriPhone.stroke1Sound = nil;
    self.sevenAnimationViewControlleriPhone = nil;
	//}
    
    //if (eightAnimationViewControlleriPhone) {
    
    self.eightAnimationViewControlleriPhone.view.hidden = YES;
    [eightAnimationViewControlleriPhone.view removeFromSuperview];
    self.eightAnimationViewControlleriPhone.view = nil;
    self.eightAnimationViewControlleriPhone.stroke1Sound = nil;
    self.eightAnimationViewControlleriPhone = nil;
	//}
    
    //if (nineAnimationViewControlleriPhone) {
    
    self.nineAnimationViewControlleriPhone.view.hidden = YES;
    [nineAnimationViewControlleriPhone.view removeFromSuperview];
    self.nineAnimationViewControlleriPhone.view = nil;
    self.nineAnimationViewControlleriPhone.stroke1Sound = nil;
    self.nineAnimationViewControlleriPhone.stroke2Sound = nil;
    self.nineAnimationViewControlleriPhone = nil;
	//}
    
    //if (tenAnimationViewControlleriPhone) {
    
    self.tenAnimationViewControlleriPhone.view.hidden = YES;
    [tenAnimationViewControlleriPhone.view removeFromSuperview];
    self.tenAnimationViewControlleriPhone.view = nil;
    self.tenAnimationViewControlleriPhone.stroke1Sound = nil;
    self.tenAnimationViewControlleriPhone.stroke2Sound = nil;
    self.tenAnimationViewControlleriPhone = nil;
	//}
    
	//add other animationViewControllers here.
	
	//return;
    
}

/*
 //Deleted for v4.0
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == (UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight));
    return YES;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"willAnimateRotation just fired in ChalkboardViewController");
    NSLog(@"The center of the guidlines image is %f, %f", self.guidlinesImage.center.x, self.guidlinesImage.center.y);
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        self.guidlinesImage.center = CGPointMake(240, 172.500);
    }
    
    else {
        
        self.guidlinesImage.center = CGPointMake(160, 247.500);
    }
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    //[super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning fired in chalkboardViewController");

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    NSLog(@"viewDidUnload fired in ChalkboardViewController");
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //  self.scrollViewiPhone = nil;
    //  self.alphabetViewController = nil;
    //  self.choosPaintbrushButton = nil;
    
    //	self.animationSpeedSlideriPhone = nil;
	
    //	self.chalkboardViewiPhone = nil;
    //	self.letterLabeliPhone = nil;

	self.clickSoundiPhone = nil;
	self.eraseSoundiPhone = nil;

	self.correctButton = nil;
	self.correctAnswer = nil;
	
	self.replayGuessAnimationButton = nil;
	self.guessingGameButton = nil;
	self.eraseButton = nil;
	//self.maximizeScreenButtoniPhone = nil;
	self.settingsMenuButton = nil;
	
	self.aAnimationViewControlleriPhone = nil;
	self.bAnimationViewControlleriPhone = nil;
	self.cAnimationViewControlleriPhone = nil;
	self.dAnimationViewControlleriPhone = nil;
	self.eAnimationViewControlleriPhone = nil;
	self.fAnimationViewControlleriPhone = nil;
	self.gAnimationViewControlleriPhone = nil;
	self.hAnimationViewControlleriPhone = nil;
	self.iAnimationViewControlleriPhone = nil;
	self.jAnimationViewControlleriPhone = nil;
	self.kAnimationViewControlleriPhone = nil;
	self.lAnimationViewControlleriPhone = nil;
	self.mAnimationViewControlleriPhone = nil;
	self.nAnimationViewControlleriPhone = nil;
	self.oAnimationViewControlleriPhone = nil;
	self.pAnimationViewControlleriPhone = nil;
	self.qAnimationViewControlleriPhone = nil;
	self.rAnimationViewControlleriPhone = nil;
	self.sAnimationViewControlleriPhone = nil;
	self.tAnimationViewControlleriPhone = nil;
	self.uAnimationViewControlleriPhone = nil;
	self.vAnimationViewControlleriPhone = nil;
	self.wAnimationViewControlleriPhone = nil;
	self.xAnimationViewControlleriPhone = nil;
	self.yAnimationViewControlleriPhone = nil;
	self.zAnimationViewControlleriPhone = nil;
    
    self.zeroAnimationViewControlleriPhone = nil;
    self.oneAnimationViewControlleriPhone = nil;
    self.twoAnimationViewControlleriPhone = nil;
    self.threeAnimationViewControlleriPhone = nil;
    self.fourAnimationViewControlleriPhone = nil;
    self.fiveAnimationViewControlleriPhone = nil;
    self.sixAnimationViewControlleriPhone = nil;
    self.sevenAnimationViewControlleriPhone = nil;
    self.eightAnimationViewControlleriPhone = nil;
    self.nineAnimationViewControlleriPhone = nil;
    self.tenAnimationViewControlleriPhone = nil;
    
	//Put the rest here.
}


- (void)dealloc {
    
	//TODO: This is how to use device notifications.
	//[[NSNotificationCenter defaultCenter] removeObserver:self];
	//[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	
    
    //Put the rest here.
    
}

#pragma mark Activate Brush Popover Menu

-(IBAction)activatePopoverMenu:(id)sender{
    
    [self cancelPlayDataStrokes];
	
    if (self.brushPopoverController.popoverVisible == NO) {
        [clickSoundiPhone play];
    }
    
	//check to see if the popover is currently displayed - j
	if (self.brushPopoverController == nil) {
		
	[[NSBundle mainBundle] loadNibNamed:@"BrushTableViewController" owner:self options:nil];
	
    UIPopoverController* aPopover = [[UIPopoverController alloc] initWithContentViewController:brushTableViewController];
    aPopover.delegate = self;
	
    
	// Store the popover in a custom property for later use.
	self.brushPopoverController = aPopover;
	
	self.brushPopoverController.popoverContentSize = CGSizeMake(320, 800);//was 320,430
    [self.brushPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	
	}
	
}

//Define what the selector does in the above notification, which in this case
//will dismiss the popover after a brush selection.
//The BrushTableViewController is who posts this notification - j
-(void)dismissMyPopover:(NSNotification *)notification {

	[self.chalkboardView changeBrush:nil];
	[self.brushPopoverController dismissPopoverAnimated:YES];
	self.brushPopoverController = nil;
	//TODO: Cannot put this here, or in the activatePopoverMenu method or the app will crash
	//[popoverController release];
        
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	//need to do this, otherwise if you dismiss the popover by clicking outside the popover
	//the popover will not display the next time you try to activate it - j
	if (popoverController == self.brushPopoverController) {
		self.brushPopoverController = nil;
	}
	
    //Don't need this. If it's in here it will make my popover content not be able to persist after the
    //popover is closed and re-displayed. See the activateSettingsPopoverMenu's else statement.
	//if (popoverController == self.settingsPopoverController) {
		//self.settingsPopoverController = nil;
	//}
	
}

#pragma mark Activate Settings Popover Menu

-(IBAction)activateSettingsPopoverMenu:(id)sender {
	
    NSLog(@"activateSettingsPopoverMenu in ChalkboardViewController");

    [self stopAnimationsiPhone];
    
    if (self.settingsPopoverController.popoverVisible == NO) {
        [clickSoundiPhone play];
    }
            
	//Check to see if the popover is currently displayed. - j
	if (self.settingsPopoverController == nil) {
			
        SettingsViewControlleriPad *viewController = [[SettingsViewControlleriPad alloc] initWithNibName:@"SettingsViewControlleriPad" bundle:nil];
        self.settingsViewController = viewController;
        
        //Give the settingsViewController a reference to the instance of the ChalkboardViewControlleriPhone.
        self.settingsViewController.chalkboardViewController = self;
        
        
		//[[NSBundle mainBundle] loadNibNamed:@"SettingsViewControlleriPad" owner:self options:nil];
		
		UIPopoverController* aPopover = [[UIPopoverController alloc] initWithContentViewController:settingsViewController];
		aPopover.delegate = self;
        
        //Give the settingsViewController a reference to the instance of the ChalkboardViewControlleriPhone.
        self.settingsViewController.chalkboardViewController = self;
        

		// Store the popover in a custom property for later use.
		self.settingsPopoverController = aPopover;
        
		
		self.settingsPopoverController.popoverContentSize = CGSizeMake(320, 500);
		[self.settingsPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
		
		//This will ensure that the slider displays the default position the first time it's shown, but then it will
		//display the value it was last set to.
		//if (animationSpeedSlider != nil) {
			//animationSpeedSlider.value = animationSpeed;
		//}
        
        NSInteger upperLowerLettersCount = [self getRecordingsForUpperLowerCategory];
        NSInteger upperLettersCount = [self getRecordingsForUpperCategory];
        NSInteger lowerLettersCount = [self getRecordingsForLowerCategory];
        NSInteger numbersCount = [self getRecordingsForNumberCategory];
                
        [self.settingsViewController updateUpperLowerString:[NSString stringWithFormat:@"%d", upperLowerLettersCount]];
        [self.settingsViewController updateUpperString:[NSString stringWithFormat:@"%d", upperLettersCount]];
        [self.settingsViewController updateLowerString:[NSString stringWithFormat:@"%d", lowerLettersCount]];
        [self.settingsViewController updateNumberString:[NSString stringWithFormat:@"%d", numbersCount]];

	}
  
//This makes sure the previous popover's content persists when the popover is closed and re-displayed.
    else {
        
        [self.settingsPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        NSInteger upperLowerLettersCount = [self getRecordingsForUpperLowerCategory];
        NSInteger upperLettersCount = [self getRecordingsForUpperCategory];
        NSInteger lowerLettersCount = [self getRecordingsForLowerCategory];
        NSInteger numbersCount = [self getRecordingsForNumberCategory];
        
        [self.settingsViewController updateUpperLowerString:[NSString stringWithFormat:@"%d", upperLowerLettersCount]];
        [self.settingsViewController updateUpperString:[NSString stringWithFormat:@"%d", upperLettersCount]];
        [self.settingsViewController updateLowerString:[NSString stringWithFormat:@"%d", lowerLettersCount]];
        [self.settingsViewController updateNumberString:[NSString stringWithFormat:@"%d", numbersCount]];
        
    }
    
    
}


/*
-(IBAction)activateSettingsPopoverMenu:(id)sender {
	
    
    if (self.settingsPopoverController.popoverVisible == NO) {
        [clickSoundiPhone play];
    }
    
	//check to see if the popover is currently displayed - j
	if (self.settingsPopoverController == nil) {
		
        [[NSBundle mainBundle] loadNibNamed:@"SettingsTableViewControlleriPad" owner:self options:nil];
        
        UIPopoverController* aPopover = [[UIPopoverController alloc] initWithContentViewController:settingsViewController];
        aPopover.delegate = self;
        
        
        // Store the popover in a custom property for later use.
        self.settingsPopoverController = aPopover;
        
        self.settingsPopoverController.popoverContentSize = CGSizeMake(320, 800);//was 320,430
        [self.settingsPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
	}

}
*/

@end