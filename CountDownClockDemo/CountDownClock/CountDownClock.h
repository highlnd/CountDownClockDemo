//
//  CountDownClock.h
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountDownClockDelegate;

@interface CountDownClock : UIView

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) id <CountDownClockDelegate> delegate;

- (void)startClockWithDuration:(NSTimeInterval)timeInterval;
- (NSTimeInterval)secondsUntilCountDownWillEnd;
- (NSDate *)dateCountDownWillEnd;

@end

@protocol CountDownClockDelegate

- (void)countDownClockDidFinish:(CountDownClock *)sender;

@end