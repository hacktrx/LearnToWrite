//
//  AlphabetViewControlleriPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/6/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "AlphabetViewControlleriPad.h"
#import "ChalkboardViewController.h"

@implementation AlphabetViewControlleriPad

@synthesize delegate;
@synthesize selectedSwitchSegment;
@synthesize chalkboardViewController;
@synthesize upperCaseView;
@synthesize lowerCaseView;
@synthesize upperAndLowerCaseView;
@synthesize numbersView;

@synthesize myAaButton;
@synthesize myBbButton;
@synthesize myCcButton;
@synthesize myDdButton;
@synthesize myEeButton;
@synthesize myFfButton;
@synthesize myGgButton;
@synthesize myHhButton;
@synthesize myIiButton;
@synthesize myJjButton;
@synthesize myKkButton;
@synthesize myLlButton;
@synthesize myMmButton;
@synthesize myNnButton;
@synthesize myOoButton;
@synthesize myPpButton;
@synthesize myQqButton;
@synthesize myRrButton;
@synthesize mySsButton;
@synthesize myTtButton;
@synthesize myUuButton;
@synthesize myVvButton;
@synthesize myWwButton;
@synthesize myXxButton;
@synthesize myYyButton;
@synthesize myZzButton;


@synthesize myAButton;
@synthesize myBButton;
@synthesize myCButton;
@synthesize myDButton;
@synthesize myEButton;
@synthesize myFButton;
@synthesize myGButton;
@synthesize myHButton;
@synthesize myIButton;
@synthesize myJButton;
@synthesize myKButton;
@synthesize myLButton;
@synthesize myMButton;
@synthesize myNButton;
@synthesize myOButton;
@synthesize myPButton;
@synthesize myQButton;
@synthesize myRButton;
@synthesize mySButton;
@synthesize myTButton;
@synthesize myUButton;
@synthesize myVButton;
@synthesize myWButton;
@synthesize myXButton;
@synthesize myYButton;
@synthesize myZButton;

@synthesize mySmallAButton;
@synthesize mySmallBButton;
@synthesize mySmallCButton;
@synthesize mySmallDButton;
@synthesize mySmallEButton;
@synthesize mySmallFButton;
@synthesize mySmallGButton;
@synthesize mySmallHButton;
@synthesize mySmallIButton;
@synthesize mySmallJButton;
@synthesize mySmallKButton;
@synthesize mySmallLButton;
@synthesize mySmallMButton;
@synthesize mySmallNButton;
@synthesize mySmallOButton;
@synthesize mySmallPButton;
@synthesize mySmallQButton;
@synthesize mySmallRButton;
@synthesize mySmallSButton;
@synthesize mySmallTButton;
@synthesize mySmallUButton;
@synthesize mySmallVButton;
@synthesize mySmallWButton;
@synthesize mySmallXButton;
@synthesize mySmallYButton;
@synthesize mySmallZButton;

@synthesize my0Button;
@synthesize my1Button;
@synthesize my2Button;
@synthesize my3Button;
@synthesize my4Button;
@synthesize my5Button;
@synthesize my6Button;
@synthesize my7Button;
@synthesize my8Button;
@synthesize my9Button;
@synthesize my10Button;

//Added for v4.0
@synthesize activatedButton;
@synthesize buttonsArray;

#define UPPER_AND_LOWER_CASE_VIEW 0
#define UPPER_CASE_VIEW 1
#define LOWER_CASE_VIEW 2
#define NUMBERS_VIEW 3



#pragma mark ButtonSelectionCell Delegate Method

- (void)segmentedSwitchPressediPad:(NSInteger)selectedSegment {
    
    NSLog(@"segmentedSwitchPressed delegate method fired in AlphabetViewControlleriPad");
    
    //This stuff is used to make the segmented switch retain it's selection.
    //DONT NEED THIS BECAUSE I RETAIN THE INSTANCE OF THE SETTINGSVIEWCONTROLLER.
    /*
     if (selectedSegment == 0) {
     self.selectedSwitchSegment = 0;
     }
     
     else {
     self.selectedSwitchSegment = selectedSegment;
     }
     */
    
    
    switch (selectedSegment) {
        case UPPER_AND_LOWER_CASE_VIEW:
            self.view = self.upperAndLowerCaseView;
            self.chalkboardViewController.currentButtonView = 0;
            break;
        case UPPER_CASE_VIEW:
            self.view = self.upperCaseView;
            self.chalkboardViewController.currentButtonView = 1;
            break;
        case LOWER_CASE_VIEW:
            self.view = self.lowerCaseView;
            self.chalkboardViewController.currentButtonView = 2;
            break;
        case NUMBERS_VIEW:
            self.view = self.numbersView;
            self.chalkboardViewController.currentButtonView = 3;
            break;
            
        default:
            break;
    }
    
    //Added for v4.0. It was actually up above the switch statement in v3.2, but moved down here in v4.0 and made it a delegate method.
    [delegate buttonStyleChanged];
    
}


