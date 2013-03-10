//
//  ShowCountDownViewController.h
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountDownClock.h"

@interface ShowCountDownViewController : UIViewController <CountDownClockDelegate>
@property (weak, nonatomic) IBOutlet CountDownClock *countDownClock;
@property (weak, nonatomic) IBOutlet UILabel *countDownComplete;
@property (nonatomic) NSTimeInterval countDownSeconds;

@end
