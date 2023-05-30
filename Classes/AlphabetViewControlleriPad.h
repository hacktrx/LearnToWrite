//
//  AlphabetViewControlleriPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/6/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonSelectionCelliPad.h"

@class ChalkboardViewController;

@protocol LTW_AlphabetViewDelegateiPad <NSObject>

@optional
-(void)buttonStyleChanged;
-(void)changeLetteriPad:(NSString *)letter forButton:(NSInteger)buttonIdentifier;
@end

@interface AlphabetViewControlleriPad : UIViewController <SegmentedSwitchDelegateiPad> {

NSInteger selectedSwitchSegment;

ChalkboardViewController *chalkboardViewController;

IBOutlet UIView *upperAndLowerCaseView;
IBOutlet UIView *upperCaseView;
IBOutlet UIView *lowerCaseView;
IBOutlet UIView *numbersView;

IBOutlet UIButton *myAaButton;
IBOutlet UIButton *myBbButton;
IBOutlet UIButton *myCcButton;
IBOutlet UIButton *myDdButton;
IBOutlet UIButton *myEeButton;
IBOutlet UIButton *myFfButton;
IBOutlet UIButton *myGgButton;
IBOutlet UIButton *myHhButton;
IBOutlet UIButton *myIiButton;
IBOutlet UIButton *myJjButton;
IBOutlet UIButton *myKkButton;
IBOutlet UIButton *myLlButton;
IBOutlet UIButton *myMmButton;
IBOutlet UIButton *myNnButton;
IBOutlet UIButton *myOoButton;
IBOutlet UIButton *myPpButton;
IBOutlet UIButton *myQqButton;
IBOutlet UIButton *myRrButton;
IBOutlet UIButton *mySsButton;
IBOutlet UIButton *myTtButton;
IBOutlet UIButton *myUuButton;
IBOutlet UIButton *myVvButton;
IBOutlet UIButton *myWwButton;
IBOutlet UIButton *myXxButton;
IBOutlet UIButton *myYyButton;
IBOutlet UIButton *myZzButton;

IBOutlet UIButton *myAButton;
IBOutlet UIButton *myBButton;
IBOutlet UIButton *myCButton;
IBOutlet UIButton *myDButton;
IBOutlet UIButton *myEButton;
IBOutlet UIButton *myFButton;
IBOutlet UIButton *myGButton;
IBOutlet UIButton *myHButton;
IBOutlet UIButton *myIButton;
IBOutlet UIButton *myJButton;
IBOutlet UIButton *myKButton;
IBOutlet UIButton *myLButton;
IBOutlet UIButton *myMButton;
IBOutlet UIButton *myNButton;
IBOutlet UIButton *myOButton;
IBOutlet UIButton *myPButton;
IBOutlet UIButton *myQButton;
IBOutlet UIButton *myRButton;
IBOutlet UIButton *mySButton;
IBOutlet UIButton *myTButton;
IBOutlet UIButton *myUButton;
IBOutlet UIButton *myVButton;
IBOutlet UIButton *myWButton;
IBOutlet UIButton *myXButton;
IBOutlet UIButton *myYButton;
IBOutlet UIButton *myZButton;

IBOutlet UIButton *mySmallAButton;
IBOutlet UIButton *mySmallBButton;
IBOutlet UIButton *mySmallCButton;
IBOutlet UIButton *mySmallDButton;
IBOutlet UIButton *mySmallEButton;
IBOutlet UIButton *mySmallFButton;
IBOutlet UIButton *mySmallGButton;
IBOutlet UIButton *mySmallHButton;
IBOutlet UIButton *mySmallIButton;
IBOutlet UIButton *mySmallJButton;
IBOutlet UIButton *mySmallKButton;
IBOutlet UIButton *mySmallLButton;
IBOutlet UIButton *mySmallMButton;
IBOutlet UIButton *mySmallNButton;
IBOutlet UIButton *mySmallOButton;
IBOutlet UIButton *mySmallPButton;
IBOutlet UIButton *mySmallQButton;
IBOutlet UIButton *mySmallRButton;
IBOutlet UIButton *mySmallSButton;
IBOutlet UIButton *mySmallTButton;
IBOutlet UIButton *mySmallUButton;
IBOutlet UIButton *mySmallVButton;
IBOutlet UIButton *mySmallWButton;
IBOutlet UIButton *mySmallXButton;
IBOutlet UIButton *mySmallYButton;
IBOutlet UIButton *mySmallZButton;

IBOutlet UIButton *my0Button;
IBOutlet UIButton *my1Button;
IBOutlet UIButton *my2Button;
IBOutlet UIButton *my3Button;
IBOutlet UIButton *my4Button;
IBOutlet UIButton *my5Button;
IBOutlet UIButton *my6Button;
IBOutlet UIButton *my7Button;
IBOutlet UIButton *my8Button;
IBOutlet UIButton *my9Button;
IBOutlet UIButton *my10Button;

    //Added for v4.0
    UIButton *activatedButton;
    NSMutableArray *buttonsArray;
}

@property (weak) id<LTW_AlphabetViewDelegateiPad> delegate;

@property (nonatomic, readwrite) NSInteger selectedSwitchSegment;

@property (nonatomic, retain) ChalkboardViewController *chalkboardViewController;

@property (nonatomic, retain) IBOutlet UIView *upperAndLowerCaseView;
@property (nonatomic, retain) IBOutlet UIView *upperCaseView;
@property (nonatomic, retain) IBOutlet UIView *lowerCaseView;
@property (nonatomic, retain) IBOutlet UIView *numbersView;

