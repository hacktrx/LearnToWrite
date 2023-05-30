//
//  HAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/19/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface HAnimationViewController : UIViewController {
	
	NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	SoundEffect	*stroke2Sound;
	SoundEffect	*stroke3Sound;
	SoundEffect	*stroke4Sound;
	SoundEffect	*stroke5Sound;
	
	IBOutlet UIImageView *stroke1Sphere;
	IBOutlet UIImageView *stroke2Sphere;
	IBOutlet UIImageView *stroke3Sphere;
	IBOutlet UIImageView *stroke4Sphere;
	IBOutlet UIImageView *stroke5Sphere;
	
	//These are used as the base coordinate values, which are modified and assigned to
	//adjust the actual coordinates being used in the animations for the different
	//orientations.
    
    CGFloat capitalLetterOriginX;
    CGFloat capitalLetterOriginY;
    CGFloat smallLetterOriginX;
    CGFloat smallLetterOriginY;
    
	CGFloat strokeOneStartXDefault;
	CGFloat strokeOneStartYDefault;
	CGFloat strokeOneEndXDefault;
	CGFloat strokeOneEndYDefault;
	
	CGFloat strokeTwoStartXDefault;
	CGFloat strokeTwoStartYDefault;
	CGFloat strokeTwoEndXDefault;
	CGFloat strokeTwoEndYDefault;
	
	CGFloat strokeThreeStartXDefault;
	CGFloat strokeThreeStartYDefault;
	CGFloat strokeThreeEndXDefault;
	CGFloat strokeThreeEndYDefault;
	
	CGFloat strokeFourStartXDefault;
	CGFloat strokeFourStartYDefault;
	CGFloat strokeFourEndXDefault;
	CGFloat strokeFourEndYDefault;
	
	CGFloat strokeFiveStartXDefault;
	CGFloat strokeFiveStartYDefault;
	CGFloat strokeFiveRadiusXDefault;
	CGFloat strokeFiveRadiusYDefault;
	CGFloat strokeFiveEndXDefault;
	CGFloat strokeFiveEndYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneEndX;
	CGFloat strokeOneEndY;
	
	CGPoint strokeTwoStart;
	CGFloat strokeTwoEndX;
	CGFloat strokeTwoEndY;
	
	CGPoint strokeThreeStart;
	CGFloat strokeThreeEndX;
	CGFloat strokeThreeEndY;
	
	CGPoint strokeFourStart;
	CGFloat strokeFourEndX;
	CGFloat strokeFourEndY;
	
	CGPoint strokeFiveStart;
	CGFloat strokeFiveRadiusX;
	CGFloat strokeFiveRadiusY;
	CGFloat strokeFiveRadiusLength;
	CGFloat strokeFiveStartRadians;
	CGFloat strokeFiveEndRadians;
	BOOL strokeFiveDirection;
	CGFloat strokeFiveEndX;
	CGFloat strokeFiveEndY;
    
    BOOL strokeSoundSettingsBoolFlag;
    
}

-(void)alterAnimationSpeed:(float)multiplier;

@property (nonatomic, retain) NSString *currentLetter;

@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) SoundEffect *stroke2Sound;
@property (nonatomic, retain) SoundEffect *stroke3Sound;
@property (nonatomic, retain) SoundEffect *stroke4Sound;
@property (nonatomic, retain) SoundEffect *stroke5Sound;

@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke2Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke3Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke4Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke5Sphere;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)showDotStrokeTwo;
-(void)strokeTwo;
-(void)showDotStrokeThree;
-(void)strokeThree;
-(void)showDotStrokeFour;
-(void)strokeFour;
-(void)showDotStrokeFive;
-(void)strokeFive;

-(void)implementOrientationCoordinates;

@end
