//
//  Nov15AppDelegate.h
//  Nov15
//
//  Created by Leonardo Lavega on 11/15/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Nov15AppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
