//
//  LetterDataController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 1/29/13.
//  Copyright (c) 2013 JH Productions. All rights reserved.
//

#import "LetterDataController.h"

@implementation LetterDataController


//Added for v3.3
@synthesize currentStrokeArray;
@synthesize arrayStorageArray;
@synthesize currentArrayForPlayback;
@synthesize myTimer;
@synthesize startOverBool;
@synthesize managedObjectContext;
//@synthesize managedObjectModel;
@synthesize myLetterRecording;
@synthesize myLetterStroke;
@synthesize myStrokePoint;



#pragma mark -
#pragma mark Core Data Stuff
/*
 //Start of creating an entity.
 
 
 
 
 [self.managedObjectContext save:&error];
 NSLog(@"The associations know their names now, the context was also saved");
 
 
 LetterStroke *letterStroke = (LetterStroke *)[NSEntityDescription insertNewObjectForEntityForName:@"LetterStroke" inManagedObjectContext:self.managedObjectContext];
 [letterStroke setValue:[NSNumber numberWithInt:0]  forKey:@"strokeIdentifier"];
 self.myLetterStroke = letterStroke;
 
 //End
 */


#pragma mark -
#pragma mark ChalkboardViewController Delegate Methods

//This saves a stroke for a letter label.
-(void)saveLetterRecording:(NSString *)letterLabel {
    
    NSLog(@"The managedObjectContext in ChalkboardView is %@", self.managedObjectContext);
    
    NSError *error = nil;
    
    //--------------- Create Letter Recording --------------
    
    LetterRecording *letterRecording = (LetterRecording *)[NSEntityDescription insertNewObjectForEntityForName:@"LetterRecording" inManagedObjectContext:self.managedObjectContext];
    
    self.myLetterRecording = letterRecording;
    self.myLetterRecording.delayBetweenStrokes = [NSNumber numberWithFloat:1.0];
    self.myLetterRecording.letterIdentifier = letterLabel;
    //Add recordingDate
    //Add child
    //Now we commit the changes and save the context.
    
    
    /*
     NSSet *newManeuvers = [NSSet setWithObjects:newManeuver1, newManeuver2 , newManeuver3, newManeuver4, newManeuver5, newManeuver6, newManeuver7, newManeuver8, nil];
     newPattern.maneuvers = newManeuvers;
     */
    
    //Now we commit the changes and save the context.
	[self.managedObjectContext save:&error];
    NSLog(@"saveLetterRecording:letterLabel fired in ChalkboardViewiPhone");
    
    [self saveStrokes];
    
}

//Added for v3.3
//The Play button is pushed in ChalkboardViewControlleriPhone.
-(IBAction)playStrokes:(id)sender {
    
    [self startTimer];
    NSLog(@"playStrokes just fired in ChalkboardView");
    
}



#pragma mark -
#pragma mark ChalkboardView Delegate Methods

-(void)saveStrokes {
    
    NSError *error = nil;
    
    NSUInteger myCount = [arrayStorageArray count];
    NSUInteger i;
    
    //This for loop runs for every array in the storage array.
    for (i = 0; i < myCount;  ++i) {
        
        LetterStroke *letterStroke = (LetterStroke *)[NSEntityDescription insertNewObjectForEntityForName:@"LetterStroke" inManagedObjectContext:self.managedObjectContext];
        self.myLetterStroke = letterStroke;
        self.myLetterStroke.strokeIdentifier = [NSNumber numberWithInt:i];
        self.myLetterStroke.letterRecording = self.myLetterRecording;
        
        
        //Create a method to create a stroke for the letter label. For as many arrays in the storage array there will be a
        //stroke created.
        //[self createStroke:forLetterLabel]
        
        //Now we commit the changes and save the context.
        [self.managedObjectContext save:&error];
        NSLog(@"saveStrokes fired in ChalkboardViewiPhone");
        
    }
    
    [self cycleThroughStrokes];
    
}

-(void)cycleThroughStrokes {
    
    //This for loop runs for every object in the current storage array's array.
    NSUInteger myCount = [arrayStorageArray count];
    NSUInteger i;
    
    for (i = 0; i < myCount; ++i) {
        
        
        [self createPointsForStrokes:i];
        NSLog(@"cycleThroughStrokes fired in ChalkboardViewiPhone");
        
    }
    
}

