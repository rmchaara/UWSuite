//
//  HTTPGet.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-02-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPGet : MKNetworkEngine

// response type
typedef void (^UWResponseBlock)(NSArray* response);
// API Key is hard coded in .m file
// Get Buildings Information
-(MKNetworkOperation*) getBuildingsInfo:(UWResponseBlock) buildingsJSONBlock onError:(MKNKErrorBlock) errorBlock;
// Get Exams Information
-(MKNetworkOperation*) getExamsInfo:(UWResponseBlock) examJSONBlock onError:(MKNKErrorBlock) errorBlock;
// Get FoodServices Information
-(MKNetworkOperation*) getFoodServicesInfo:(UWResponseBlock) foodJSONBlock onError:(MKNKErrorBlock) errorBlock;

-(MKNetworkOperation*) getWatParkInfo:(UWResponseBlock) watparkJSONBlock onError:(MKNKErrorBlock) errorBlock;

-(MKNetworkOperation*) getOmgInfo:(UWResponseBlock) omgJSONBlock onError:(MKNKErrorBlock) errorBlock;

@end
