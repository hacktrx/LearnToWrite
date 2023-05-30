//
//  AAnimationViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/29/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import "AAnimationViewController.h"
#import "SoundEffect.h"
#import <QuartzCore/QuartzCore.h>

@implementation AAnimationViewController

@synthesize currentLetter;
@synthesize stroke1Sound;
@synthesize stroke2Sound;
@synthesize stroke3Sound;
@synthesize stroke4Sound;
@synthesize stroke5Sound;
@synthesize stroke1Sphere;
@synthesize stroke2Sphere;
@synthesize stroke3Sphere;
@synthesize stroke4Sphere;
@synthesize stroke5Sphere;

@synthesize strokeSoundSettingsBoolFlag;

#pragma mark StrokeVolumeSliderCell Delegate Method


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:@"AAnimationViewController" bundle:nil])) {
 // Custom initialization
 
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    if ([currentLetter isEqualToString:@"Aa"]) {
        
        capitalLetterOriginX = 122;//-1 was 123
        capitalLetterOriginY = 383;//+207 was 176
        smallLetterOriginX = 251;//-1 was 252
        smallLetterOriginY = 470;//+210 was 260
    }
    
    if ([currentLetter isEqualToString:@"A"]) {
        
        capitalLetterOriginX = 161;//-1 was 162
        capitalLetterOriginY = 383;//+207 was 176
        
    }
    
    if ([currentLetter isEqualToString:@"a"]) {
        
        smallLetterOriginX = 180;//-1 was 181
        smallLetterOriginY = 470;//+207 was 260
    }
    
    
	if (strokeSoundSettingsBoolFlag == 1) {
        
        // Load the sounds
        NSBundle *mainBundle = [NSBundle mainBundle];
        stroke1Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke1type1" ofType:@"caf"]];
        stroke2Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke2type1" ofType:@"caf"]];
        stroke3Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke3type1" ofType:@"caf"]];
        stroke4Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke2type1" ofType:@"caf"]];
        stroke5Sound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"stroke1type1" ofType:@"caf"]];
        
	}
    
    //Default portrait orientation coordinates.
	strokeOneStartXDefault = capitalLetterOriginX;
	strokeOneStartYDefault = capitalLetterOriginY;
	strokeOneEndXDefault = capitalLetterOriginX - 61;
	strokeOneEndYDefault = capitalLetterOriginY + 111;
	
	strokeTwoStartXDefault = capitalLetterOriginX;
	strokeTwoStartYDefault = capitalLetterOriginY;
	strokeTwoEndXDefault = capitalLetterOriginX + 56;
	strokeTwoEndYDefault = capitalLetterOriginY + 111;
	
	strokeThreeStartXDefault = capitalLetterOriginX - 40;
	strokeThreeStartYDefault = capitalLetterOriginY + 72;
	strokeThreeEndXDefault = capitalLetterOriginX + 38;
	strokeThreeEndYDefault = capitalLetterOriginY + 73;
	
	strokeFourStartXDefault = smallLetterOriginX;
	strokeFourStartYDefault = smallLetterOriginY;
	strokeFourRadiusXDefault = smallLetterOriginX - 27;
	strokeFourRadiusYDefault = smallLetterOriginY;
	strokeFourRadiusLength = 27;
	strokeFourStartRadians = DEGREES_TO_RADIANS(0);
	strokeFourEndRadians = DEGREES_TO_RADIANS(360);
	strokeFourDirection = YES;
	
	strokeFiveStartXDefault = smallLetterOriginX;
	strokeFiveStartYDefault = smallLetterOriginY - 26;
	strokeFiveEndXDefault = smallLetterOriginX;
	strokeFiveEndYDefault = smallLetterOriginY + 26;
    
    [self implementOrientationCoordinates];
    
    [stroke1Sphere setCenter:strokeOneStart];
	[stroke2Sphere setCenter:strokeTwoStart];
	[stroke3Sphere setCenter:strokeThreeStart];
	[stroke4Sphere setCenter:strokeFourStart];
	[stroke5Sphere setCenter:strokeFiveStart];
    
    [super viewDidLoad];
	
	NSLog(@"viewDidLoad just fired in AAnimationViewController");
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

#pragma mark -
#pragma mark Implementing Orientation Coordinates

