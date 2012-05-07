//
//  UWSParkingCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWSParkingCell : UITableViewCell
@property (nonatomic, assign) IBOutlet UILabel *lot;
@property (nonatomic, assign) IBOutlet UILabel *count;
@property (nonatomic, assign) IBOutlet UILabel *cap;


-(void) setWatParkData:(NSDictionary*) thisWatParkInfo;

@end
