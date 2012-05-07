//
//  HTTPGet.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-02-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HTTPGet.h"

@implementation HTTPGet


-(MKNetworkOperation*) getFoodServicesInfo:(UWResponseBlock) foodJSONBlock onError:(MKNKErrorBlock) errorBlock {
    
    // these parameters are what decide what this call does
    MKNetworkOperation *op = [self operationWithPath:@"public/v1/?key=8629706fa948dd343dee920cd2a492bf&service=FoodServices&output=json" 
                                              params:nil
                                          httpMethod:@"GET"];    
    
    
    
    [op onCompletion:^(MKNetworkOperation *operation) {
        
        //DLog(@"%@", operation);
        // NSLog(@"json: %@", [op responseJSON]);
        NSArray * valueDicResponse = [[[[op responseJSON] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"result"];
        
        foodJSONBlock(valueDicResponse);
        
    } onError:^(NSError *error) {
        
        DLog(@"%@", error);
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
    
}

-(MKNetworkOperation*) getBuildingsInfo:(UWResponseBlock) buildingsJSONBlock onError:(MKNKErrorBlock) errorBlock {
    
    // these parameters are what decide what this call does
    MKNetworkOperation *op = [self operationWithPath:@"public/v1/?key=8629706fa948dd343dee920cd2a492bf&service=Buildings&output=json" 
                                              params:nil
                                          httpMethod:@"GET"];    
    
    
    
    [op onCompletion:^(MKNetworkOperation *operation) {
        
        NSArray * valueDicResponse = [[[[op responseJSON] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"result"];
        buildingsJSONBlock(valueDicResponse);
        
    } onError:^(NSError *error) {
        
        DLog(@"%@", error);
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
    
}

-(MKNetworkOperation*) getExamsInfo:(UWResponseBlock) examJSONBlock onError:(MKNKErrorBlock) errorBlock {
    
    // these parameters are what decide what this call does
    MKNetworkOperation *op = [self operationWithPath:@"public/v1/?key=8629706fa948dd343dee920cd2a492bf&service=ExamSchedule&output=json" 
                                              params:nil
                                          httpMethod:@"GET"];    
    
    
    
    [op onCompletion:^(MKNetworkOperation *operation) {
        
        NSArray * valueDicResponse = [[[[op responseJSON] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"result"];
        examJSONBlock(valueDicResponse);
        
    } onError:^(NSError *error) {
        
        DLog(@"%@", error);
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
    
}



-(MKNetworkOperation*) getWatParkInfo:(UWResponseBlock) watparkJSONBlock onError:(MKNKErrorBlock) errorBlock{
    
    // these parameters are what decide what this call does
    MKNetworkOperation *op = [self operationWithPath:@"public/v1/?key=8629706fa948dd343dee920cd2a492bf&service=WatPark&output=json" 
                                              params:nil
                                          httpMethod:@"GET"];    
    
    
    
    [op onCompletion:^(MKNetworkOperation *operation) {
        
        NSArray * valueDicResponse = [[[[op responseJSON] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"result"];
        watparkJSONBlock(valueDicResponse);
        
    } onError:^(NSError *error) {
        
        DLog(@"%@", error);
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
    
}

-(MKNetworkOperation*) getOmgInfo:(UWResponseBlock) omgJSONBlock onError:(MKNKErrorBlock) errorBlock{
    // these parameters are what decide what this call does
    MKNetworkOperation *op = [self operationWithPath:@"public/v1/?key=8629706fa948dd343dee920cd2a492bf&service=OMGUW&output=json" 
                                              params:nil
                                          httpMethod:@"GET"];    
    
    
    
    [op onCompletion:^(MKNetworkOperation *operation) {
        
        NSArray * valueDicResponse = [[[[[op responseJSON] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"OMG"] objectForKey:@"result"];
        omgJSONBlock(valueDicResponse);
        
    } onError:^(NSError *error) {
        
        DLog(@"%@", error);
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op; 
}


@end