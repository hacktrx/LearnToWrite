//
//  ChalkboardViewiPhone+recordedPaths.m
//  LearnToWrite
//
//  Created by Justin Hackett on 12/13/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "ChalkboardViewiPhone+recordedPaths.h"

@implementation ChalkboardViewiPhone (recordedPaths)

//Need to include something like this to play the next animation.
/*
 // Render the next path after a short delay
 [recordedPaths removeObjectAtIndex:0];
 if([recordedPaths count])
 [self performSelector:@selector(playback:) withObject:recordedPaths afterDelay:0.01];
 */

//Created the array to hold touch coordinates and return the first array.
-(NSMutableArray *)createMyTouchesArray:(UITouch *)startingTouch {
    
    CGPoint touchCoordinates = [startingTouch locationInView:self];
    
    if (myRecordedPaths == nil) {
        
        NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:2];
        myRecordedPaths = anArray;
        
    }
    [myRecordedPaths addObject:[NSValue valueWithCGPoint:touchCoordinates]];

    return myRecordedPaths;
}


//Adding coordinates to the created array.
-(void)addTouchesToArray:(UITouch *)nextTouch {
    
    CGPoint touchCoordinates = [nextTouch locationInView:self];
    [myRecordedPaths addObject:[NSValue valueWithCGPoint:touchCoordinates]];

}

//Adding coordinates to the created array.
-(void)addLastTouchToArray:(UITouch *)lastTouch {
    
    CGPoint touchCoordinates = [lastTouch locationInView:self];
    [myRecordedPaths addObject:[NSValue valueWithCGPoint:touchCoordinates]];

    
}







@end
