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

- (void)setup {
   // NSLog(@"Test");
    self.active = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(updateCountDown:)
                                                userInfo:nil
                                                 repeats:YES];
    
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
   // CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
   // CGContextFillRect(context, rect);
    CGContextSetFillColorWithColor(context, self.textColor.CGColor);
    
    NSString *myText = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", [self.components hour], [self.components minute], [self.components second]];
    //[myText drawInRect:rect withFont:self.textFont];
    [myText drawInRect:rect withFont:self.textFont lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}

- (void)updateCountDown:(NSTimer *)timer {
    //NSLog(@"updateCountDown");
    
    NSUInteger calendarUnits = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

    if (self.active) {
        self.components = [self.calendar components:calendarUnits fromDate:[NSDate date] toDate:self.endDate options:0];
        [self setNeedsDisplay];
        
        if ([self.endDate timeIntervalSinceNow] < 0) {
            self.active = NO;
            [self.delegate countDownClockDidFinish:self];
        }
    }
}

@end
