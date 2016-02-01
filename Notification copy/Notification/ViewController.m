//
//  ViewController.m
//  Notification
//
//  Created by Xiaodan Wang on 2/1/16.
//  Copyright © 2016 Xiaodan Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _showLabel.text=@"First";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel:) name:@"KUpdateFirst" object:nil];

}
- (void)viewWillAppear:(BOOL)animated{
    [self regiseterLocalNotificationCode];

}

#pragma mark -Implement UILocal Notification-
- (void)regiseterLocalNotificationCode{
    UILocalNotification *local = [[UILocalNotification alloc]init];
    if (local){
        local.fireDate= [NSDate date];
        local.timeZone= [NSTimeZone defaultTimeZone];
        local.soundName= UILocalNotificationDefaultSoundName;
        local.repeatInterval= kCFCalendarUnitMinute/10;
        local.alertBody= @"My Alert Local Notification";
    }
    
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
    [[UIApplication sharedApplication] presentLocalNotificationNow:local];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabel:(NSNotification *)notify {
    _showLabel.text=@"Second";
    NSLog(@"%@",notify);
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"alert" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
//    [[NSNotificationCenter defaultCenter]removeObserver:self  name:@"KUpdateFirst" object:nil];
}


@end
