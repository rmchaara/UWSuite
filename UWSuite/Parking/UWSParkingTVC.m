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
@synthesize watparkDetailsArray = watparkDetailsArray_;

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
    // Set timer to HTTP GET every 60 seconds
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
    [ApplicationDelegate.mainHTTPGet getWatParkInfo:^(NSArray *park) {
        
        self.watparkArray = park;
        [self.tableView reloadData];
        [spinner removeSpinner];        
        
    }onError:^(NSError *error) {
        
    }];
   
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
        
        
    }onError:^(NSError *error) { // onError we want to alert the user of connectivity issues
        [spinner removeSpinner];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not reach a connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [ApplicationDelegate.mainHTTPGet getWatParkDetails:^(NSArray *park) {
        
        self.watparkDetailsArray = park;
        [self.tableView reloadData];            
    }onError:^(NSError *error) { // onError we want to alert the user of connectivity issues
        [spinner removeSpinner];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not reach a connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
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

//Is called to set the background colours (can customize the cell here)
- (void)tableView:(UITableView *)tableView willDisplayCell:(UWSParkingCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    double colours[6] = {56.0,51.0,32.0,170.0,147.0,56.0};
    [cell setCellColours:colours atRowNumber:indexPath.row];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{               
    static NSString *CellIdentifier = @"UWSParkingCell";
    UWSParkingCell*cell = (UWSParkingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *thisWatParkInfo = [self.watparkArray objectAtIndex:indexPath.row];
       
    // set WatPark Cell Information
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

// Used to create header for this TableView List
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 22)];
    UILabel *label = [[UILabel alloc] initWithFrame:headerView.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"    Lot         Spaces Available       Locator";
    label.backgroundColor = [UIColor colorWithRed:170.0/255.0 green:147.0/255.0 blue:56.0/255.0 alpha:1.0];
;
    
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

//Prepares for the segue for parking details by finding the correct row in the details
// and setting it in ParkingDetails
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    NSDictionary *lotMain = [self.watparkArray objectAtIndex:index.row];
    NSUInteger detailsIndex = 0;
        
    //The name in the row of watparkArray
    NSString *name = [[[[lotMain objectForKey:@"LotName"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                                         [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Itterate through the details array and if there is a name match, break
    for (id object in self.watparkDetailsArray) 
    {
        //The name in the current row of watparkDetails
        NSString *detailsName = [[[[object objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"]stringByTrimmingCharactersInSet:
                                 [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if([name isEqualToString:detailsName]){
            break;
        }
        
        //If not found, increment
        detailsIndex +=1;
    }
    
    [segue.destinationViewController setLot:[self.watparkDetailsArray objectAtIndex:detailsIndex]];
    
}


@end