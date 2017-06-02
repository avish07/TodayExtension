//
//  TodayViewController.m
//  WidgetTodayExtension
//
//  Created by gh on 6/1/17.
//  Copyright © 2017 Slack. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#ifdef DEV
#define titleText @"ExtensionWidgetTarget1"
#else
#define titleText @"ExtensionWidgetTarget2"
#endif

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self.extensionContext respondsToSelector:@selector(setWidgetLargestAvailableDisplayMode:)]) {
        [self.extensionContext setWidgetLargestAvailableDisplayMode:NCWidgetDisplayModeExpanded];
    }
    else
    {
        self.preferredContentSize = CGSizeMake(0, 170);
    }
    
    [self updateWidget];
}

-(void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        textLblHeightConstraint.constant = 67;
        self.preferredContentSize = CGSizeMake(0, 170);
    }
    else if (activeDisplayMode == NCWidgetDisplayModeCompact){
        textLblHeightConstraint.constant = 21;
        self.preferredContentSize = maxSize;
    }
}

-(void)updateWidget{
    [titleLbl setText:titleText];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.Guesthouser"];
    [textLbl setText: [[defaults objectForKey:@"data"] length]? [defaults objectForKey:@"data"]: @"open the app and put some input in textbox and tap on Set Widget Text button."];
}

-(IBAction)triggerPush:(id)sender{
    NSURL *url = [NSURL URLWithString:@"push:"];
    
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
