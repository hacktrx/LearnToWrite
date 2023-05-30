//
//  FourAnimationViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 5/21/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "FourAnimationViewController.h"
#import "SoundEffect.h"
#import <QuartzCore/QuartzCore.h>

@interface FourAnimationViewController ()

@end

@implementation FourAnimationViewController

@synthesize currentLetter;
@synthesize stroke1Sound;
@synthesize stroke1Sphere;
@synthesize stroke2Sound;
@synthesize stroke2Sphere;
@synthesize strokeSoundSettingsBoolFlag;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    numberOriginX = 123;
    numberOriginY = 378;
    
    if (strokeSoundSettingsBoolFlag == 1) {
        
        // Load the sounds
        NSBundle *mainBundle = [NSBundle mainBundle];
        stroke1Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke1type1" ofType:@"caf"]];
        stroke2Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke2type1" ofType:@"caf"]];
        
    }
    
    //Default portrait orientation coordinates.
    strokeOneStartXDefault = numberOriginX;
    strokeOneStartYDefault = numberOriginY;
    strokeOneEndXDefault = numberOriginX;
    strokeOneEndYDefault = numberOriginY + 59;
    strokeOneRightXDefault = numberOriginX + 73;
    strokeOneRightYDefault = numberOriginY + 59;
    
    strokeTwoStartXDefault = numberOriginX + 60;
    strokeTwoStartYDefault = numberOriginY;
    strokeTwoEndXDefault = numberOriginX + 60;
    strokeTwoEndYDefault = numberOriginY + 117;
    
    [self implementOrientationCoordinates];
    
    //Position the redSphere at the place where the first stroke starts.
    [stroke1Sphere setCenter:strokeOneStart];
    [stroke2Sphere setCenter:strokeTwoStart];
    
    [super viewDidLoad];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

#pragma mark -
#pragma mark Implementing Orientation Coordinates

-(void)implementOrientationCoordinates {
    
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        //Change the default coordinates used for animations to match the landscape orientation layout.
        strokeOneStart = CGPointMake((strokeOneStartXDefault + 0), (strokeOneStartYDefault - 0));
        strokeOneEndX = strokeOneEndXDefault + 0;
        strokeOneEndY = strokeOneEndYDefault - 0;
        strokeOneRightX = strokeOneRightXDefault + 0;
        strokeOneRightY = strokeOneRightYDefault - 0;
        
        strokeTwoStart = CGPointMake((strokeTwoStartXDefault + 0), (strokeTwoStartYDefault - 0));
		strokeTwoEndX = strokeTwoEndXDefault + 0;
		strokeTwoEndY = strokeTwoEndYDefault - 0;
        
    }
    
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        //Put any code here for portrait orientation.
        strokeOneStart = CGPointMake(strokeOneStartXDefault, strokeOneStartYDefault);
        strokeOneEndX = strokeOneEndXDefault;
        strokeOneEndY = strokeOneEndYDefault;
        strokeOneRightX = strokeOneRightXDefault;
        strokeOneRightY = strokeOneRightYDefault;
        
        strokeTwoStart = CGPointMake(strokeTwoStartXDefault, strokeTwoStartYDefault);
		strokeTwoEndX = strokeTwoEndXDefault;
		strokeTwoEndY = strokeTwoEndYDefault;
        
    }
}

#pragma mark -


#pragma mark Animation Speed


-(void)alterAnimationSpeed:(float)multiplier {
    
    animationSpeedMultiplier = multiplier;
}

#pragma mark -


#pragma mark Animation Methods

-(void)playAnimation {
    
    [self showDotStrokeOne];
}

-(void)showDotStrokeOne {
    
    //Create a basic animation to reveal the red sphere.
    CABasicAnimation *showDotStrokeOneAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    showDotStrokeOneAnimation.delegate = self;
    showDotStrokeOneAnimation.removedOnCompletion = YES;
    showDotStrokeOneAnimation.duration = 2.0 * (-1 * animationSpeedMultiplier);
    showDotStrokeOneAnimation.autoreverses = NO;
    showDotStrokeOneAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    showDotStrokeOneAnimation.toValue = [NSNumber numberWithFloat:1.0];
    [showDotStrokeOneAnimation setValue:@"ShowDotStrokeOneAnimation" forKey:@"AnimationPhase"];
    [stroke1Sphere.layer addAnimation:showDotStrokeOneAnimation forKey:@"showDotAStrokeOneAnimation"];
    
}

