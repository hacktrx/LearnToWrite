//
//  LetterOptionsCell.h
//  LearnToWrite
//
//  Created by Justin Hackett on 2/26/12.
//  Copyright 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LetterOptionsCellDelegate <NSObject>

-(void)paperLinesButtonSwitched:(BOOL)stateOfSwitch;

@end


@interface LetterOptionsCell : UITableViewCell {
    
    __unsafe_unretained id<LetterOptionsCellDelegate> delegate;
    
    IBOutlet UISwitch *paperLinesSwitch;
    IBOutlet UILabel *paperLinesCellLabel;
}

@property (readwrite, unsafe_unretained) id<LetterOptionsCellDelegate> delegate;

@property (nonatomic, retain) IBOutlet UISwitch *paperLinesSwitch;
@property (nonatomic, retain) IBOutlet UILabel *paperLinesCellLabel;

- (IBAction)linesSettingChanged:(id)sender;

@end
