//
//  ThreeAnimationViewControlleriPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 3/12/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface ThreeAnimationViewControlleriPhone : UIViewController {

    NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	
	IBOutlet UIImageView *stroke1Sphere;
    
    CGFloat numberOriginX;
    CGFloat numberOriginY;
    
    CGFloat strokeOneStartXDefault;
    CGFloat strokeOneStartYDefault;
    CGFloat strokeOneRadiusXDefault;
    CGFloat strokeOneRadiusYDefault;
    CGFloat strokeOneEndXDefault;
	CGFloat strokeOneEndYDefault;
	CGFloat strokeOneBottomRadiusXDefault;
	CGFloat strokeOneBottomRadiusYDefault;

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
	CGFloat strokeOneBottomRadiusX;
	CGFloat strokeOneBottomRadiusY;
	CGFloat strokeOneBottomRadiusLength;
	CGFloat strokeOneBottomStartRadians;
	CGFloat strokeOneBottomEndRadians;
	BOOL strokeOneBottomDirection;
    
    BOOL strokeSoundSettingsBoolFlag;
    
}

@property (nonatomic, retain) NSString *currentLetter;
@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)alterAnimationSpeed:(float)multiplier;
-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)implementOrientationCoordinates;

@end
