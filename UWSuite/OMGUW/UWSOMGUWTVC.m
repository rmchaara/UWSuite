//
//  UWSOMGUWTVC.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSOMGUWTVC.h"
#import "UWSAppDelegate.h"
#import "UWSOMGUWCell.h"
#import "SpinnerView.h"


@implementation UWSOMGUWTVC
@synthesize omgArray = omgArray_;
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
    
    spinner = [SpinnerView loadSpinnerIntoView:self.view];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    // on load we want all information to be pulled asynchronously
    
    [ApplicationDelegate.mainHTTPGet getOmgInfo:^(NSArray *omg) {
        
        self.omgArray = omg;
        [self.tableView reloadData];
        [spinner removeSpinner];
        
        
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.omgArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{               
    static NSString *CellIdentifier = @"UWSOMGCell";
    
    UWSOMGUWCell *cell = (UWSOMGUWCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    NSDictionary *thisOMGInfo = [self.omgArray objectAtIndex:indexPath.row];
    
    // Set Cell data
    [cell setOmgData:thisOMGInfo];
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

//Is called to set the background colours (can customize the cell here)
- (void)tableView:(UITableView *)tableView willDisplayCell:(UWSOMGUWCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    double colours[6] = {134.0,47.0,92.0,237.0,85.0,158.0};
    [cell setCellColours:colours atRowNumber:indexPath.row];
    
}

// accessoryButtonTappedForRowWithIndexPath is used to redirect users to the original OMGUW link
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *thisOMGInfo = [self.omgArray objectAtIndex:indexPath.row];
    
    NSString *omgURL = [[[thisOMGInfo objectForKey:@"Link"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
    
    // Open link in iOS browser
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:omgURL]];
    
    
}


@end