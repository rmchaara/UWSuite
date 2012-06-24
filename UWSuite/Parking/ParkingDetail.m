//
//  ParkingDetail.m
//  UWSuite
//
//  Created by Jeffrey Brydges on 12-06-17.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParkingDetail.h"
#import "SpinnerView.h"
#import "UWSAppDelegate.h"

@interface ParkingDetail ()
{
    NSDictionary *lotDetails;
}

@end

@implementation ParkingDetail
@synthesize lotName;
@synthesize hourlyRate;
@synthesize after4Rate;
@synthesize maxRate;
@synthesize paymentTypes;


-(void)setLot:(NSDictionary *)_lot{
    printf("Setting the lot");
    lotDetails = _lot;  
}

/************************** INITIALIZATION ***********************************/

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
    [self setWatParkDetails];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setLotName:nil];
    [self setHourlyRate:nil];
    [self setAfter4Rate:nil];
    [self setMaxRate:nil];
    [self setPaymentTypes:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

/******************************************************************************/

-(void) setWatParkDetails {
    // Set UILabels of UWSParkingCell
    // The use of stringByReplacingOccurrences is to deal with HTML text
    // Eventually replace this with MWFeedParser
    
    //lot name
    self.lotName.text = [[[[lotDetails objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //hourly rate
    self.hourlyRate.text = [[[[lotDetails objectForKey:@"HourlyCost"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Max Rate
    self.maxRate.text = [[[[lotDetails objectForKey:@"MaxCost"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //After 4 rate
    self.after4Rate.text = [[[[lotDetails objectForKey:@"After4Cost"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Payment Types
    self.paymentTypes.text = [[[[lotDetails objectForKey:@"PaymentType"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

// Used to show destination of building in Google maps
- (IBAction)showOnMap:(id)sender 
{
    // stringByReplacingOccurrencesOfString used to replace HTTP string with regular ASCII string
    NSString *latitude = [[[lotDetails objectForKey:@"Latitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
    
    NSString *longitude = [[[lotDetails objectForKey:@"Longitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
    
    //Append the strings together
    NSString *latLong = [latitude stringByAppendingString:@","];
    latLong = [latLong stringByAppendingString:longitude];
    
    
    NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%@",
                         [latLong stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
