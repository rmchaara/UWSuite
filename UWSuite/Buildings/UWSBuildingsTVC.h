//
//  UWSBuildingsTVC.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UWSTreeNodeBuildings.h"

@interface UWSBuildingsTVC : UITableViewController{
    UWSTreeNodeBuildings *treeNode;
    
}
@property (strong, nonatomic) NSArray *buildingsArray;
@end
