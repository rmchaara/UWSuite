//
//  MyTreeNode.m
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UWSTreeNodeBuildings.h"

@implementation UWSTreeNodeBuildings

@synthesize index, value, latitude, longitude;
@synthesize parent, children;
@synthesize inclusive;


#pragma mark -
#pragma mark Initializers

- (id)initWithValue:(NSString *)_value longitude:(NSString *)_longitude latitude:(NSString *)_latitude  {
	self = [super init];
	if (self) {
		value = _value;
        longitude = _longitude;
        latitude = _latitude;
		inclusive = YES;
	}
	
	return self;
}

#pragma mark -
#pragma mark Custom Properties

- (NSMutableArray *)children {
	if (!children) {
		children = [[NSMutableArray alloc] initWithCapacity:1];
	}
	
	return children;
}

#pragma mark -
#pragma mark Memory Management


#pragma mark -
#pragma mark Methods

- (NSUInteger)descendantCount {
	NSUInteger cnt = 0;
	
	for (UWSTreeNodeBuildings *child in self.children) {
		if (self.inclusive) {
			cnt++;
			if (child.children.count > 0) {
				cnt += [child descendantCount];
			}
		}
	}
	
	return cnt;
}

- (NSArray *)flattenElements {
	return [self flattenElementsWithCacheRefresh:NO];
}

- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate {
	if (!flattenedTreeCache || invalidate) {
		//if there was a previous cache and due for invalidate, release resources first
		if (flattenedTreeCache) {
			flattenedTreeCache = nil;
		}
		
		NSMutableArray *allElements = [[NSMutableArray alloc] initWithCapacity:[self descendantCount]];
		[allElements addObject:self];
		
		if (inclusive) {
			for (UWSTreeNodeBuildings *child in self.children) {
				[allElements addObjectsFromArray:[child flattenElementsWithCacheRefresh:invalidate]];
			}
		}
		
		flattenedTreeCache = [[NSArray alloc] initWithArray:allElements];
	}
	
	return flattenedTreeCache;
}

- (void)addChild:(UWSTreeNodeBuildings *)newChild {
	newChild.parent = self;
	[self.children addObject:newChild];
}

- (NSUInteger)levelDepth {
	if (!parent) return 0;
	
	NSUInteger cnt = 0;
	cnt++;
	cnt += [parent levelDepth];
	
	return cnt;
}

- (BOOL)isRoot {
	return (!parent);
}

- (BOOL)hasChildren {
	return (self.children.count > 0);
}

@end