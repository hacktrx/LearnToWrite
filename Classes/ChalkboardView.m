//
//  ChalkboardView.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/6/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import "ChalkboardView.h"
#import "ChalkboardViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>

//TODO: not sure if i need this
#import "BrushTableViewController.h"


//CLASS IMPLEMENTATIONS:

// A class extension to declare private methods
@interface ChalkboardView (private)

- (BOOL)createFramebuffer;
- (void)destroyFramebuffer;

@end

//declare static variable so I can change it's value in my BrushTableViewController
//class when we select a particular row - jh
static UIImage *myBrushImage = nil;

@implementation ChalkboardView

@synthesize  location;
@synthesize  previousLocation;
@synthesize myAnimationView;
@synthesize chalkboardViewController;
@synthesize delegate;

//declare static variable methods - jh
+ (UIImage*) getMyBrushImage {
	return myBrushImage;
}

+ (void) setMyBrushImage:(UIImage*)newMyBrushImage{
if(myBrushImage != newMyBrushImage) {
		myBrushImage = newMyBrushImage;
	}
}


//to initialize background color in MainViewController
+ (void)initialize {
	if(! myBrushImage ) {
		myBrushImage = [UIImage imageNamed:@"5Fingerprint_iPad.png"];
	}
    
    
}
//end static variable methods - jh


#pragma mark -
#pragma mark Initialize and Setup of View

// Implement this to override the default layer class (which is [CALayer class]).
// We do this so that our view will be backed by a layer that is capable of OpenGL ES rendering.
+ (Class) layerClass
{
	return [CAEAGLLayer class];
}


// The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {
	    
    if ((self = [super initWithCoder:coder])) {
			
		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
						
		eaglLayer.opaque = NO;

		// In this application, we want to retain the EAGLDrawable contents after a call to presentRenderbuffer.
		eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
										[NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
		
		context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
		
		if (!context || ![EAGLContext setCurrentContext:context]) {
			return nil;
		}
    
//Added for v4.1
        myBrushScale = 1.25;
        myBrushPixelStep = .75;
        
        if ([UIScreen mainScreen].scale > 1.0) {
            myBrushScale = 2.5;
            //myBrushPixelStep = .75; Same for whether it's Retina or not.
        }
        NSLog(@"The brushScale is %f, pixelStep is %f in ChalkboardView.", myBrushScale, myBrushPixelStep);
		
		// Create a texture from an image
		// First create a UIImage object from the data in a image file, and then extract the Core Graphics image
		//below is the old way before I invented the static variable - jh
		//brushImage = [UIImage imageNamed:@"22WhiteFlat.png"].CGImage;
		
		//NSLog(@"The value of brushImage in ChalkboardView before the getMyBrushImage is %d", brushImage);
		//use static variable - jh
		brushImage = [ChalkboardView getMyBrushImage].CGImage;
		
		//NSLog(@"The value of brushImage in ChalkboardView after the getMyBrushImage is %d", brushImage);

		
		// Get the width and height of the image
		width = (CGImageGetWidth(brushImage)) * .5;
		height = (CGImageGetHeight(brushImage)) * .5;
        NSLog(@"Zippy, brushImage width and height are %zi,%zi", width, height);
		
		// Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
		// you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
		
		// Make sure the image exists
		if(brushImage) {
			// Allocate  memory needed for the bitmap context
			brushData = (GLubyte *) calloc(width * height * 4, sizeof(GLubyte));
			// Use  the bitmatp creation function provided by the Core Graphics framework.
			brushContext = CGBitmapContextCreate(brushData, width, width, 8, width * 4, CGImageGetColorSpace(brushImage), kCGImageAlphaPremultipliedLast);
			// After you create the context, you can draw the  image to the context.
			CGContextDrawImage(brushContext, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), brushImage);
			// You don't need the context at this point, so you need to release it to avoid memory leaks.
			CGContextRelease(brushContext);
			// Use OpenGL ES to generate a name for the texture.
			glGenTextures(1, &brushTexture);
			// Bind the texture name. 
			glBindTexture(GL_TEXTURE_2D, brushTexture);
			// Set the texture parameters to use a minifying filter and a linear filer (weighted average)
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

            // Specify a 2D texture image, providing the a pointer to the image data in memory
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, brushData);
			// Release  the image data; it's no longer needed
            free(brushData);
			
			// Enable use of the texture
			glEnable(GL_TEXTURE_2D);
			// Set a blending function to use
			glBlendFunc(GL_SRC_ALPHA, GL_ONE);

			// Enable blending
			glEnable(GL_BLEND);
		}
		
		//TODO:Added this to try and fix the washed out texture when drawing over the same spot - jh
		//This is a way to set the opacity for the texture before using it - jh
		//glColor4f(1.0, 1.0, 1.0, 0.5);
		
		//Set up OpenGL states
		glMatrixMode(GL_PROJECTION);
		
		//i took this out and substituted my own code (below) because with this code,
		//if the device is rotated to landscape the width of the drawable area stays
		//too small.
		/*
		CGRect frame = self.bounds;
		glOrthof(0, frame.size.width, 0, frame.size.height, -1, 1);
		glViewport(0, 0, frame.size.width, frame.size.height);
		*/ 
		
		//TODO: ALTERNATE CODE HERE
		//my try at keeping the layer the right size no matter what orientation by
		//making the viewport huge. i did this to compensate for what i believe is
		//a bug in interface builder's simulator.
		//glOrthof is left,right,bottom,top,near,far
		//glViewport is x,y,width,height
	glOrthof(0, 1024, 0, 1024, -1, 1);
	glViewport(0, 0, 1024, 1024);
		
		//back to the regular template code
		glMatrixMode(GL_MODELVIEW);
		
		glDisable(GL_DITHER);
		glEnable(GL_TEXTURE_2D);
		glEnableClientState(GL_VERTEX_ARRAY);
	    glEnable(GL_BLEND);
		
		glBlendFunc(GL_SRC_ALPHA, GL_ONE);
		//glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);//this is cool at first - jh
		
		glEnable(GL_POINT_SPRITE_OES);
		glTexEnvf(GL_POINT_SPRITE_OES, GL_COORD_REPLACE_OES, GL_TRUE);
        
        glPointSize(width / myBrushScale);

		//Make sure to start with a cleared buffer
		needsErase = YES;
		
		}
	
	return self;
}