-(void)implementOrientationCoordinates {
	
	if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        /*
        //Change the default coordinates used for animations to match the landscape orientation layout.
        strokeOneStart = CGPointMake((strokeOneStartXDefault + 80), (strokeOneStartYDefault - 73));
        strokeOneEndX = strokeOneEndXDefault + 80;
        strokeOneEndY = strokeOneEndYDefault - 73;
        
        strokeTwoStart = CGPointMake((strokeTwoStartXDefault + 80), (strokeTwoStartYDefault - 73));
        strokeTwoEndX = strokeTwoEndXDefault + 80;
        strokeTwoEndY = strokeTwoEndYDefault - 73;
        
        strokeThreeStart = CGPointMake((strokeThreeStartXDefault + 80), (strokeThreeStartYDefault - 73));
        strokeThreeEndX = strokeThreeEndXDefault + 80;
        strokeThreeEndY = strokeThreeEndYDefault - 73;
        
        strokeFourStart = CGPointMake((strokeFourStartXDefault + 80), (strokeFourStartYDefault - 73));
        strokeFourRadiusX = strokeFourRadiusXDefault + 80;
        strokeFourRadiusY = strokeFourRadiusYDefault - 73;
        
        strokeFiveStart = CGPointMake((strokeFiveStartXDefault + 80), (strokeFiveStartYDefault - 73));
        strokeFiveEndX = strokeFiveEndXDefault + 80;
        strokeFiveEndY = strokeFiveEndYDefault - 73;
        */
        
        //Change the default coordinates used for animations to match the landscape orientation layout.
        strokeOneStart = CGPointMake((strokeOneStartXDefault + 0), (strokeOneStartYDefault - 0));
        strokeOneEndX = strokeOneEndXDefault + 0;
        strokeOneEndY = strokeOneEndYDefault - 0;
        
        strokeTwoStart = CGPointMake((strokeTwoStartXDefault + 0), (strokeTwoStartYDefault - 0));
        strokeTwoEndX = strokeTwoEndXDefault + 0;
        strokeTwoEndY = strokeTwoEndYDefault - 0;
        
        strokeThreeStart = CGPointMake((strokeThreeStartXDefault + 0), (strokeThreeStartYDefault - 0));
        strokeThreeEndX = strokeThreeEndXDefault + 0;
        strokeThreeEndY = strokeThreeEndYDefault - 0;
        
        strokeFourStart = CGPointMake((strokeFourStartXDefault + 0), (strokeFourStartYDefault - 0));
        strokeFourRadiusX = strokeFourRadiusXDefault + 0;
        strokeFourRadiusY = strokeFourRadiusYDefault - 0;
        
        strokeFiveStart = CGPointMake((strokeFiveStartXDefault + 0), (strokeFiveStartYDefault - 0));
        strokeFiveEndX = strokeFiveEndXDefault + 0;
        strokeFiveEndY = strokeFiveEndYDefault - 0;
        
	}
	
	if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        //Put any code here for portrait orientation.
        strokeOneStart = CGPointMake(strokeOneStartXDefault, strokeOneStartYDefault);
        strokeOneEndX = strokeOneEndXDefault;
        strokeOneEndY = strokeOneEndYDefault;
        
        strokeTwoStart = CGPointMake(strokeTwoStartXDefault, strokeTwoStartYDefault);
        strokeTwoEndX = strokeTwoEndXDefault;
        strokeTwoEndY = strokeTwoEndYDefault;
        
        strokeThreeStart = CGPointMake(strokeThreeStartXDefault, strokeThreeStartYDefault);
        strokeThreeEndX = strokeThreeEndXDefault;
        strokeThreeEndY = strokeThreeEndYDefault;
        
        strokeFourStart = CGPointMake(strokeFourStartXDefault, strokeFourStartYDefault);
        strokeFourRadiusX = strokeFourRadiusXDefault;
        strokeFourRadiusY = strokeFourRadiusYDefault;
        
        strokeFiveStart = CGPointMake(strokeFiveStartXDefault, strokeFiveStartYDefault);
        strokeFiveEndX = strokeFiveEndXDefault;
        strokeFiveEndY = strokeFiveEndYDefault;
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
	[stroke1Sphere.layer addAnimation:showDotStrokeOneAnimation forKey:@"showDotStrokeOneAnimation"];
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
	strokeTwoAnimation.duration = 1.75 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeTwoPath = CGPathCreateMutable();
	CGPathMoveToPoint(strokeTwoPath, NULL, stroke2Sphere.center.x, stroke2Sphere.center.y);
	CGPathAddLineToPoint(strokeTwoPath, NULL, strokeTwoEndX, strokeTwoEndY);
	strokeTwoAnimation.path = strokeTwoPath;
	CGPathRelease(strokeTwoPath);
	[strokeTwoAnimation setValue:@"StrokeTwoAnimation" forKey:@"AnimationPhase"];
	[stroke2Sphere.layer addAnimation:strokeTwoAnimation forKey:@"strokeTwoAnimation"];
}

