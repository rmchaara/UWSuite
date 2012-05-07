//
//  UWSTreeViewCellFoodInfo.m
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UWSTreeViewCellFoodInfo.h"

#define IMG_HEIGHT_WIDTH 20
#define NO_IMG_HEIGHT 0
#define CELL_HEIGHT 44
#define SCREEN_WIDTH 285
#define LEVEL_INDENT 32
#define LEVEL_INDENT_NO 5
#define NO_IMG_INDENT 10
#define YOFFSET 12
#define XOFFSET 6

@interface UWSTreeViewCellFoodInfo (Private)

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor 
							 fontSize:(CGFloat)fontSize 
								 bold:(BOOL)bold;

@end


@implementation UWSTreeViewCellFoodInfo

@synthesize nameLabel, logoImage, arrowImage, hoursLabel, locationLabel;
@synthesize level, expanded, hasChild;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
           hasChild:(BOOL)_hasChild{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
		self.level = _level;
		self.expanded = _expanded;
        self.hasChild = _hasChild;
		UIView *content = self.contentView;
        
		self.nameLabel = 
        [self newLabelWithPrimaryColor:[UIColor blackColor] 
                         selectedColor:[UIColor whiteColor] 
                              fontSize:15.0 bold:YES];
		self.nameLabel.textAlignment = UITextAlignmentLeft;
        
		[content addSubview:self.nameLabel];
		
		self.arrowImage = 
        [[UIImageView alloc] initWithImage:
         [UIImage imageNamed:self.expanded ? 
          @"CircleArrowDown_sml" : @"CircleArrowRight_sml"]];
		[content addSubview:self.arrowImage];
        
        
        // remove chance to highlight upon selection
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}



#pragma mark -
#pragma mark Memory Management


#pragma mark -
#pragma mark Other overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
	
    if (!self.editing) {
		
		// get the X pixel spot
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
        CGRect imgFrame;
		if (self.hasChild == true) {
            frame = CGRectMake((boundsX + self.level + 1) * LEVEL_INDENT, 
                               0, 
                               SCREEN_WIDTH - (self.level * LEVEL_INDENT), 
                               CELL_HEIGHT);
            self.nameLabel.frame = frame;
            
            
            imgFrame = CGRectMake(((boundsX + self.level + 1) * LEVEL_INDENT) - (IMG_HEIGHT_WIDTH + XOFFSET), 
                                  YOFFSET, 
                                  IMG_HEIGHT_WIDTH, 
                                  IMG_HEIGHT_WIDTH);
            self.arrowImage.frame = imgFrame;
        } else { // no children to select
            frame = CGRectMake((boundsX + (6*self.level) + 1) * LEVEL_INDENT_NO, 
                               0, 
                               SCREEN_WIDTH - (self.level * LEVEL_INDENT_NO), 
                               CELL_HEIGHT);
            self.nameLabel.frame = frame;
            
            
            imgFrame = CGRectMake(((boundsX + (6*self.level) + 1) * 10) - (NO_IMG_HEIGHT + XOFFSET), 
                                  YOFFSET, 
                                  NO_IMG_HEIGHT, 
                                  NO_IMG_HEIGHT);
            self.arrowImage.frame = imgFrame;
        }
        
    }
}

#pragma mark -
#pragma mark Private category

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor 
							 fontSize:(CGFloat)fontSize 
								 bold:(BOOL)bold {
    UIFont *font;
    if (bold) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
	
	UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	newLabel.backgroundColor = [UIColor whiteColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	newLabel.numberOfLines = 1;
	
	return newLabel;
}

@end