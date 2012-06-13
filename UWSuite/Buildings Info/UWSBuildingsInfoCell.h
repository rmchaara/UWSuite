//
//  UWSBuildingsInfoCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonCell.h"

@interface UWSBuildingsInfoCell : CommonCell

@property (nonatomic, assign) IBOutlet UILabel *acroLabel;
@property (nonatomic, assign) IBOutlet UILabel *nameLabel;

-(void) setBuildingsInfoData:(NSDictionary*) thisBuildingInfo;
@end
