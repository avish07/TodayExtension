//
//  AppDelegate.h
//  Extensions
//
//  Created by gh on 6/1/17.
//  Copyright © 2017 Slack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
}

@property(nonatomic)bool ispush;
@property (strong, nonatomic) UIWindow *window;

+(AppDelegate *)delegate;

@end

