//
//  MyTreeNode.h
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UWSTreeNodeBuildings.h"

@interface UWSTreeNodeBuildings : NSObject {
	int index;
	NSString *value;
    NSString *latitude;
    NSString *longitude;
	UWSTreeNodeBuildings *parent;
	NSMutableArray *children;
	BOOL inclusive;
	NSArray *flattenedTreeCache;
}

@property (nonatomic) int index;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) UWSTreeNodeBuildings *parent;
@property (nonatomic, strong, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive;

- (id)initWithValue:(NSString *)_value longitude:(NSString *)_longitude latitude:(NSString *)_latitude;

- (void)addChild:(UWSTreeNodeBuildings *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)levelDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end