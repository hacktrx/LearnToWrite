//
//  JAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 6/19/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface JAnimationViewController : UIViewController {

    NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	SoundEffect	*stroke2Sound;
	SoundEffect	*stroke3Sound;
    SoundEffect	*stroke4Sound;
    
	IBOutlet UIImageView *stroke1Sphere;
	IBOutlet UIImageView *stroke2Sphere;
	IBOutlet UIImageView *stroke3Sphere;
    IBOutlet UIImageView *stroke4Sphere;
    
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
	CGFloat strokeTwoEndXDefault;
	CGFloat strokeTwoEndYDefault;
    
	CGFloat strokeThreeStartXDefault;
	CGFloat strokeThreeStartYDefault;
	CGFloat strokeThreeRadiusXDefault;
	CGFloat strokeThreeRadiusYDefault;
	
	CGFloat strokeFourStartXDefault;
	CGFloat strokeFourStartYDefault;
	CGFloat strokeFourRadiusXDefault;
	CGFloat strokeFourRadiusYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneRadiusX;
	CGFloat strokeOneRadiusY;
	CGFloat strokeOneRadiusLength;
	CGFloat strokeOneStartRadians;
	CGFloat strokeOneEndRadians;
	BOOL strokeOneDirection;
	
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
	
	CGPoint strokeFourStart;
	CGFloat strokeFourRadiusX;
	CGFloat strokeFourRadiusY;
	CGFloat strokeFourRadiusLength;
	CGFloat strokeFourStartRadians;
	CGFloat strokeFourEndRadians;
	BOOL strokeFourDirection;
	
    BOOL strokeSoundSettingsBoolFlag;
    
}

-(void)alterAnimationSpeed:(float)multiplier;

@property (nonatomic, retain) NSString *currentLetter;

@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) SoundEffect *stroke2Sound;
@property (nonatomic, retain) SoundEffect *stroke3Sound;
@property (nonatomic, retain) SoundEffect *stroke4Sound;

@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke2Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke3Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke4Sphere;

@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)showDotStrokeTwo;
-(void)strokeThree;
-(void)showDotStrokeThree;
-(void)strokeThree;
-(void)showDotStrokeFour;
-(void)strokeFour;

-(void)implementOrientationCoordinates;

@end
