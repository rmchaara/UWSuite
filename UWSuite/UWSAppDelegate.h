//
//  UWSAppDelegate.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-02-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPGet.h"

#define ApplicationDelegate ((UWSAppDelegate *)[UIApplication sharedApplication].delegate)

@interface UWSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HTTPGet *mainHTTPGet; // Main HTTP Get class instance

@end
