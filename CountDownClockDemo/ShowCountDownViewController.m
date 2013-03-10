//
//  ShowCountDownViewController.m
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import "ShowCountDownViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ShowCountDownViewController ()

@end

@implementation ShowCountDownViewController

@synthesize countDownSeconds = _countDownSeconds;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.countDownClock.delegate = self;
    self.countDownClock.textFont = [UIFont fontWithName:@"Helvetica" size:60.0];
    self.countDownClock.textColor = [UIColor redColor];
    self.countDownClock.layer.borderColor = [UIColor blackColor].CGColor;
    self.countDownClock.layer.borderWidth = 2.0;
    [self.countDownClock startClockWithDuration:self.countDownSeconds];    
    self.countDownComplete.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countDownClockDidFinish:(CountDownClock *)sender {
    self.countDownComplete.alpha = 1.0;
}

@end
