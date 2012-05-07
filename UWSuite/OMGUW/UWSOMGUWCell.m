//
//  UWSOMGUWCell.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSOMGUWCell.h"

@implementation UWSOMGUWCell
@synthesize date = date_;
@synthesize content = content_;

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

-(void) setOmgData:(NSDictionary*) thisOmgInfo{
   
    self.content.text = [[[[[thisOmgInfo objectForKey:@"Content"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    self.date.text = [[[[[thisOmgInfo objectForKey:@"Date"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];

}

@end
