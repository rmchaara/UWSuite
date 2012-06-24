//
//  ParkingDetailViewController.m
//  UWSuite
//
//  Created by Jeffrey Brydges on 12-06-17.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParkingDetailViewController.h"

@interface ParkingDetailViewController ()

@end

@implementation ParkingDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