#pragma mark Initialization Of Letter Display

-(void)initializingDisplayedLetter:(NSString *)myLetterLabel {
    
    NSLog(@"initializingDisplayedLetter fired.");
    
    if ([myLetterLabel isEqualToString:@"Aa"] == YES) {
        [self.buttonsArray addObject:(UIButton *)self.myAaButton];
        self.activatedButton = self.myAaButton;
    }
    
    if ([myLetterLabel isEqualToString:@"A"] == YES) {
        [self.buttonsArray addObject:(UIButton *)self.myAButton];
        self.activatedButton = self.myAButton;
    }
    
    if ([myLetterLabel isEqualToString:@"a"] == YES) {
        [self.buttonsArray addObject:(UIButton *)self.mySmallAButton];
        self.activatedButton = self.mySmallAButton;
    }
    
    if ([myLetterLabel isEqualToString:@"0"] == YES) {
        [self.buttonsArray addObject:(UIButton *)self.my0Button];
        self.activatedButton = self.my0Button;
    }
}


#pragma mark Method to Display Correct Text

-(IBAction)changeLetteriPad:(id)sender {
    
    // Make sure it's a UIButton
    if (![sender isKindOfClass:[UIButton class]])
        return;
    
    [self.buttonsArray addObject:(UIButton *)sender];

    //Pass the tag identifier into the method, it is used in the ChalkboardViewController
    //to identify which letter sound to say and which animation will get played.
    NSInteger tagIdentifier = [(UIButton *)sender tag];
    
    //You cannot assign a tag to a button that is above a number 37 (i think).
    if (self.view == self.upperCaseView) {
        tagIdentifier = tagIdentifier + 26;
    }
    
    if (self.view == self.lowerCaseView) {
        tagIdentifier = tagIdentifier + 52;
    }
    
    if (self.view == self.numbersView) {
        tagIdentifier = tagIdentifier + 78;
    }
    
    //Pass the label of the button into the method, it is used to display the correct
    //text onto the screen.
    NSString *labelString = [[(UIButton *)sender titleLabel] text];
    
    //Added for v4.0. Used as a reference to the activated buttons so I can set it's label text color in the ChalkboardViewController
    //to grey or white based on whether there is a stroke to play back or not for the letter button.
    self.activatedButton = (UIButton *)sender;
    
    //[delegate changeLetteriPad:(NSString *)labelString :(NSInteger)tagIdentifier];
    [delegate changeLetteriPad:labelString forButton:tagIdentifier];
}


#pragma mark Button Labels
-(void)buttonTextForSavedStrokes {
    
    [self.activatedButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.activatedButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:25.0];
}

-(void)buttonTextForNoStrokes {
    
    [self.activatedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.activatedButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
}

-(void)resetButtonLabelTextColor {
    
    NSLog(@"resetButtonLabelTextColor fired in AlphabetViewController.");
    
    int i;
    int countOfButtons = [self.buttonsArray count];
    
    for (i = 0; i < countOfButtons; i++) {
        
        UIButton *aButton = [self.buttonsArray objectAtIndex:i];
        [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        aButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
        
    }
    
    [self.buttonsArray removeAllObjects];
}

-(void)activateButtonLabelTextColor {
    
    NSLog(@"resetButtonLabelTextColor fired in AlphabetViewController.");
    
    int i;
    int countOfButtons = [self.buttonsArray count];
    
    for (i = 0; i < countOfButtons; i++) {
        
        UIButton *aButton = [self.buttonsArray objectAtIndex:i];
        [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        aButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
        
    }
    
    [self.buttonsArray removeAllObjects];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 
 NSLog(@"initWithNibName fired in AlphabetViewController");
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad fired in AlphabetViewControlleriPad");
    
    //Added for v4.0 This array of buttons is so I can go back and change the text color to white on resetting of stroke recordings.
    if (!self.buttonsArray) {
        NSMutableArray *myMutableArray = [[NSMutableArray alloc] init];
        self.buttonsArray = myMutableArray;
        NSLog(@"The buttonsArray is !, so it got alloc/init'd");
    }
}

/*Deleted for v4.0
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == (UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight));
    return YES;
}
*/


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning in AlphabetViewControlleriPad.");
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
