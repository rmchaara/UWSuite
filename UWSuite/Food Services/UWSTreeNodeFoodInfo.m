//
//  UWSTreeNodeFoodInfo.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSTreeNodeFoodInfo.h"

@implementation UWSTreeNodeFoodInfo

@synthesize index, name, location, logoURL, hours;
@synthesize parent, children;
@synthesize inclusive;


#pragma mark -
#pragma mark Initializers

- (id)initWithName:(NSString *)_name location:(NSString *)_location hours:(NSMutableDictionary *)_hours logoURL:_logoURL {
	self = [super init];
	if (self) {
		name = _name;
        location = _location;
        logoURL = _logoURL;
        hours = _hours;
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
	
	for (UWSTreeNodeFoodInfo *child in self.children) {
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
			for (UWSTreeNodeFoodInfo *child in self.children) {
				[allElements addObjectsFromArray:[child flattenElementsWithCacheRefresh:invalidate]];
			}
		}
		
		flattenedTreeCache = [[NSArray alloc] initWithArray:allElements];
	}
	
	return flattenedTreeCache;
}

- (void)addChild:(UWSTreeNodeFoodInfo *)newChild {
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