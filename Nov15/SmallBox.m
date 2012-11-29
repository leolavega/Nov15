//
//  SmallBox.m
//  Nov15
//
//  Created by Leonardo Lavega on 11/28/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "SmallBox.h"
#import "View.h"

@implementation SmallBox


	static	int totalBoxesChecked = 0;
	//this variable will be used for messaging between the diffent UIViews
	View *superView;

//Not used
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame withValue:(int) value withId:(int) idValue withSuperView:(View*) view
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor redColor];
		superView = view;
		idNumber = idValue;
		number = value;
		textBox = [[UILabel alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height)];
		textBox.backgroundColor = [UIColor clearColor];
		textBox.userInteractionEnabled = NO;
		textBox.textAlignment = NSTextAlignmentCenter;
		textBox.font = [UIFont systemFontOfSize:self.bounds.size.height/2];
		
		//each smallBox instance will recognize the tap gesture
		tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
		[self addGestureRecognizer:tapRecognizer];
		
		[self addSubview:textBox];
    }
    return self;
}


- (void)handleTap:(UITapGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateEnded){
		//case when box is already selected
		if(touched){
			return;
		}
		else{
			//case when no box is yet selected
			if(totalBoxesChecked==0){
				[self flipView];
				[superView setUpFirstBoxwithID:idNumber];
			}
			else{
				//case when one box is already selected
				if(totalBoxesChecked==1){
					[self flipView];
					[superView setUpSecondtBoxwithID:idNumber];
				}
				//case when the maximun of two boxes are selected
				else{
					//ignore
				}
			}
		}
	}
}

- (int) getValue{
	return number;
}

//update the number of boxes currently selected
- (void) addOne{
	totalBoxesChecked += 1;
}
- (void) subOne{
	totalBoxesChecked -= 1;
	
}

//this method will reveal the value(number) of the current box
- (void) flipView{
	[self addOne];
	touched = !touched;
	self.backgroundColor = [UIColor yellowColor];
	textBox.text = [NSString stringWithFormat:@"%d",number];
}

//this method will reset the box to its original state
- (void) resetView{
	touched = !touched;
	self.backgroundColor = [UIColor redColor];
	textBox.text = @"";
	[self subOne];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
