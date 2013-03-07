//
//  ViewController.h
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountDownClock.h"

@interface ViewController : UIViewController <CountDownClockDelegate>
@property (weak, nonatomic) IBOutlet CountDownClock *countDownClock;

@end
