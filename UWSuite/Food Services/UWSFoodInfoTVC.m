//
//  UWSFoodInfoTVC.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSFoodInfoTVC.h"
#import "UWSTreeViewCellFoodInfo.h"
#import "UWSAppDelegate.h"


@implementation UWSFoodInfoTVC
@synthesize foodInfoArray = foodInfoArray_;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // on load we want all information to be pulled
    [ApplicationDelegate.mainHTTPGet getFoodServicesInfo:^(NSArray * food) {
        // get the results of the buildings
        self.foodInfoArray = food;
      
        NSString * name;
        NSString * location;
        NSString * logoURL;
        NSMutableDictionary * hours;
        NSDictionary * tempDictionary;
        NSMutableDictionary * foodInfoDictionary = [[NSMutableDictionary alloc] init];
        NSMutableArray * subFoodArray;
        UWSTreeNodeFoodInfo * node;
        UWSTreeNodeFoodInfo * childNode;
        
        int numFood, subFood;

        
        treeNode = [[UWSTreeNodeFoodInfo alloc] initWithName:@"Root" location:@"" hours:nil logoURL:@""];
        
        numFood = self.foodInfoArray.count;
        
        // Restructure the NSDictionary
        for (int i = 0; i < numFood; i++){
            // first get value of current spot
            tempDictionary = [self.foodInfoArray objectAtIndex:i];
            
            name = [[[tempDictionary objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            
            // get contents of the key and add this temp dictionary to it
            subFoodArray = [foodInfoDictionary objectForKey:name];
            if (subFoodArray == nil)
                subFoodArray = [[NSMutableArray alloc] init];
            // add this dictionary to the subfoodarray
            [subFoodArray addObject:tempDictionary];
            
            [foodInfoDictionary setObject:subFoodArray forKey:name];         
                       
        }
        numFood = foodInfoDictionary.count;
        
        NSArray * sortedKeys = [[foodInfoDictionary allKeys] sortedArrayUsingSelector: @selector(caseInsensitiveCompare:)];
        
        // Restructuring is done so we need to throw it all into an array
        self.foodInfoArray = [foodInfoDictionary objectsForKeys: sortedKeys notFoundMarker: [NSNull null]];
        
        
        //self.foodInfoArray = [foodInfoDictionary allValues];
        
        // Actually display the food services info now
        //////////////////////////////////////////////////////////////////////////////////     
        for (int i= 0; i < numFood; i++){
            // first get value of current spot
            subFoodArray = [self.foodInfoArray objectAtIndex:i];
            
            tempDictionary = [subFoodArray objectAtIndex:0];
            name = [[[tempDictionary objectForKey:@"Name"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            
            logoURL = [[[tempDictionary objectForKey:@"Logo"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
            location = @"";
            hours = nil;
            
            // insert parent node here 
            node = [[UWSTreeNodeFoodInfo alloc] initWithName:name location:location hours:hours logoURL:logoURL];
            [treeNode addChild:node]; // add child to treenode
            
            subFood = subFoodArray.count;
            
            for (int j = 0; j < subFood; j++ ){
                tempDictionary = [subFoodArray objectAtIndex:j];
                name = @"";
                
                logoURL = @"";
                location = [[[tempDictionary objectForKey:@"Location"] stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"] stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"'"];
                hours = [tempDictionary objectForKey:@"Hours"];
                
                childNode = [[UWSTreeNodeFoodInfo alloc] initWithName:name location:location hours:hours logoURL:logoURL];
                [node addChild:childNode];
            }    
            
            
            
            
            
        }
                
        [self.tableView reloadData];        
    }
                                              onError:^(NSError* error) {
                                                  
                                              }];
    
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
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
    static NSString *CellIdentifier = @"UWSTreeViewCellFoodInfo";
	NSArray * hoursArray;
    NSMutableString * hoursText;
    NSString * hourLine;
    NSURL *url;
    UIImage * logo;
    
   	UWSTreeNodeFoodInfo *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	UWSTreeViewCellFoodInfo *cell = [[UWSTreeViewCellFoodInfo alloc] initWithStyle:UITableViewCellStyleDefault
                                                                     reuseIdentifier:CellIdentifier 
                                                                               level:[node levelDepth] - 1 
                                                                            expanded:node.inclusive
                                                                            hasChild:node.hasChildren];   
	cell.nameLabel.text = node.name;
    cell.locationLabel.text = node.location;
    hoursArray = [node.hours objectForKey:@"result"];
    
    hoursText = [NSMutableString stringWithString:@""];
    
    for (int i = 0; i < hoursArray.count; i++){
        hourLine = [hoursArray objectAtIndex:i];
        [hoursText appendString:hourLine];
        [hoursText appendString:@"\n"];
    }
    
    cell.hoursLabel.text = hoursText;
    
    // now pull image
    //url = [NSURL URLWithString:node.logoURL];
    //logo = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    //cell.logoImage = [[UIImageView alloc] initWithImage:logo];

    
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
    UWSTreeNodeFoodInfo *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	if (!node.hasChildren) return;
	
	node.inclusive = !node.inclusive;	
	[treeNode flattenElementsWithCacheRefresh:YES];
	[tableView reloadData];
}

@end
