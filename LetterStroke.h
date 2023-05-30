//
//  LetterStroke.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/14/13.
//  Copyright (c) 2013 JH Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LetterRecording, StrokePoint;

@interface LetterStroke : NSManagedObject

@property (nonatomic, retain) NSNumber * strokeIdentifier;
@property (nonatomic, retain) LetterRecording *letterRecording;
@property (nonatomic, retain) NSSet *strokePoints;
@end

@interface LetterStroke (CoreDataGeneratedAccessors)

- (void)addStrokePointsObject:(StrokePoint *)value;
- (void)removeStrokePointsObject:(StrokePoint *)value;
- (void)addStrokePoints:(NSSet *)values;
- (void)removeStrokePoints:(NSSet *)values;

@end
