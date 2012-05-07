//
//  UWSBuildingsInfoCell.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSBuildingsInfoCell.h"

@implementation UWSBuildingsInfoCell
@synthesize nameLabel = nameLabel_;
@synthesize acroLabel = acroLabel_;


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

-(void) setBuildingsInfoData:(NSDictionary*) thisBuildingInfo {
    
    
	self.nameLabel.text = [[[thisBuildingInfo objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
    self.acroLabel.text = [[[thisBuildingInfo objectForKey:@"Acronym"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];

    
    
}


@end
