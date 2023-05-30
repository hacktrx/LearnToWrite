//
//  MainCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/15/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainCell : UITableViewCell {
	IBOutlet UIImageView *brushImg;
}

- (void)setBrushImage:(NSString *)_text;

@end
