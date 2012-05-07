//
//  UWSFoodInfoTVC.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UWSTreeNodeFoodInfo.h"

@interface UWSFoodInfoTVC : UITableViewController{
    UWSTreeNodeFoodInfo *treeNode;
    
}

@property (strong, nonatomic) NSArray *foodInfoArray;

@end