#pragma mark -
#pragma mark Brush and Erase Buttons

-(void)changeBrush:(id)sender {
	
	
	NSLog(@"changeBrush fired at it's start");
	
	//brushImage = [UIImage imageNamed:@"7RedSquare.png"].CGImage;
	brushImage = [ChalkboardView getMyBrushImage].CGImage;

	
	// Allocate  memory needed for the bitmap context
	brushData = (GLubyte *) calloc(width * height * 4, sizeof(GLubyte));
	// Use  the bitmatp creation function provided by the Core Graphics framework. 
	brushContext = CGBitmapContextCreate(brushData, width, width, 8, width * 4, CGImageGetColorSpace(brushImage), kCGImageAlphaPremultipliedLast);
	// After you create the context, you can draw the  image to the context.
	CGContextDrawImage(brushContext, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), brushImage);
	// You don't need the context at this point, so you need to release it to avoid memory leaks.
	CGContextRelease(brushContext);
	// Use OpenGL ES to generate a name for the texture.
	glGenTextures(1, &brushTexture);
	// Bind the texture name. 
	glBindTexture(GL_TEXTURE_2D, brushTexture);
	
	// Set the texture parameters to use a minifying filter and a linear filer (weighted average)
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	// Specify a 2D texture image, providing the a pointer to the image data in memory
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, brushData);
	// Release  the image data; it's no longer needed
	free(brushData);
	
	// Enable use of the texture
	glEnable(GL_TEXTURE_2D);
	// Set a blending function to use
	glBlendFunc(GL_SRC_ALPHA, GL_ONE);
	// Enable blending
	glEnable(GL_BLEND);
	
}
	

// Erases the screen
- (void)erase {
	
	[EAGLContext setCurrentContext:context];
	
	//Clear the buffer
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glClear(GL_COLOR_BUFFER_BIT);
	//glClearColor(0.0, 0.0, 0.0, 1.0); //this used to turn the screen black with the 2nd ersase button push
	
	//Display the buffer
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];
	
	//post notification so ChalkboardViewController can disable the erase button - j
	[[NSNotificationCenter defaultCenter] postNotificationName:@"chalkboardErased" object:self];
	
}

-(IBAction)eraseChalkboard:(id)sender {
	
	//Without this it doesn't stop animations on rotation.
	[chalkboardViewController stopAnimationsiPhone];
		
	[EAGLContext setCurrentContext:context];
	
	//Clear the buffer
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glClear(GL_COLOR_BUFFER_BIT);
	//glClearColor(0.0, 0.0, 0.0, 1.0); //this used to turn the screen black with the 2nd ersase button push
	
	//Display the buffer
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];
	
	//post notification so ChalkboardViewController can disable the erase button - j
	[[NSNotificationCenter defaultCenter] postNotificationName:@"chalkboardErased" object:self];
	
}

