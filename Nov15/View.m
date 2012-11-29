//
//  View.m
//  Nov15
//
//  Created by Leonardo Lavega on 11/15/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "View.h"
#import "SmallBox.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		
		idNumberBox1 = idNumberBox2 = 0;
		int boxesPerRows = 6;
		int totalNumberOfBoxes = 48;
		//size of each small box
		CGFloat widthOfBox = self.bounds.size.width/boxesPerRows -15;
		CGFloat heightOfBox = self.bounds.size.height/(totalNumberOfBoxes/boxesPerRows) -15;
		
		//generating numbers for each box
		numbers = [[NSMutableArray alloc] init ];
		for(int i = 1; i<= totalNumberOfBoxes/2; i++){
			[numbers addObject:[NSString stringWithFormat:@"%d",i]];
			[numbers addObject:[NSString stringWithFormat:@"%d",i]];
		}
		
		//shuffling the values to generate a random order
		for(int i = 50*numbers.count; i >= 0; i--){
			int index1 = arc4random()%numbers.count;
			int index2 = arc4random()%numbers.count;
			[numbers exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
		}
			
		//generating the boxes
		int x = 10;
		int y = 10;
		
		boxes = [NSMutableArray array] ;
		for(int i = 0; i < totalNumberOfBoxes; i++){
			CGRect bound = CGRectMake(x, y, widthOfBox, heightOfBox);
			[boxes addObject:[[SmallBox alloc] initWithFrame:bound withValue:[[numbers objectAtIndex:i] integerValue] withId:i withSuperView:self]];
			[self addSubview:[boxes objectAtIndex:i]];
			//updating coordinates for each box
			if((i+1)%boxesPerRows == 0)
				x = 10;
			else
				x+= 13 + widthOfBox;
			if((i+1)%boxesPerRows == 0)
				y += (10+heightOfBox);
		}
			
	}
    return self;
}

//this method will be called by the smallBox subView
-(void)setUpFirstBoxwithID:(int)idNumber{
	idNumberBox1 = idNumber;
}

//this method will be called by the smallBox subView
-(void)setUpSecondtBoxwithID:(int)idNumber{
	idNumberBox2 = idNumber;
	SmallBox *temp1 = [ boxes objectAtIndex:idNumberBox1];
	SmallBox *temp2 = [ boxes objectAtIndex:idNumberBox2];
	//if the boxes contain the same value the boxes will be removed from the main view
	if(temp1.getValue == temp2.getValue){
		NSArray *arr = [NSArray arrayWithObjects:temp1,temp2, nil];
		[self performSelector:@selector(removeBoxesFromViewAfterDelayWithObject:) withObject:arr afterDelay:1.0];
		
	}
	//otherwise the boxes will return to their original state
	else{
		//reset the boxe's view after a short delay
		NSArray *arr = [NSArray arrayWithObjects:temp1,temp2, nil];
		[self performSelector:@selector(resetViewsAfterDelayWithObject:) withObject:arr afterDelay:1.0];
		
	}
}

-(void) resetViewsAfterDelayWithObject:(NSArray*) arr{
	SmallBox *temp1 = [arr objectAtIndex:0];
	SmallBox *temp2 = [arr objectAtIndex:1];
	[temp1 resetView];
	[temp2 resetView];
	
}

-(void) removeBoxesFromViewAfterDelayWithObject:(NSArray*) arr{
	SmallBox *temp1 = [arr objectAtIndex:0];
	SmallBox *temp2 = [arr objectAtIndex:1];
	[temp1 resetView];
	[temp1 removeFromSuperview];
	[temp2 resetView];
	[temp2 removeFromSuperview];

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
