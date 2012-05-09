//
//  UWSExamCell.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSExamCell.h"

@implementation UWSExamCell
@synthesize term = term_;
@synthesize course = course_;
@synthesize section = section_;
@synthesize date = date_;
@synthesize start = start_;
@synthesize end = end_;
@synthesize location = location_;

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

-(void) setExamsData:(NSDictionary*) thisExamInfo {
    
    // Set UILabels of UWSExamCell
    // The use of stringByReplacingOccurrences is to deal with HTML text
    // Eventually replace this with MWFeedParser
	self.term = [[[[thisExamInfo objectForKey:@"Term"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                 [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.course.text = [[[[thisExamInfo objectForKey:@"Course"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
    [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    self.section.text = [[[[thisExamInfo objectForKey:@"Section"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
    [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([self.section.text characterAtIndex:0] == '0'){
        self.date.text = [[[[thisExamInfo objectForKey:@"Date"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.start.text = [[[[thisExamInfo objectForKey:@"Start"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.end.text = [[[[thisExamInfo objectForKey:@"End"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.location.text = [[[[thisExamInfo objectForKey:@"Location"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    else {
        self.section.text = @"";
        self.date.text =@"";
        self.start.text =@"";
        self.end.text =@"";
        self.location.text = [[[[thisExamInfo objectForKey:@"Location"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                              [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    
}


@end
