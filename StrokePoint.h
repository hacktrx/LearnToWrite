//
//  StrokePoint.h
//  LearnToWrite
//
//  Created by Justin Hackett on 3/7/13.
//  Copyright (c) 2013 JH Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LetterStroke;

@interface StrokePoint : NSManagedObject

@property (nonatomic, retain) NSString * letter;
@property (nonatomic, retain) NSNumber * strokeNumber;
@property (nonatomic, retain) NSNumber * strokePointX;
@property (nonatomic, retain) NSNumber * strokePointY;
@property (nonatomic, retain) LetterStroke *letterStroke;

@end
