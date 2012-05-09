//
//  UWSParkingCell.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSParkingCell.h"

@implementation UWSParkingCell
@synthesize  lot = lot_;
@synthesize count = count_;
@synthesize cap = cap_;

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

-(void) setWatParkData:(NSDictionary*) thisWatParkInfo {
    // Set UILabels of UWSParkingCell
    // The use of stringByReplacingOccurrences is to deal with HTML text
    // Eventually replace this with MWFeedParser
    NSString * x = [[[[thisWatParkInfo objectForKey:@"Capacity"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                    [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.lot.text = [[[[thisWatParkInfo objectForKey:@"LotName"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([x isEqualToString:@"-1"]) {
        self.count.text = @"?";
        self.cap.text = @"?";
    }
    else{
        self.count.text = [[[[thisWatParkInfo objectForKey:@"LatestCount"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.cap.text = [[[[thisWatParkInfo objectForKey:@"Capacity"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
 
    
}


@end
