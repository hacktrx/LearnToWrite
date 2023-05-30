//
//  MainCell.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/15/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import "MainCell.h"


@implementation MainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}

//TODO: Change selected cell?
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setBrushImage:(NSString *)_text;{
	brushImg.image = [UIImage imageNamed:_text];
}




@end
