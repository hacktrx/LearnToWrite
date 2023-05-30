//
//  WAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/20/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface WAnimationViewController : UIViewController {

	NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	SoundEffect	*stroke2Sound;
	
	IBOutlet UIImageView *stroke1Sphere;
	IBOutlet UIImageView *stroke2Sphere;
	
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
	CGFloat strokeTwoTopLeftXDefault;
	CGFloat strokeTwoTopLeftYDefault;
	CGFloat strokeTwoBottomXDefault;
	CGFloat strokeTwoBottomYDefault;
	CGFloat strokeTwoTopRightXDefault;
	CGFloat strokeTwoTopRightYDefault;
	CGFloat strokeTwoEndXDefault;
	CGFloat strokeTwoEndYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneTopLeftX;
	CGFloat strokeOneTopLeftY;
	CGFloat strokeOneBottomX;
	CGFloat strokeOneBottomY;
	CGFloat strokeOneTopRightX;
	CGFloat strokeOneTopRightY;
	CGFloat strokeOneEndX;
	CGFloat strokeOneEndY;
	
	CGPoint strokeTwoStart;
	CGFloat strokeTwoTopLeftX;
	CGFloat strokeTwoTopLeftY;
	CGFloat strokeTwoBottomX;
	CGFloat strokeTwoBottomY;
	CGFloat strokeTwoTopRightX;
	CGFloat strokeTwoTopRightY;
	CGFloat strokeTwoEndX;
	CGFloat strokeTwoEndY;
    
    BOOL strokeSoundSettingsBoolFlag;
    
}

-(void)alterAnimationSpeed:(float)multiplier;

@property (nonatomic, retain) NSString *currentLetter;

@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) SoundEffect *stroke2Sound;

@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke2Sphere;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)showDotStrokeTwo;
-(void)strokeTwo;

-(void)implementOrientationCoordinates;

@end

