//
//  FourAnimationViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 5/21/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

// pi is approximately equal to 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@class SoundEffect;

@interface FourAnimationViewController : UIViewController {
    
    NSString *currrentLetter;
    
    CGFloat animationSpeedMultiplier;
    
    SoundEffect	*stroke1Sound;
    SoundEffect	*stroke2Sound;
    
    IBOutlet UIImageView *stroke1Sphere;
    IBOutlet UIImageView *stroke2Sphere;
    
    //These are used as the base coordinate values, which are modified and assigned to
    //adjust the actual coordinates being used in the animations for the different
    //orientations.
    
    CGFloat numberOriginX;
    CGFloat numberOriginY;
    
    CGFloat strokeOneStartXDefault;
    CGFloat strokeOneStartYDefault;
    CGFloat strokeOneEndXDefault;
    CGFloat strokeOneEndYDefault;
    CGFloat strokeOneRightXDefault;
    CGFloat strokeOneRightYDefault;
    
    CGFloat strokeTwoStartXDefault;
    CGFloat strokeTwoStartYDefault;
    CGFloat strokeTwoEndXDefault;
    CGFloat strokeTwoEndYDefault;
    
    //These are the final ivars plugged into the animation methods.
    CGPoint strokeOneStart;
    CGFloat strokeOneEndX;
    CGFloat strokeOneEndY;
    CGFloat strokeOneRightX;
    CGFloat strokeOneRightY;
    
    CGPoint strokeTwoStart;
    CGFloat strokeTwoEndX;
    CGFloat strokeTwoEndY;
    
    BOOL strokeSoundSettingsBoolFlag;
}

@property (nonatomic, retain) NSString *currentLetter;
@property (nonatomic, retain) SoundEffect *stroke1Sound;
@property (nonatomic, retain) SoundEffect *stroke2Sound;
@property (nonatomic, retain) IBOutlet UIImageView *stroke1Sphere;
@property (nonatomic, retain) IBOutlet UIImageView *stroke2Sphere;
@property (nonatomic, readwrite) BOOL strokeSoundSettingsBoolFlag;

-(void)alterAnimationSpeed:(float)multiplier;
-(void)playAnimation;
-(void)showDotStrokeOne;
-(void)strokeOne;
-(void)showDotStrokeTwo;
-(void)strokeTwo;
-(void)implementOrientationCoordinates;

@end