-(void)createPointsForStrokes:(NSUInteger)stroke {
    
    NSError *error = nil;
    
    //This count is the number of points in the array at the "stroke" index of the storage array.
    NSUInteger myStrokeArrayCount = [[arrayStorageArray objectAtIndex:stroke] count];
    NSMutableArray *currentPointsArray = [arrayStorageArray objectAtIndex:stroke];
    NSUInteger n;
    
    
    for (n = 0; n < myStrokeArrayCount; ++n) {
        
        StrokePoint *strokePoint = (StrokePoint *)[NSEntityDescription insertNewObjectForEntityForName:@"StrokePoint" inManagedObjectContext:self.managedObjectContext];
        self.myStrokePoint = strokePoint;
        
        self.myStrokePoint.letterStroke = self.myLetterStroke;
        
        
        CGPoint currentPoint = [[currentPointsArray objectAtIndex:n] CGPointValue];
        self.myStrokePoint.strokePointX = [NSNumber numberWithFloat:currentPoint.x];
        self.myStrokePoint.strokePointY = [NSNumber numberWithFloat:currentPoint.y];
        //When this prints to the log the Y point does not match the touch coordinate Y point that prints to the log on touches.
        //I am leaving this as is. When playback of the points is called the Y point is switched in the playback method to the
        //proper OpenGL coordinate Y flip (see playback method).
        NSLog(@"The first point x and y is %@,%@", [NSNumber numberWithFloat:currentPoint.x],[NSNumber numberWithFloat:currentPoint.y]);
        
        
        //Now we commit the changes and save the context.
        [self.managedObjectContext save:&error];
        NSLog(@"savePointsToStroke fired in ChalkboardViewiPhone");
        
        
    }
    
    [self addPointDataToStrokes];
    
    
}


-(void)addPointDataToStrokes {
    
    
    
}



//--------------- Create Letter Strokes -----------------


//--------------- Create Stroke Points -----------------




//Added for v3.3
//Starts the timer activating myTimeFunction after 1 second.
-(void)startTimer {
    
    myCounterInteger = 0;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(myTimedFunction) userInfo:nil repeats:YES];
    NSLog(@"startTimer just fired in ChalkboardView");
    
}

//Added for v3.3
//This runs at the 1 second interval until the timer is invalidated by myCounterInteger in the if statement.
-(void)myTimedFunction {
    
    //Crashes if the array has no objects and this method is called. Have to have this in an if statement.
    if ([arrayStorageArray count] >= 1) {
        [self playback:[arrayStorageArray objectAtIndex:myCounterInteger]];
    }
    
    myCounterInteger++;
    if (myCounterInteger >= [arrayStorageArray count]) {
        [myTimer invalidate];
    }
    NSLog(@"myTimedFunction just fired in ChalkboardView");
    
}


//Added for v3.3
// Reads recordedPaths array and draws them on screen.
- (void) playback:(NSMutableArray*)theArrayStorageArray {
    
    CGRect	bounds = [self bounds];
    NSUInteger myCount = [theArrayStorageArray count];
    NSUInteger i;
    
    for (i = 0; i < myCount - 1; ++i) {
        
        CGPoint firstPoint = [[theArrayStorageArray objectAtIndex:i] CGPointValue];
        //Convert touch point from UIView referential to OpenGL one (upside-down flip)
        firstPoint.y = bounds.size.height - firstPoint.y;
        NSLog(@"The first point x and y is %@,%@", [NSNumber numberWithFloat:firstPoint.x],[NSNumber numberWithFloat:firstPoint.y]);
        
        CGPoint secondPoint = [[theArrayStorageArray objectAtIndex:(i + 1)] CGPointValue];
        //Convert touch point from UIView referential to OpenGL one (upside-down flip)
        secondPoint.y = bounds.size.height - secondPoint.y;
        
        
        [self renderLineFromPoint:firstPoint toPoint:secondPoint];
        
    }
    
}


//Added for v3.3
//When the letter on the screen is changed the ChalkboardViewController calls the eraseiPHone method in ChalkboardView.
//So, in that eraseiPhone method the resetStrokes method is called. So whether you erase or change the letter it resets the strokes.
-(void)resetStrokes {
    
    [currentStrokeArray removeAllObjects];
    [arrayStorageArray removeAllObjects];
    
}

//End v3.3 added code.









@end
