//
//  ChalkboardViewiPhone+recordedPaths.h
//  LearnToWrite
//
//  Created by Justin Hackett on 12/13/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "ChalkboardViewiPhone.h"

@interface ChalkboardViewiPhone (recordedPaths)




//On touchesBegan I create an array and name it array1
//I have to check if the array is named array1, and if so, create another one named array2.

//Adding coordinates to the created array.

//On touchesMoved I add the coordinates to the array1.

//On touchesEnded I add the last coordinates to the array1, then I create the
//next array which will be array2.

//Added the final coordinates and.....(eventually write code to finalize the array and store it)....

//Need to include something like this to play the next animation.
/*
 // Render the next path after a short delay
 [recordedPaths removeObjectAtIndex:0];
 if([recordedPaths count])
 [self performSelector:@selector(playback:) withObject:recordedPaths afterDelay:0.01];
 */



//Added for v3.3
//Created the array to hold touch coordinates.
-(NSMutableArray *)createMyTouchesArray:(UITouch *)startingTouch;
-(void)addTouchesToArray:(UITouch *)nextTouch;
-(void)addLastTouchToArray:(UITouch *)lastTouch;

@end
