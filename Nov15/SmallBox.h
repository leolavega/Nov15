//
//  SmallBox.h
//  Nov15
//
//  Created by Leonardo Lavega on 11/28/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@interface SmallBox : UIView{
	
	int idNumber;
	UITapGestureRecognizer *tapRecognizer;
	UILabel *textBox;
	int number;
	BOOL touched;
	
}

- (id) initWithFrame:(CGRect)frame withValue:(int) value withId:(int)idValue withSuperView:(View*) view;
- (void) addOne;
- (void) subOne;
- (int) getValue;
- (void) flipView;
- (void) resetView;

@end
