//
//  MAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/20/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface MAnimationViewController : UIViewController {

	NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	SoundEffect	*stroke2Sound;
	SoundEffect	*stroke3Sound;
	
	IBOutlet UIImageView *stroke1Sphere;
	IBOutlet UIImageView *stroke2Sphere;
	IBOutlet UIImageView *stroke3Sphere;
	
	//These are used as the base coordinate values, which are modified and assigned to
	//adjust the actual coordinates being used in the animations for the different
	//orientations.
    
    CGFloat capitalLetterOriginX;
    CGFloat capitalLetterOriginY;
    CGFloat smallLetterOriginX;
    CGFloat smallLetterOriginY;
    
	CGFloat strokeOneStartXDefault;
	CGFloat strokeOneStartYDefault;
	CGFloat strokeOneTopLeftXDefault;
	CGFloat strokeOneTopLeftYDefault;
	CGFloat strokeOneBottomXDefault;
	CGFloat strokeOneBottomYDefault;
	CGFloat strokeOneTopRightXDefault;
	CGFloat strokeOneTopRightYDefault;
	CGFloat strokeOneEndXDefault;
	CGFloat strokeOneEndYDefault;
	
	CGFloat strokeTwoStartXDefault;
	CGFloat strokeTwoStartYDefault;
	CGFloat strokeTwoEndXDefault;
	CGFloat strokeTwoEndYDefault;
	
	CGFloat strokeThreeStartXDefault;
	CGFloat strokeThreeStartYDefault;
	CGFloat strokeThreeRadiusXDefault;
	CGFloat strokeThreeRadiusYDefault;
	CGFloat strokeThreeMiddleXDefault;
	CGFloat strokeThreeMiddleYDefault;
	CGFloat strokeThreeNextRadiusXDefault;
	CGFloat strokeThreeNextRadiusYDefault;
	CGFloat strokeThreeRightXDefault;
	CGFloat strokeThreeRightYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneEndX;
	CGFloat strokeOneEndY;
	CGFloat strokeOneTopLeftX;
	CGFloat strokeOneTopLeftY;
	CGFloat strokeOneBottomX;
	CGFloat strokeOneBottomY;
	CGFloat strokeOneTopRightX;
	CGFloat strokeOneTopRightY;
	
	CGPoint strokeTwoStart;
	CGFloat strokeTwoEndX;
	CGFloat strokeTwoEndY;
	
	CGPoint strokeThreeStart;
	CGFloat strokeThreeRadiusX;
	CGFloat strokeThreeRadiusY;
	CGFloat strokeThreeRadiusLength;
	CGFloat strokeThreeStartRadians;
	CGFloat strokeThreeEndRadians;
	BOOL strokeThreeDirection;
	CGFloat strokeThreeMiddleX;
	CGFloat strokeThreeMiddleY;
	CGFloat strokeThreeNextRadiusX;
	CGFloat strokeThreeNextRadiusY;
	CGFloat strokeThreeNextRadiusLength;
	CGFloat strokeThreeNextStartRadians;
	CGFloat strokeThreeNextEndRadians;
	BOOL strokeThreeNextDirection;
	CGFloat strokeThreeRightX;
	CGFloat strokeThreeRightY;
    
    BOOL strokeSoundSettingsBoolFlag;
    
}

-(void)alterAnimationSpeed:(float)multiplier;

@property (nonatomic, retain) NSString *currentLetter;

@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) SoundEffect *stroke2Sound;
@property (nonatomic, retain) SoundEffect *stroke3Sound;

@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke2Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke3Sphere;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)showDotStrokeTwo;
-(void)strokeTwo;
-(void)showDotStrokeThree;
-(void)strokeThree;

-(void)implementOrientationCoordinates;

//TODO: Need to fix the sound that keeps playing when power button is hit during an
//animation.

@end