#pragma mark -

// If our view is resized, we'll be asked to layout subviews.
// This is the perfect opportunity to also update the framebuffer so that it is
// the same size as our display area.
// this fires when application first starts, and also when the device gets rotated - jh
-(void)layoutSubviews {
	
	//TODO: save drawing after rotation
	[EAGLContext setCurrentContext:context];
	
	[self destroyFramebuffer];
	[self createFramebuffer];
	
	[self eraseChalkboard:nil];
	
	// Clear the framebuffer the first time it is allocated
	//if (needsErase) {
		//[self erase];
		//needsErase = NO;
	//}
	
	NSLog(@"layoutSubviews in chalkboardView just fired");


}


- (BOOL)createFramebuffer
{
	// Generate IDs for a framebuffer object and a color renderbuffer
	glGenFramebuffersOES(1, &viewFramebuffer);
	glGenRenderbuffersOES(1, &viewRenderbuffer);
	
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	// This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
	// allowing us to draw into a buffer that will later be rendered to screen wherever the layer is (which corresponds with our view).
	[context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(id<EAGLDrawable>)self.layer];
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
	
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
	
	// For this sample, we also need a depth buffer, so we'll create and attach one via another renderbuffer.
	glGenRenderbuffersOES(1, &depthRenderbuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
	glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
	
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
	
	return YES;
}

// Clean up any buffers we have allocated.
- (void)destroyFramebuffer
{
	glDeleteFramebuffersOES(1, &viewFramebuffer);
	viewFramebuffer = 0;
	glDeleteRenderbuffersOES(1, &viewRenderbuffer);
	viewRenderbuffer = 0;
	
	if(depthRenderbuffer)
	{
		glDeleteRenderbuffersOES(1, &depthRenderbuffer);
		depthRenderbuffer = 0;
	}
}

// Releases resources when they are not longer needed.
- (void) dealloc
{
    
    NSLog(@"dealloc fired in ChalkboardView");

    
	if (brushTexture)
	{
		glDeleteTextures(1, &brushTexture);
		brushTexture = 0;
	}
	
	if([EAGLContext currentContext] == context)
	{
		[EAGLContext setCurrentContext:nil];
	}
	
}


//Added for v4.0
#pragma mark -
#pragma mark Playback Strokes

/* SAVED INFORMATION AND CODE IDEAS
 
 Information on CGPoints and creating a function wrapper for passing multiple arguments into
 the performSelector:withObject:afterDelay: method.
 
 //NSArray *argArray = [NSArray arrayWithObjects:firstPoint,secondPoint,nil];
 NSArray *argArray = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:firstPoint],[NSValue valueWithCGPoint:secondPoint],nil];
 [self performSelector:@selector(myFunctWrapper:) withObject:argArray afterDelay:3.0];
 NSLog(@"playback:theArrayStorageArray fired");
 
 -(void)myFunctWrapper:(NSArray *)myArgs {
 //[self myFunct:[myArgs objectAtIndex:0] andArg:[myArgs ojbectAtIndex:1]];
 NSValue *firstPoint = [myArgs objectAtIndex:0];
 NSValue *secondPoint = [myArgs objectAtIndex:1];
 CGPoint myFirstPoint = [firstPoint CGPointValue];
 CGPoint mySecondPoint = [secondPoint CGPointValue];
 [self renderLineFromPoint:myFirstPoint toPoint:mySecondPoint];
 //[self renderLineFromPoint:*(__bridge CGPoint *)[myArgs objectAtIndex:0] toPoint:*(__bridge CGPoint *)[myArgs objectAtIndex:1]];
 }
 */


//Added for v4.0
#pragma mark -
#pragma mark Draw Stroke Method

-(void)drawStrokeFromPoint:(CGPoint)firstPoint toPoint:(CGPoint)secondPoint {
    
    [self renderLineFromPoint:firstPoint toPoint:secondPoint];
    
}


#pragma mark -
#pragma mark Handle Touches

// Drawings a line onscreen based on where the user touches
- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end
{
	static GLfloat*		vertexBuffer = NULL;
	static NSUInteger	vertexMax = 64;
	NSUInteger			vertexCount = 0,
	count,
	i;
	
	[EAGLContext setCurrentContext:context];
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	
	//Allocate vertex array buffer
	if(vertexBuffer == NULL)
		vertexBuffer = malloc(vertexMax * 2 * sizeof(GLfloat));
	
	//Add points to the buffer so there are drawing points every X pixels
	count = MAX(ceilf(sqrtf((end.x - start.x) * (end.x - start.x) + (end.y - start.y) * (end.y - start.y)) / myBrushPixelStep), 1);
	for(i = 0; i < count; ++i) {
		if(vertexCount == vertexMax) {
			vertexMax = 2 * vertexMax;
			vertexBuffer = realloc(vertexBuffer, vertexMax * 2 * sizeof(GLfloat));
		}
		
		vertexBuffer[2 * vertexCount + 0] = start.x + (end.x - start.x) * ((GLfloat)i / (GLfloat)count);
		vertexBuffer[2 * vertexCount + 1] = start.y + (end.y - start.y) * ((GLfloat)i / (GLfloat)count);
		vertexCount += 1;
	}
	
	//Render the vertex array
	glVertexPointer(2, GL_FLOAT, 0, vertexBuffer);
	glDrawArrays(GL_POINTS, 0, vertexCount);
	
	//Display the buffer
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];

}

