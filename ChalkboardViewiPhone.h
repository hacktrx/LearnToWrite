//
//  ChalkboardViewiPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 9/30/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@class ChalkboardViewiPhone;
@class ChalkboardViewControlleriPhone;

@protocol ChalkboardViewDelegate <NSObject>

- (void)chalkboardView:(ChalkboardViewiPhone *)chalkboardView firstTouchAtPoint:(CGPoint)point;
- (void)chalkboardView:(ChalkboardViewiPhone *)chalkboardView nextTouchAtPoint:(CGPoint)point;
- (void)chalkboardView:(ChalkboardViewiPhone *)chalkboardView lastTouchAtPoint:(CGPoint)point;

@end

//CONSTANTS:
//#define kBrushOpacity		(1.0 / 3.0)
//#define kBrushPixelStep		1//This is set to 2 on the iPad version.FYI This is like the flow of the ink. Lower number, the higher the flow rate.
//#define kBrushScale			1//This is set to 1 on the iPad version.
//#define kLuminosity			0.75
//#define kSaturation			1.0


@interface ChalkboardViewiPhone : UIView {
	
	// The pixel dimensions of the backbuffer
	GLint backingWidth;
	GLint backingHeight;
	
	EAGLContext *context;
	
	// OpenGL names for the renderbuffer and framebuffers used to render to this view
	GLuint viewRenderbuffer, viewFramebuffer;
	
	// OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist)
	GLuint depthRenderbuffer;
	
	GLuint	brushTexture;
	CGPoint	location;
	CGPoint	previousLocation;
	Boolean	firstTouch;
	Boolean	needsErase;
	        
	CGImageRef		brushImageiPhone;
	CGContextRef	brushContext;
	GLubyte         *brushData;
	size_t			width, height;
    
	//Provide an outlet to the AnimationView for displaying where the touches occure
	//when I'm running the console
	IBOutlet UIView *myAnimationViewiPhone;
	
	//Need an outlet to this so I can call the stopAnimations method at the same time I erase the
	//chalkboard on a device rotation.
	IBOutlet ChalkboardViewControlleriPhone *chalkboardViewControlleriPhone;

    float myBrushScale;
    float myBrushPixelStep;
}


@property(nonatomic, readwrite) CGPoint location;
@property(nonatomic, readwrite) CGPoint previousLocation;
@property(nonatomic, retain) IBOutlet UIView *myAnimationViewiPhone;
@property(nonatomic, retain) IBOutlet ChalkboardViewControlleriPhone *chalkboardViewControlleriPhone;
@property (weak) id<ChalkboardViewDelegate> delegate;

-(IBAction)eraseChalkboardiPhone:(id)sender;

//This separate erase method is called from the erase button via ChalkboardViewController.
//It's needed separately from the eraseChalkboard one because I don't want to stop animations
//when the erase button is pushed, but I do on device rotations (which is when the other method
//gets called.
-(void)eraseiPhone;
+ (UIImage*) getMyBrushImageiPhone;
+ (void) setMyBrushImageiPhone:(UIImage*)newMyBrushImageiPhone;
+ (void)initialize;
-(void)changeBrushiPhone:(id)sender;

-(void)drawStrokeFromPoint:(CGPoint)firstPoint toPoint:(CGPoint)secondPoint;

@end