-(void)strokeOne {
    
    // Create a keyframe animation to follow a path for the last stroke.
	CAKeyframeAnimation *strokeOneAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	strokeOneAnimation.delegate = self;
	strokeOneAnimation.removedOnCompletion = NO;
	strokeOneAnimation.fillMode = kCAFillModeForwards;
	strokeOneAnimation.duration = 1.75 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeOnePath = CGPathCreateMutable();
	CGPathMoveToPoint(strokeOnePath, NULL, stroke1Sphere.center.x, stroke1Sphere.center.y);
	CGPathAddLineToPoint(strokeOnePath, NULL, strokeOneEndX, strokeOneEndY);
    CGPathAddLineToPoint(strokeOnePath, NULL, strokeOneRightX, strokeOneRightY);
	strokeOneAnimation.path = strokeOnePath;
	CGPathRelease(strokeOnePath);
	[strokeOneAnimation setValue:@"StrokeOneAnimation" forKey:@"AnimationPhase"];
	[stroke1Sphere.layer addAnimation:strokeOneAnimation forKey:@"strokeOneAnimation"];
    
}

-(void)showDotStrokeTwo {
	//Create a basic animation to reveal the red sphere.
	CABasicAnimation *showDotStrokeTwoAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	showDotStrokeTwoAnimation.delegate = self;
	showDotStrokeTwoAnimation.removedOnCompletion = YES;
	showDotStrokeTwoAnimation.duration = 1.0 * (-1 * animationSpeedMultiplier);
	showDotStrokeTwoAnimation.autoreverses = NO;
	showDotStrokeTwoAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	showDotStrokeTwoAnimation.toValue = [NSNumber numberWithFloat:1.0];
	[showDotStrokeTwoAnimation setValue:@"ShowDotStrokeTwoAnimation" forKey:@"AnimationPhase"];
	[stroke2Sphere.layer addAnimation:showDotStrokeTwoAnimation forKey:@"showDotStrokeTwoAnimation"];
}

-(void)strokeTwo {
	
	// Create a keyframe animation to follow a path for the last stroke.
	CAKeyframeAnimation *strokeTwoAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	strokeTwoAnimation.delegate = self;
	strokeTwoAnimation.removedOnCompletion = NO;
	strokeTwoAnimation.fillMode = kCAFillModeForwards;
	strokeTwoAnimation.duration = 1.25 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeTwoPath = CGPathCreateMutable();
	CGPathMoveToPoint(strokeTwoPath, NULL, stroke2Sphere.center.x, stroke2Sphere.center.y);
	CGPathAddLineToPoint(strokeTwoPath, NULL, strokeTwoEndX, strokeTwoEndY);
	strokeTwoAnimation.path = strokeTwoPath;
	CGPathRelease(strokeTwoPath);
	[strokeTwoAnimation setValue:@"StrokeTwoAnimation" forKey:@"AnimationPhase"];
	[stroke2Sphere.layer addAnimation:strokeTwoAnimation forKey:@"strokeTwoAnimation"];
}


//Things to activate on start of various animations.
-(void)animationDidStart:(CAAnimation *)theAnimation {
    
    NSString* value = [theAnimation valueForKey:@"AnimationPhase"];
    if ([value isEqualToString:@"ShowDotStrokeOneAnimation"])
    {
        stroke1Sphere.alpha = 1;
        
        NSLog(@"The center of redSphere at the start is %f, %f", stroke1Sphere.center.x, stroke1Sphere.center.y);
        
        return;
    }
    
    if ([value isEqualToString:@"ShowDotStrokeTwoAnimation"])
    {
		stroke2Sphere.alpha = 1;
		
		return;
    }
    
    //Add any future keyed animation operations when the animations are started.
    
}


//Things to activate on the completion of various animations.
-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    
    NSString* value = [theAnimation valueForKey:@"AnimationPhase"];
    if ([value isEqualToString:@"ShowDotStrokeOneAnimation"])
    {
        
        //Start next animation.
        [self strokeOne];
        
        return;
    }
    
    if ([value isEqualToString:@"StrokeOneAnimation"])
    {
        
        //Reset the redSphere's alpha to 0, ready for next reveal animation.
        stroke1Sphere.alpha = 0;
        
        [stroke1Sound play];
        
        //Start next animation.
		[self showDotStrokeTwo];
        
        return;
    }	
    
    if ([value isEqualToString:@"ShowDotStrokeTwoAnimation"])
    {
		
		//Start next animation.
		[self strokeTwo];
		
		return;
    }
	
	if ([value isEqualToString:@"StrokeTwoAnimation"])
    {
		
		//Reset the redSphere's alpha to 0, ready for next reveal animation.
		stroke2Sphere.alpha = 0;
		
		[stroke2Sound play];
		
		return;
    }	
    
    //Add any future keyed animation operations when the animations are stopped.
    
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.stroke1Sound = nil;
    self.stroke1Sphere = nil;
    self.stroke2Sound = nil;
    self.stroke2Sphere = nil;
}



@end