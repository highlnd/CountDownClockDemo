//
//  ViewController.m
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.countDownClock.endDate = [[NSDate date] dateByAddingTimeInterval:3600.0];
    self.countDownClock.delegate = self;
    self.countDownClock.textFont = [UIFont fontWithName:@"Helvetica" size:40.0];
    self.countDownClock.textColor = [UIColor redColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countDownClockDidFinish:(CountDownClock *)sender {
    NSLog(@"Clock finished!");
}

@end
