//
//  CountDownClock.m
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/6/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import "CountDownClock.h"

@interface CountDownClock ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDateComponents *components;
@property (nonatomic) BOOL active;
@end

@implementation CountDownClock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [self setup];
}

- (void)setup
{
    self.active = YES;
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(updateCountDown:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.textColor.CGColor);
    
    int hour = 0;
    int minute = 0;
    int second = 0;
    
    if (self.active) {
        hour = [self.components hour];
        minute = [self.components minute];
        second = [self.components second];
    }
    
    NSString *myText = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", hour, minute, second];
    [myText drawInRect:rect withFont:self.textFont lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];

}

- (void)updateCountDown:(NSTimer *)timer {

    NSUInteger calendarUnits = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    if (self.active) {
        self.components = [self.calendar components:calendarUnits fromDate:[NSDate date] toDate:self.endDate options:0];
        
        if ([self.endDate timeIntervalSinceNow] < 0) {
            self.active = NO;
            [self.delegate countDownClockDidFinish:self];
        }
    }
    
    [self setNeedsDisplay];
}


@end