-(void)showDotStrokeThree {
    
	//Create a basic animation to reveal the red sphere.
	CABasicAnimation *showDotStrokeThreeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	showDotStrokeThreeAnimation.delegate = self;
	showDotStrokeThreeAnimation.removedOnCompletion = YES;
	showDotStrokeThreeAnimation.duration = 1.0 * (-1 * animationSpeedMultiplier);
	showDotStrokeThreeAnimation.autoreverses = NO;
	showDotStrokeThreeAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	showDotStrokeThreeAnimation.toValue = [NSNumber numberWithFloat:1.0];
	[showDotStrokeThreeAnimation setValue:@"ShowDotStrokeThreeAnimation" forKey:@"AnimationPhase"];
	[stroke3Sphere.layer addAnimation:showDotStrokeThreeAnimation forKey:@"showDotStrokeThreeAnimation"];
}

-(void)strokeThree {
    
	// Create a keyframe animation to follow a path for the last stroke.
	CAKeyframeAnimation *strokeThreeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	strokeThreeAnimation.delegate = self;
	strokeThreeAnimation.removedOnCompletion = NO;
	strokeThreeAnimation.fillMode = kCAFillModeForwards;
	strokeThreeAnimation.duration = 1.25 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeThreePath = CGPathCreateMutable();
	// Start the path at the sphere's current location.
	CGPathMoveToPoint(strokeThreePath, NULL, stroke3Sphere.center.x, stroke3Sphere.center.y);
	CGPathAddLineToPoint(strokeThreePath, NULL, strokeThreeEndX, strokeThreeEndY);
	strokeThreeAnimation.path = strokeThreePath;
	CGPathRelease(strokeThreePath);
	[strokeThreeAnimation setValue:@"StrokeThreeAnimation" forKey:@"AnimationPhase"];
	[stroke3Sphere.layer addAnimation:strokeThreeAnimation forKey:@"strokeThreeAnimation"];
}

-(void)showDotStrokeFour {
    
	//Create a basic animation to reveal the red sphere.
	CABasicAnimation *showDotStrokeFourAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	showDotStrokeFourAnimation.delegate = self;
	showDotStrokeFourAnimation.removedOnCompletion = YES;
	showDotStrokeFourAnimation.duration = 1.0 * (-1 * animationSpeedMultiplier);
	showDotStrokeFourAnimation.autoreverses = NO;
	showDotStrokeFourAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	showDotStrokeFourAnimation.toValue = [NSNumber numberWithFloat:1.0];
	[showDotStrokeFourAnimation setValue:@"ShowDotStrokeFourAnimation" forKey:@"AnimationPhase"];
	[stroke4Sphere.layer addAnimation:showDotStrokeFourAnimation forKey:@"showDotStrokeFourAnimation"];
}

-(void)strokeFour {
	
	// Create a keyframe animation to follow a path for the last stroke.
	CAKeyframeAnimation *strokeFourAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	strokeFourAnimation.delegate = self;
	strokeFourAnimation.removedOnCompletion = NO;
	strokeFourAnimation.fillMode = kCAFillModeForwards;
	strokeFourAnimation.duration = 4 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeFourPath = CGPathCreateMutable();
	// Start the path at the sphere's current location.
	//CGPathMoveToPoint(strokeFourPath, NULL, stroke4Sphere.center.x, stroke4Sphere.center.y);
	CGPathAddArc(strokeFourPath, NULL, strokeFourRadiusX, strokeFourRadiusY, strokeFourRadiusLength,
                 strokeFourStartRadians, strokeFourEndRadians, strokeFourDirection);
	strokeFourAnimation.path = strokeFourPath;
	CGPathRelease(strokeFourPath);
	[strokeFourAnimation setValue:@"StrokeFourAnimation" forKey:@"AnimationPhase"];
	[stroke4Sphere.layer addAnimation:strokeFourAnimation forKey:@"strokeFourAnimation"];
}

-(void)showDotStrokeFive {
	
	//Create a basic animation to reveal the red sphere.
	CABasicAnimation *showDotStrokeFiveAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	showDotStrokeFiveAnimation.delegate = self;
	showDotStrokeFiveAnimation.removedOnCompletion = YES;
	showDotStrokeFiveAnimation.duration = 1.0 * (-1 * animationSpeedMultiplier);
	showDotStrokeFiveAnimation.autoreverses = NO;
	showDotStrokeFiveAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	showDotStrokeFiveAnimation.toValue = [NSNumber numberWithFloat:1.0];
	[showDotStrokeFiveAnimation setValue:@"ShowDotStrokeFiveAnimation" forKey:@"AnimationPhase"];
	[stroke5Sphere.layer addAnimation:showDotStrokeFiveAnimation forKey:@"showDotStrokeFiveAnimation"];
}

