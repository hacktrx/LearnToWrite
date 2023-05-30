//
//  ChalkboardView.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@class ChalkboardView;
@class ChalkboardViewController;

@protocol ChalkboardViewDelegateiPad <NSObject>

- (void)chalkboardView:(ChalkboardView *)chalkboardView firstTouchAtPoint:(CGPoint)point;
- (void)chalkboardView:(ChalkboardView *)chalkboardView nextTouchAtPoint:(CGPoint)point;
- (void)chalkboardView:(ChalkboardView *)chalkboardView lastTouchAtPoint:(CGPoint)point;

@end

//CONSTANTS:

//FIX THIS v4.0
//#define kBrushOpacity		(1.0 / 3.0) Don't use this.
//#define kBrushPixelStep		2//3 Made this an ivar in 4.1
//#define kBrushScale			1 Made this an ivar in 4.1
//#define kLuminosity			0.75 Don't use this.
//#define kSaturation			1.0 Dont' use this.


@interface ChalkboardView : UIView {
	
	// The pixel dimensions of the backbuffer
	GLint backingWidth;
	GLint backingHeight;
	
	EAGLContext *context;
	
	// OpenGL names for the renderbuffer and framebuffers used to render to this view
	GLuint viewRenderbuffer, viewFramebuffer;
	
	// OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist)
	GLuint depthRenderbuffer;
	
	GLuint		brushTexture;
	CGPoint	location;
	CGPoint	previousLocation;
	Boolean	firstTouch;
	Boolean	needsErase;
	
	NSMutableArray*	recordedPaths;
	CGImageRef			brushImage;
	CGContextRef		brushContext;
	GLubyte			*brushData;
	size_t				width, height;
		
	//Provide an outlet to the AnimationView for displaying where the touches occure
	//when I'm running the console
	IBOutlet UIView *myAnimationView;
	
	//Need an outlet to this so I can call the stopAnimations method at the same time I erase the
	//chalkboard on a device rotation.
	IBOutlet ChalkboardViewController *chalkboardViewController;
	
    //Added for v4.1
    float myBrushScale;
    float myBrushPixelStep;
}


@property(nonatomic, readwrite) CGPoint location;
@property(nonatomic, readwrite) CGPoint previousLocation;
@property(nonatomic, retain) IBOutlet UIView *myAnimationView;
@property(nonatomic, retain) IBOutlet ChalkboardViewController *chalkboardViewController;
@property (weak) id<ChalkboardViewDelegateiPad> delegate;

-(IBAction)eraseChalkboard:(id)sender;
//This separate erase method is called from the erase button via ChalkboardViewController.
//It's needed separately from the eraseChalkboard one because I don't want to stop animations
//when the erase button is pushed, but I do on device rotations (which is when the other method
//gets called.
-(void)erase;
+ (UIImage*) getMyBrushImage;
+ (void) setMyBrushImage:(UIImage*)newMyBrushImage;
+ (void)initialize;
-(void)changeBrush:(id)sender;

-(void)drawStrokeFromPoint:(CGPoint)firstPoint toPoint:(CGPoint)secondPoint;

@end
