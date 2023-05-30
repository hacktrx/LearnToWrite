//
//  MainCelliPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 10/2/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainCelliPhone : UITableViewCell {
	IBOutlet UIImageView *brushImg;
}

- (void)setBrushImage:(NSString *)_text;

@end
