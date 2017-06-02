//
//  ViewController.m
//  Extensions
//
//  Created by gh on 6/1/17.
//  Copyright © 2017 Slack. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     txtFieldObj.text = nil;
    [self addNotificationObserver];
    [self checkForPush];
}

-(void)viewWillAppear:(BOOL)animated{
    txtFieldObj.text = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNotificationObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pushToSecondVC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkForPush) name:@"pushToSecondVC" object:nil];
    
}

-(IBAction)setWidgetText:(id)sender{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.Guesthouser"];
    [defaults setValue:txtFieldObj.text forKey:@"data"];
}

-(void)checkForPush{
    if ([AppDelegate delegate].ispush) {
        [AppDelegate delegate].ispush = 0;
        SecondVC *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
}

@end
