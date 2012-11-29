//
//  View.h
//  Nov15
//
//  Created by Leonardo Lavega on 11/15/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SmallView;

@interface View : UIView{
	
	NSMutableArray *numbers;
	NSMutableArray *boxes;
	int idNumberBox1;
	int idNumberBox2;
	
}

-(void)setUpFirstBoxwithID:(int)idNumber;
-(void)setUpSecondtBoxwithID:(int)idNumber;

@end
