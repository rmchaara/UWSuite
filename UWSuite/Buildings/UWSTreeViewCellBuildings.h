//
//  UWSTreeViewCellBuildings.h
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UWSTreeViewCellBuildings : UITableViewCell {
	UILabel *valueLabel;
	UIImageView *arrowImage;
	
	int level;
	BOOL expanded;
    BOOL hasChild;
}

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic) int level;
@property (nonatomic) BOOL expanded;
@property (nonatomic) BOOL hasChild;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
           hasChild:(BOOL)_hasChild; 

@end
