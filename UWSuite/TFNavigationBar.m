//
//  TFNavigationBar.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFNavigationBar.h"

@implementation TFNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed: @"Banner-02.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
