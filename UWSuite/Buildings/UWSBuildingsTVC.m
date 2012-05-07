//
//  UWSBuildingsTVC.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSBuildingsTVC.h"
#import "UWSTreeViewCellBuildings.h"
#import "UWSAppDelegate.h"


@implementation UWSBuildingsTVC
@synthesize buildingsArray = buildingsArray_;

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
 
    
    // on load we want all information to be pulled
    [ApplicationDelegate.mainHTTPGet getBuildingsInfo:^(NSArray * buildings) {
        // get the results of the buildings
        self.buildingsArray = buildings;
        NSArray * blockBuildings ;
        // declare temp variables
        NSString * buildingName;
        NSString * latitude;
        NSString * longitude;
        NSDictionary* tempDictionary;
        UWSTreeNodeBuildings *node;
        UWSTreeNodeBuildings *childNode;
        int numBuildings, numBlocks;
        
        treeNode = [[UWSTreeNodeBuildings alloc] initWithValue:@"Root" longitude:@"" latitude:@""];
        
        
        numBuildings = self.buildingsArray.count;
        
        
        for (int i = 0; i < numBuildings; i++){
            // first get value of current spot
            tempDictionary = [self.buildingsArray objectAtIndex:i];
            
           
            
            
            // now get name of current building
            buildingName = [[[tempDictionary objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            latitude = [[[tempDictionary objectForKey:@"Latitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            longitude = [[[tempDictionary objectForKey:@"Longitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            
            // now add the blocks
            node = [[UWSTreeNodeBuildings alloc] initWithValue:buildingName longitude:longitude latitude:latitude];
            node.inclusive = NO;
            //[node flattenElementsWithCacheRefresh:YES];
            [treeNode addChild:node];
            
            
            
            blockBuildings = [[tempDictionary objectForKey:@"Blocks"] objectForKey:@"result"];
            numBlocks = blockBuildings.count;
            
            if (numBlocks > 0){
                for (int k = 0; k < numBlocks; k++){
                    tempDictionary = [blockBuildings objectAtIndex:k];
                    // now get name of current building
                    buildingName = [[[tempDictionary objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
                    latitude = [[[tempDictionary objectForKey:@"Latitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
                    longitude = [[[tempDictionary objectForKey:@"Longitude"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
                    
                    childNode = [[UWSTreeNodeBuildings alloc] initWithValue:buildingName longitude:longitude latitude:latitude];
                    [node addChild:childNode];
                    
                }

            }
        }
        
        
        [self.tableView reloadData];        
    }
                                              onError:^(NSError* error) {
                                                  
                                              }];
    
    // super call
    [super viewDidLoad];
    
	    /*
	UWSTreeNodeBuildings *node1 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1"];
	[treeNode addChild:node1];
	
	UWSTreeNodeBuildings *node1a = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1a"];
	UWSTreeNodeBuildings *node1b = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1b"];
	[node1 addChild:node1a];
	[node1 addChild:node1b];
	
	UWSTreeNodeBuildings *node1a1 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1a1"];
	[node1a addChild:node1a1];
	
	UWSTreeNodeBuildings *node1b1 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1b1"];
	UWSTreeNodeBuildings *node1b2 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1b2"];
	UWSTreeNodeBuildings *node1b3 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node1b3"];
	
	[node1b addChild:node1b1];
	[node1b addChild:node1b2];
	[node1b addChild:node1b3];
	node1b.inclusive = NO;
	
	UWSTreeNodeBuildings *node2 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node2"];
	[treeNode addChild:node2];
	
	UWSTreeNodeBuildings *node2a = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node2a"];
	[node2 addChild:node2a];
	
	UWSTreeNodeBuildings *node2a1 = [[UWSTreeNodeBuildings alloc] initWithValue:@"Node2a1"];
	[node2a addChild:node2a1];
     */
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
    return [treeNode descendantCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	
   	UWSTreeNodeBuildings *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	UWSTreeViewCellBuildings *cell = [[UWSTreeViewCellBuildings alloc] initWithStyle:UITableViewCellStyleDefault
												 reuseIdentifier:CellIdentifier 
														   level:[node levelDepth] - 1 
														expanded:node.inclusive
                                                        hasChild:node.hasChildren];   
	cell.valueLabel.text = node.value;
	
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
    UWSTreeNodeBuildings *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	if (!node.hasChildren) return;
	
	node.inclusive = !node.inclusive;	
	[treeNode flattenElementsWithCacheRefresh:YES];
	[tableView reloadData];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    UWSTreeNodeBuildings *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
   

  
    NSString *lat = [node latitude];
    NSString *lon = [node longitude];
    NSMutableString* latlong = [NSMutableString stringWithString: lat];
    [latlong appendString: @", "];
    [latlong appendFormat:lon];
    NSLog(@"%@", latlong);
    
    NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%@",
                     [latlong stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
     
     
}

@end
