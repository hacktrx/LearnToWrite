//
//  OneAnimationViewControlleriPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 3/10/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface OneAnimationViewControlleriPhone : UIViewController {
    
    NSString *currrentLetter;
    
	CGFloat animationSpeedMultiplier;
	
	SoundEffect	*stroke1Sound;
	
	IBOutlet UIImageView *stroke1Sphere;
	
	
	//These are used as the base coordinate values, which are modified and assigned to
	//adjust the actual coordinates being used in the animations for the different
	//orientations.
    
    CGFloat numberOriginX;
    CGFloat numberOriginY;
    
	CGFloat strokeOneStartXDefault;
	CGFloat strokeOneStartYDefault;
	CGFloat strokeOneEndXDefault;
	CGFloat strokeOneEndYDefault;
	
	//These are the final ivars plugged into the animation methods.
	CGPoint strokeOneStart;
	CGFloat strokeOneEndX;
	CGFloat strokeOneEndY;
	
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
