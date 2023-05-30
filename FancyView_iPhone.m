//
//  FancyView_iPhone.m
//  LearnToWrite
//
//  Created by Justin Hackett on 1/28/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import "FancyView_iPhone.h"

@implementation FancyView_iPhone {
    
    CGGradientRef backgroundGradient_;
    
}

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/



/*
 * Creates the blue background gradient
 */
- (CGGradientRef)backgroundGradient {
    if(NULL == backgroundGradient_) {
        // lazily create the gradient, then reuse it
        CGFloat colors[16] = {60.0 / 255.0, 61.0 / 255.0, 114.0 / 255.0, 1.0,
            40.0 / 255.0, 47.0 / 255.0, 113.0 / 255.0, 1.0,
            20.0 / 255.0, 33.0 / 255.0, 104.0 / 255.0, 1.0,
            00.0 / 255.0, 33.0 / 255.0, 104.0 / 255.0, 1.0 };
        CGFloat colorStops[4] = {0.0, 0.25, 0.5, 1.0};
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        backgroundGradient_ = CGGradientCreateWithColorComponents(colorSpace, colors, colorStops, 4);
        CGColorSpaceRelease(colorSpace);
    }
    return backgroundGradient_;
}

/*
 * draws the blue background gradient
 */
- (void)drawBackgroundGradient {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint startPoint = {0.0, 0.0};
    CGPoint endPoint = {0.0, self.bounds.size.height};
    CGContextDrawLinearGradient(ctx, [self backgroundGradient], startPoint, endPoint,0);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // clip to the rounded rect
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:CGSizeMake(16.0, 16.0)];
    [path addClip];
    
    [self drawBackgroundGradient];
    //[self drawBeachUnderDataInRect:rect];
    //[self drawShadowedCirclesInRect:rect];
}

@end


@implementation FancyView_iPhone (Extras)

/*
 * call this method after drawVolumeDataInRect: in the drawRect: method
 * and see what exciting drawing results.
 */
- (void)drawBeachUnderDataInRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    //UIBezierPath *clipPath = [self bottomClipPathFromDataInRect:rect];
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(16.0, 16.0)];
    [clipPath addClip];
    UIImage *image = [UIImage imageNamed:@"Beach.png"];
    [image drawInRect:rect];
}

/*
 * used to get the shadowed circles shown in the preso
 * not called as part of this sample, but here for your illumination 
 */
- (void)drawShadowedCirclesInRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGFloat shadowHeight = 16.0;
    CGFloat radius = CGRectGetHeight(rect) / 2.5;
    CGContextSetShadowWithColor(ctx, CGSizeMake(shadowHeight, shadowHeight), 5.0,
                                [[[UIColor purpleColor] colorWithAlphaComponent:0.7] CGColor]);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
                                                        radius:radius startAngle:0.0
                                                      endAngle:2.0 * M_PI clockwise:YES];
    UIColor *color1 = [UIColor colorWithRed:99.0 / 255.0 green:66.0 / 255.0
                                       blue:58.0 / 255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:149.0 / 255.0 green:64.0 / 255.0
                                       blue:73.0 / 255.0 alpha:1.0];
    UIColor *color3 = [UIColor colorWithRed:195.0 / 255.0 green:111.0 / 255.0
                                       blue:97.0 / 255.0 alpha:1.0];
    CGContextBeginTransparencyLayer(ctx, NULL);
    [color1 setFill];
    CGContextTranslateCTM(ctx, -radius / 2.0, 0.0);
    [path fill];
    [color2 setFill];
    CGContextTranslateCTM(ctx, 1.25 * radius, 0.75 * radius);
    [path fill];
    [color3 setFill];
    CGContextTranslateCTM(ctx, 0.0, -1.5 * radius);
    [path fill];
    CGContextEndTransparencyLayer(ctx);
    CGContextRestoreGState(ctx);
}

@end

