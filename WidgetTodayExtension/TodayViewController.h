//
//  TodayViewController.h
//  WidgetTodayExtension
//
//  Created by gh on 6/1/17.
//  Copyright © 2017 Slack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController{
    __weak IBOutlet UILabel *textLbl, *titleLbl;
    IBOutlet NSLayoutConstraint *textLblHeightConstraint;
}
-(IBAction)triggerPush:(id)sender;
@end
