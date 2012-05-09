//
//  UWSParkingTVC.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWSParkingTVC : UITableViewController{
    NSTimer * timer;
}

// Live Parking Info
@property (strong, nonatomic) NSArray *watparkArray;
@property (nonatomic, retain) NSTimer * timer; // Used to refresh WatPark Information

@end
