//
//  GAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/18/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface GAnimationViewController : UIViewController {

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
	CGFloat strokeOneRadiusXDefault;
	CGFloat strokeOneRadiusYDefault;
	CGFloat strokeOneEndXDefault;
	CGFloat strokeOneEndYDefault;
	
	CGFloat strokeTwoStartXDefault;
	CGFloat strokeTwoStartYDefault;
	CGFloat strokeTwoRadiusXDefault;
	CGFloat strokeTwoRadiusYDefault;
	
	CGFloat strokeThreeStartXDefault;
	CGFloat strokeThreeStartYDefault;
	CGFloat strokeThreeRadiusXDefault;
	CGFloat strokeThreeRadiusYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneRadiusX;
	CGFloat strokeOneRadiusY;
	CGFloat strokeOneRadiusLength;
	CGFloat strokeOneStartRadians;
	CGFloat strokeOneEndRadians;
	BOOL strokeOneDirection;
	CGFloat strokeOneEndX;
	CGFloat strokeOneEndY;
	
	CGPoint strokeTwoStart;
	CGFloat strokeTwoRadiusX;
	CGFloat strokeTwoRadiusY;
	CGFloat strokeTwoRadiusLength;
	CGFloat strokeTwoStartRadians;
	CGFloat strokeTwoEndRadians;
	BOOL strokeTwoDirection;
	
	CGPoint strokeThreeStart;
	CGFloat strokeThreeRadiusX;
	CGFloat strokeThreeRadiusY;
	CGFloat strokeThreeRadiusLength;
	CGFloat strokeThreeStartRadians;
	CGFloat strokeThreeEndRadians;
	BOOL strokeThreeDirection;	
    
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
-(void)strokeThree;
-(void)showDotStrokeThree;
-(void)strokeThree;

-(void)implementOrientationCoordinates;

@end
