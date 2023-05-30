//
//  LetterRecording.h
//  LearnToWrite
//
//  Created by Justin Hackett on 3/1/13.
//  Copyright (c) 2013 JH Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LetterStroke;

@interface LetterRecording : NSManagedObject

@property (nonatomic, retain) NSNumber * delayBetweenStrokes;
@property (nonatomic, retain) NSString * largeImageURL;
@property (nonatomic, retain) NSString * letterIdentifier;
@property (nonatomic, retain) NSDate * recordingDate;
@property (nonatomic, retain) NSString * smallImageURL;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSSet *letterStrokes;
@end

@interface LetterRecording (CoreDataGeneratedAccessors)

- (void)addLetterStrokesObject:(LetterStroke *)value;
- (void)removeLetterStrokesObject:(LetterStroke *)value;
- (void)addLetterStrokes:(NSSet *)values;
- (void)removeLetterStrokes:(NSSet *)values;

@end
