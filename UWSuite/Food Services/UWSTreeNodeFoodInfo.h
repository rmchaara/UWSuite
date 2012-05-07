//
//  UWSTreeNodeFoodInfo.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UWSTreeNodeFoodInfo.h"

@interface UWSTreeNodeFoodInfo : NSObject{
	int index;
	NSString *name;
    NSString *location;
    NSMutableDictionary *hours;
    NSString *logoURL;
	UWSTreeNodeFoodInfo *parent;
	NSMutableArray *children;
	BOOL inclusive;
	NSArray *flattenedTreeCache;
}

@property (nonatomic) int index;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSMutableDictionary *hours;
@property (nonatomic, strong) NSString *logoURL;
@property (nonatomic, strong) UWSTreeNodeFoodInfo *parent;
@property (nonatomic, strong, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive;

- (id)initWithName:(NSString *)_name location:(NSString *)_location hours:(NSMutableDictionary *)_hours logoURL:_logoURL;

- (void)addChild:(UWSTreeNodeFoodInfo *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)levelDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end
