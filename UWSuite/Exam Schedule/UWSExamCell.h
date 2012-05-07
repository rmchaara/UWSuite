//
//  UWSExamCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWSExamCell : UITableViewCell 
@property (strong, atomic) NSString *term;
@property (nonatomic, assign) IBOutlet UILabel *course;
@property (nonatomic, assign) IBOutlet UILabel *section;
@property (nonatomic, assign) IBOutlet UILabel *date;
@property (nonatomic, assign) IBOutlet UILabel *start;
@property (nonatomic, assign) IBOutlet UILabel *end;
@property (nonatomic, assign) IBOutlet UILabel *location;


-(void) setExamsData:(NSDictionary*) thisExamInfo;
@end
