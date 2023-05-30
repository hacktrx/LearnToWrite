//
//  BrushTableViewControlleriPhone.h
//  LearnToWrite
//
//  Created by Justin Hackett on 10/2/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundEffect;
@class MainCelliPhone;

@interface BrushTableViewControlleriPhone : UITableViewController {
	NSArray *imagesList;
	NSArray *brushPatternsList;
	
    IBOutlet MainCelliPhone *cell;
	NSIndexPath *lastIndexPath;
	
	SoundEffect	*clickSoundiPhone;
    	
}

@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSArray *brushPatternsList;
@property (nonatomic, retain) NSArray *imagesList;
@property (nonatomic, retain) SoundEffect *clickSoundiPhone;

@end
