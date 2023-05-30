//
//  CAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 5/15/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface CAnimationViewController : UIViewController {
	
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
	CGFloat strokeOneRadiusXDefault;
	CGFloat strokeOneRadiusYDefault;
	
	CGFloat strokeTwoStartXDefault;
	CGFloat strokeTwoStartYDefault;
	CGFloat strokeTwoRadiusXDefault;
	CGFloat strokeTwoRadiusYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneRadiusX;
	CGFloat strokeOneRadiusY;
	CGFloat strokeOneRadiusLength;
	CGFloat strokeOneStartRadians;
	CGFloat strokeOneEndRadians;
	BOOL strokeOneDirection;
	
	CGPoint strokeTwoStart;
	CGFloat strokeTwoRadiusX;
	CGFloat strokeTwoRadiusY;
	CGFloat strokeTwoRadiusLength;
	CGFloat strokeTwoStartRadians;
	CGFloat strokeTwoEndRadians;
	BOOL strokeTwoDirection;
	
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
