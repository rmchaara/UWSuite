//
//  UWSTreeViewCellBuildings.m
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UWSTreeViewCellBuildings.h"

#define IMG_HEIGHT_WIDTH 20
#define NO_IMG_HEIGHT 0
#define CELL_HEIGHT 44
#define SCREEN_WIDTH 285
#define LEVEL_INDENT 32
#define LEVEL_INDENT_NO 5
#define NO_IMG_INDENT 10
#define YOFFSET 12
#define XOFFSET 6

@interface UWSTreeViewCellBuildings (Private)

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor 
							 fontSize:(CGFloat)fontSize 
								 bold:(BOOL)bold;

@end


@implementation UWSTreeViewCellBuildings

@synthesize valueLabel, arrowImage;
@synthesize level, expanded, hasChild;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
           hasChild:(BOOL)_hasChild{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // set accessory type for location
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		self.level = _level;
		self.expanded = _expanded;
        self.hasChild = _hasChild;
		UIView *content = self.contentView;
    
		self.valueLabel = 
        [self newLabelWithPrimaryColor:[UIColor blackColor] 
                         selectedColor:[UIColor whiteColor] 
                              fontSize:15.0 bold:YES];
		self.valueLabel.textAlignment = UITextAlignmentLeft;

		[content addSubview:self.valueLabel];
		
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
            self.valueLabel.frame = frame;
            
            
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
            self.valueLabel.frame = frame;
            
            
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