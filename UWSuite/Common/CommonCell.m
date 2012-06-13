//
//  CommonCell.m
//  UWSuite
//
//  Created by Jeffrey Brydges on 12-06-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//NSArray is a 6 element array containing RGB for the first coloured cell,
//   followed by RGB for the second coloured cell.
- (void)setCellColours:(double[6])colours atRowNumber:(int)rowNumber
{
    //Set cell alternating background colours
    if((rowNumber % 2) == 0)
    {
        self.backgroundColor = [UIColor colorWithRed:colours[0]/255.0 green:colours[1]/255.0 blue:colours[2]/255.0 alpha:1.0];
    }
    else
    {
        self.backgroundColor = [UIColor colorWithRed:colours[3]/255.0 green:colours[4]/255.0 blue:colours[5]/255.0 alpha:1.0];
        
    }
}

@end
