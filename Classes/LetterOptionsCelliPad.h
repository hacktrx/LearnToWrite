//
//  LetterOptionsCelliPad.h
//  LearnToWrite
//
//  Created by Justin Hackett on 4/30/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LetterOptionsCellDelegateiPad <NSObject>

-(void)paperLinesButtonSwitched:(BOOL)stateOfSwitch;

@end


@interface LetterOptionsCelliPad : UITableViewCell {
    
    __unsafe_unretained id<LetterOptionsCellDelegateiPad> delegate;
    
    IBOutlet UISwitch *paperLinesSwitch;
    IBOutlet UILabel *paperLinesCellLabel;
}

@property (readwrite, unsafe_unretained) id<LetterOptionsCellDelegateiPad> delegate;

@property (nonatomic, retain) IBOutlet UISwitch *paperLinesSwitch;
@property (nonatomic, retain) IBOutlet UILabel *paperLinesCellLabel;

- (IBAction)linesSettingChanged:(id)sender;

@end
