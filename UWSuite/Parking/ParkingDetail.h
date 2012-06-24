//
//  ParkingDetail.h
//  UWSuite
//
//  Created by Jeffrey Brydges on 12-06-17.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParkingDetail : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lotName;
@property (weak, nonatomic) IBOutlet UILabel *hourlyRate;
@property (weak, nonatomic) IBOutlet UILabel *after4Rate;
@property (weak, nonatomic) IBOutlet UILabel *maxRate;
@property (weak, nonatomic) IBOutlet UILabel *paymentTypes;


- (IBAction)showOnMap:(id)sender;



//- (IBAction)showOnMap:(id)sender;

@end
