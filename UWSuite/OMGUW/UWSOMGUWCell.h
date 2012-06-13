//
//  UWSOMGUWCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonCell.h"

@interface UWSOMGUWCell : CommonCell
@property (nonatomic, assign) IBOutlet UILabel *content; // OMGUW post
@property (nonatomic, assign) IBOutlet UILabel *date; // Date/Time post

// Function to pass NSDictionary of OMGUW information to set to cell
-(void) setOmgData:(NSDictionary*) thisOmgInfo; 

@end
