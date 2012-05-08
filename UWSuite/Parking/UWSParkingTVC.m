//
//  UWSParkingTVC.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSParkingTVC.h"
#import "UWSAppDelegate.h"
#import "UWSParkingCell.h"
#import "SpinnerView.h"


@implementation UWSParkingTVC
@synthesize watparkArray = watparkArray_;
@synthesize timer = timer_;

SpinnerView *spinner;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Banner-02.png"]];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 60.0 target:self selector:@selector(targetMethod:) userInfo:nil repeats: YES];
    spinner = [SpinnerView loadSpinnerIntoView:self.view];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) targetMethod: (NSTimer *) theTimer {
    // on load we want all information to be pulled
    spinner = [SpinnerView loadSpinnerIntoView:self.view];
    [ApplicationDelegate.mainHTTPGet getWatParkInfo:^(NSArray *park) {
        
        self.watparkArray = park;
        [self.tableView reloadData];
        [spinner removeSpinner];
        
        
    }onError:^(NSError *error) {
        
    }];
    // super call
    [super viewDidLoad];
   
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{    
    
    // on load we want all information to be pulled
    
    [ApplicationDelegate.mainHTTPGet getWatParkInfo:^(NSArray *park) {
        
        self.watparkArray = park;
        [self.tableView reloadData];
        [spinner removeSpinner];
        
        
    }onError:^(NSError *error) {
        
    }];
    
    // super call
    [super viewDidLoad];
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.watparkArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{               
    static NSString *CellIdentifier = @"UWSParkingCell";
    
    UWSParkingCell*cell = (UWSParkingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    NSDictionary *thisWatParkInfo = [self.watparkArray objectAtIndex:indexPath.row];
    
    // Eliminate the need for double the information (restaurents with the same name in diff locations
    
    
    
    // code from Stanford Tutorial
    [cell setWatParkData:thisWatParkInfo];
	return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 22)];
    UILabel *label = [[UILabel alloc] initWithFrame:headerView.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"    Lot         Spaces Available       Locator";
    label.backgroundColor = [UIColor blueColor];
    
    [headerView addSubview:label];
    return headerView;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *thisWatParkInfo = [self.watparkArray objectAtIndex:indexPath.row];
    
    
    
    NSString *latlong = [[[thisWatParkInfo objectForKey:@"LatLong"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
   
    NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%@",
                     [latlong stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    
}


@end