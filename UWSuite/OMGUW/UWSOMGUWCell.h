//
//  UWSOMGUWCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWSOMGUWCell : UITableViewCell
@property (nonatomic, assign) IBOutlet UILabel *content;
@property (nonatomic, assign) IBOutlet UILabel *date;


-(void) setOmgData:(NSDictionary*) thisOmgInfo;

@end
