//
//  BrushTableViewController.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/15/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundEffect;
@class MainCell;

@interface BrushTableViewController : UITableViewController {
	NSArray *imagesList;
	NSArray *brushPatternsList;
	
    IBOutlet MainCell *cell;
	NSIndexPath *lastIndexPath;
	
	SoundEffect	*clickSound;
	
}

@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSArray *brushPatternsList;
@property (nonatomic, retain) NSArray *imagesList;

@end