-(void)strokeFive {
	
	// Create a keyframe animation to follow a path for the last stroke.
	CAKeyframeAnimation *strokeFiveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	strokeFiveAnimation.delegate = self;
	strokeFiveAnimation.removedOnCompletion = NO;
	strokeFiveAnimation.fillMode = kCAFillModeForwards;
	strokeFiveAnimation.duration = 1.25 * (-1 * animationSpeedMultiplier);
	// Create the path for the last stroke.
	CGMutablePathRef strokeFivePath = CGPathCreateMutable();
	// Start the path at the sphere's current location.
	CGPathMoveToPoint(strokeFivePath, NULL, stroke5Sphere.center.x, stroke5Sphere.center.y);
	CGPathAddLineToPoint(strokeFivePath, NULL, strokeFiveEndX, strokeFiveEndY);
	strokeFiveAnimation.path = strokeFivePath;
	CGPathRelease(strokeFivePath);
	[strokeFiveAnimation setValue:@"StrokeFiveAnimation" forKey:@"AnimationPhase"];
	[stroke5Sphere.layer addAnimation:strokeFiveAnimation forKey:@"strokeFiveAnimation"];
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
	
	if ([value isEqualToString:@"ShowDotStrokeThreeAnimation"])
    {
		stroke3Sphere.alpha = 1;
        
		return;
    }
	
	if ([value isEqualToString:@"ShowDotStrokeFourAnimation"])
    {
        
		stroke4Sphere.alpha = 1;
        
		return;
    }
	
	if ([value isEqualToString:@"ShowDotStrokeFiveAnimation"])
    {
		stroke5Sphere.alpha = 1;
        
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
		
		//TODO:Put correct audio sound here.
		//Play audio file for "Stroke ____".
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
		
		//TODO:Put correct audio sound here.
		//Play audio file for "Stroke ____".
		[stroke2Sound play];
		
		//Start next animation.
		[self showDotStrokeThree];
		
		return;
    }	
	
	if ([value isEqualToString:@"ShowDotStrokeThreeAnimation"])
    {
        
		//Start next animation.
		[self strokeThree];
		
		return;
    }	
	
	if ([value isEqualToString:@"StrokeThreeAnimation"])
    {
		
		//Reset the redSphere's alpha to 0, ready for next reveal animation.
		stroke3Sphere.alpha = 0;
		
		//TODO:Put correct audio sound here.
		//Play audio file for "Stroke ____".
		[stroke3Sound play];
        
		[self showDotStrokeFour];
        
        
        
        if ([currentLetter isEqualToString:@"A"]) {
            
            self.view.hidden = YES;
            [self.view removeFromSuperview];
            self.view = nil;
            self.stroke4Sound = nil;
            self.stroke5Sound = nil;
        }
        
		return;
    }
	
	if ([value isEqualToString:@"ShowDotStrokeFourAnimation"])
    {
        
		//Start next animation.
		[self strokeFour];
		
		return;
    }	
	
	if ([value isEqualToString:@"StrokeFourAnimation"])
    {
        
		//Reset the redSphere's alpha to 0, ready for next reveal animation.
		stroke4Sphere.alpha = 0;
		
		//TODO:Put correct audio sound here.
		//Play audio file for "Stroke ____".
		[stroke4Sound play];
		
		[self showDotStrokeFive];
		
		return;
    }
    
	if ([value isEqualToString:@"ShowDotStrokeFiveAnimation"])
    {
		
		//Start next animation.
		[self strokeFive];
		
		return;
    }	
	
	if ([value isEqualToString:@"StrokeFiveAnimation"])
    {
		
		//Reset the redSphere's alpha to 0, ready for next reveal animation.
		stroke5Sphere.alpha = 0;
		
		//TODO:Put correct audio sound here.
		//Play audio file for "Stroke ____".
		[stroke5Sound play];
		
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
	self.stroke2Sound = nil;
	self.stroke3Sound = nil;
	self.stroke4Sound = nil;
	self.stroke5Sound = nil;
	self.stroke1Sphere = nil;
	self.stroke2Sphere = nil;
	self.stroke3Sphere = nil;
	self.stroke4Sphere = nil;
	self.stroke5Sphere = nil;
    
}




@end