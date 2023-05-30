//
//  FancyView_iPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 1/28/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FancyView_iPhone : UIView

@end


/*
 * easter egg methods for doing more with Core Graphics.
 */
@interface FancyView_iPhone (Extras)
- (void)drawBeachUnderDataInRect:(CGRect)rect;
- (void)drawShadowedCirclesInRect:(CGRect)rect;
@end