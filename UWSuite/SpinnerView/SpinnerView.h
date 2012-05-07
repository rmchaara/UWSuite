//
//  SpinnerView.h
//  UWSuite
//
//  Created by Ramie Chaarani on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpinnerView : UIView
+(SpinnerView *) loadSpinnerIntoView:(UIView *) superView;
-(void)removeSpinner;
-(UIImage *)addBackground;
@end
