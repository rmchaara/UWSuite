//
//  UWSParkingCell.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonCell.h"

@interface UWSParkingCell : CommonCell

// Labels of the Parking Cell
@property (nonatomic, assign) IBOutlet UILabel *lot;
@property (nonatomic, assign) IBOutlet UILabel *count;
@property (nonatomic, assign) IBOutlet UILabel *cap;

-(void)setCellColour:(int)rowNumber;
-(void)setAccessoryImage;
-(void) setWatParkData:(NSDictionary*) thisWatParkInfo;

@end
