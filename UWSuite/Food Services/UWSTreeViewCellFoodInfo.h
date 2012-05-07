//
//  UWSTreeViewCellFoodInfo.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UWSTreeViewCellFoodInfo : UITableViewCell{
	UILabel *nameLabel;
	UIImageView *logoImage;
    UIImageView *arrowImage;
    UILabel * hoursLabel;
    UILabel *locationLabel;
	
	int level;
	BOOL expanded;
    BOOL hasChild;
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *logoImage;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic, strong) UILabel * hoursLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic) int level;
@property (nonatomic) BOOL expanded;
@property (nonatomic) BOOL hasChild;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
           hasChild:(BOOL)_hasChild; 

@end