@property (nonatomic, retain) IBOutlet UIButton *myAaButton;
@property (nonatomic, retain) IBOutlet UIButton *myBbButton;
@property (nonatomic, retain) IBOutlet UIButton *myCcButton;
@property (nonatomic, retain) IBOutlet UIButton *myDdButton;
@property (nonatomic, retain) IBOutlet UIButton *myEeButton;
@property (nonatomic, retain) IBOutlet UIButton *myFfButton;
@property (nonatomic, retain) IBOutlet UIButton *myGgButton;
@property (nonatomic, retain) IBOutlet UIButton *myHhButton;
@property (nonatomic, retain) IBOutlet UIButton *myIiButton;
@property (nonatomic, retain) IBOutlet UIButton *myJjButton;
@property (nonatomic, retain) IBOutlet UIButton *myKkButton;
@property (nonatomic, retain) IBOutlet UIButton *myLlButton;
@property (nonatomic, retain) IBOutlet UIButton *myMmButton;
@property (nonatomic, retain) IBOutlet UIButton *myNnButton;
@property (nonatomic, retain) IBOutlet UIButton *myOoButton;
@property (nonatomic, retain) IBOutlet UIButton *myPpButton;
@property (nonatomic, retain) IBOutlet UIButton *myQqButton;
@property (nonatomic, retain) IBOutlet UIButton *myRrButton;
@property (nonatomic, retain) IBOutlet UIButton *mySsButton;
@property (nonatomic, retain) IBOutlet UIButton *myTtButton;
@property (nonatomic, retain) IBOutlet UIButton *myUuButton;
@property (nonatomic, retain) IBOutlet UIButton *myVvButton;
@property (nonatomic, retain) IBOutlet UIButton *myWwButton;
@property (nonatomic, retain) IBOutlet UIButton *myXxButton;
@property (nonatomic, retain) IBOutlet UIButton *myYyButton;
@property (nonatomic, retain) IBOutlet UIButton *myZzButton;

@property (nonatomic, retain) IBOutlet UIButton *myAButton;
@property (nonatomic, retain) IBOutlet UIButton *myBButton;
@property (nonatomic, retain) IBOutlet UIButton *myCButton;
@property (nonatomic, retain) IBOutlet UIButton *myDButton;
@property (nonatomic, retain) IBOutlet UIButton *myEButton;
@property (nonatomic, retain) IBOutlet UIButton *myFButton;
@property (nonatomic, retain) IBOutlet UIButton *myGButton;
@property (nonatomic, retain) IBOutlet UIButton *myHButton;
@property (nonatomic, retain) IBOutlet UIButton *myIButton;
@property (nonatomic, retain) IBOutlet UIButton *myJButton;
@property (nonatomic, retain) IBOutlet UIButton *myKButton;
@property (nonatomic, retain) IBOutlet UIButton *myLButton;
@property (nonatomic, retain) IBOutlet UIButton *myMButton;
@property (nonatomic, retain) IBOutlet UIButton *myNButton;
@property (nonatomic, retain) IBOutlet UIButton *myOButton;
@property (nonatomic, retain) IBOutlet UIButton *myPButton;
@property (nonatomic, retain) IBOutlet UIButton *myQButton;
@property (nonatomic, retain) IBOutlet UIButton *myRButton;
@property (nonatomic, retain) IBOutlet UIButton *mySButton;
@property (nonatomic, retain) IBOutlet UIButton *myTButton;
@property (nonatomic, retain) IBOutlet UIButton *myUButton;
@property (nonatomic, retain) IBOutlet UIButton *myVButton;
@property (nonatomic, retain) IBOutlet UIButton *myWButton;
@property (nonatomic, retain) IBOutlet UIButton *myXButton;
@property (nonatomic, retain) IBOutlet UIButton *myYButton;
@property (nonatomic, retain) IBOutlet UIButton *myZButton;

@property (nonatomic, retain) IBOutlet UIButton *mySmallAButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallBButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallCButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallDButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallEButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallFButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallGButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallHButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallIButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallJButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallKButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallLButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallMButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallNButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallOButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallPButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallQButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallRButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallSButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallTButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallUButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallVButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallWButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallXButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallYButton;
@property (nonatomic, retain) IBOutlet UIButton *mySmallZButton;

@property (nonatomic, retain) IBOutlet UIButton *my0Button;
@property (nonatomic, retain) IBOutlet UIButton *my1Button;
@property (nonatomic, retain) IBOutlet UIButton *my2Button;
@property (nonatomic, retain) IBOutlet UIButton *my3Button;
@property (nonatomic, retain) IBOutlet UIButton *my4Button;
@property (nonatomic, retain) IBOutlet UIButton *my5Button;
@property (nonatomic, retain) IBOutlet UIButton *my6Button;
@property (nonatomic, retain) IBOutlet UIButton *my7Button;
@property (nonatomic, retain) IBOutlet UIButton *my8Button;
@property (nonatomic, retain) IBOutlet UIButton *my9Button;
@property (nonatomic, retain) IBOutlet UIButton *my10Button;

//Added for v4.0
@property (nonatomic, strong) UIButton *activatedButton;
@property (nonatomic, strong) NSMutableArray *buttonsArray;

-(IBAction)changeLetteriPad:(id)sender;
-(void)buttonTextForSavedStrokes;
-(void)buttonTextForNoStrokes;
-(void)resetButtonLabelTextColor;
-(void)initializingDisplayedLetter:(NSString *)myLetterLabel;

@end
