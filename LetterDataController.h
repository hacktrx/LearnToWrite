//
//  LetterDataController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 1/29/13.
//  Copyright (c) 2013 JH Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetterDataController : NSObject <ChalkboardViewControllerDelegate> {
    
    NSMutableArray *currentStrokeArray;
	NSMutableArray *arrayStorageArray;
    NSMutableArray *currentArrayForPlayback;
    int myCounterInteger;
    NSTimer *myTimer;
    BOOL startOverBool;
    NSManagedObjectContext *managedObjectContext;
    //NSManagedObjectModel *managedObjectModel;
    LetterRecording *myLetterRecording;
    LetterStroke *myLetterStroke;
    StrokePoint *myStrokePoint;

}
    
//Added for v3.3
@property (readwrite, unsafe_unretained) id <ChalkboardViewDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *currentStrokeArray;
@property (nonatomic, retain) NSMutableArray *arrayStorageArray;
@property (nonatomic, retain) NSMutableArray *currentArrayForPlayback;
@property (nonatomic, retain) NSTimer *myTimer;
@property (nonatomic, readwrite) BOOL startOverBool;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) LetterRecording *myLetterRecording;
@property (nonatomic, retain) LetterStroke *myLetterStroke;
@property (nonatomic, retain) StrokePoint *myStrokePoint;



@end