// Handles the start of a touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGRect				bounds = [self bounds];
    UITouch*	touch = [[event touchesForView:self] anyObject];
	firstTouch = YES;
	//Convert touch point from UIView referential to OpenGL one (upside-down flip)
	location = [touch locationInView:self];
	location.y = bounds.size.height - location.y;
	//NSLog(@"touchesBegan just fired");
	
	//code i found on web to record touche coordinates - j
	//touchCoordinates.x and touchCoordinates.y give you information you need.
	CGPoint touchCoordinates = [touch locationInView:myAnimationView];
	NSLog(@"%f,%f", touchCoordinates.x, touchCoordinates.y);
	
	//post notification so ChalkboardViewController can enable the erase button - j
	[[NSNotificationCenter defaultCenter] postNotificationName:@"touchOccuredInView" object:self];
    
    //if ([delegate respondsToSelector:@selector(chalkboardView:firstTouchAtPoint:locationInView:)])
    [delegate chalkboardView:self firstTouchAtPoint:[touch locationInView:self]];
    
}

// Handles the continuation of a touch.
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
	
	CGRect				bounds = [self bounds];
	UITouch*			touch = [[event touchesForView:self] anyObject];
	
	//Convert touch point from UIView referential to OpenGL one (upside-down flip)
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
		previousLocation.y = bounds.size.height - previousLocation.y;
	} else {
		location = [touch locationInView:self];
	    location.y = bounds.size.height - location.y;
		previousLocation = [touch previousLocationInView:self];
		previousLocation.y = bounds.size.height - previousLocation.y;
	}
	
	// Render the stroke
	[self renderLineFromPoint:previousLocation toPoint:location];

    //code i found on web to record touche coordinates and print to console - j
	//touchCoordinates.x and touchCoordinates.y give you information you need.
	CGPoint troubleshootCoordinates = [touch locationInView:myAnimationView];
	NSLog(@"touchesMoved to = %f,%f", troubleshootCoordinates.x, troubleshootCoordinates.y);
    
    [self.delegate chalkboardView:self nextTouchAtPoint:[touch locationInView:self]];

}

// Handles the end of a touch event when the touch is a tap.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGRect				bounds = [self bounds];
    UITouch*	touch = [[event touchesForView:self] anyObject];
	if (firstTouch) {
		firstTouch = NO;
		previousLocation = [touch previousLocationInView:self];
		previousLocation.y = bounds.size.height - previousLocation.y;
		[self renderLineFromPoint:previousLocation toPoint:location];
	}

    //code i found on web to record touche coordinates and print to console - j
	//touchCoordinates.x and touchCoordinates.y give you information you need.
	CGPoint troubleshootCoordinates = [touch locationInView:myAnimationView];
	NSLog(@"touchesEnded at = %f,%f", troubleshootCoordinates.x, troubleshootCoordinates.y);
    
    [self.delegate chalkboardView:self lastTouchAtPoint:[touch locationInView:self]];

}

// Handles the end of a touch event.
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	// If appropriate, add code necessary to save the state of the application.
	// This application is not saving state.
    
    CGRect				bounds = [self bounds];
    UITouch*	touch = [[event touchesForView:self] anyObject];
	firstTouch = YES;
	//Convert touch point from UIView referential to OpenGL one (upside-down flip)
	location = [touch locationInView:self];
	location.y = bounds.size.height - location.y;
	//NSLog(@"touchesBegan just fired");
	
	//code i found on web to record touche coordinates and print to console - j
	//touchCoordinates.x and touchCoordinates.y give you information you need.
	CGPoint troubleshootCoordinates = [touch locationInView:myAnimationView];
    
    NSLog(@"touchesCancelled at = %f,%f", troubleshootCoordinates.x, troubleshootCoordinates.y);

}




/*
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
