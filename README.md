CountDownClock
===

CountDownClock is just a very simple digital countdown clock that, given an end date and time will countdown to that date and time.

CountDownClock uses ARC and must be built with Xcode 4.5 or greater.

Installation
====

Download the source from this repository and then add `CountDownClock.h` and `CountDownClock.m` to your project.

Usage
====

In your UIViewController subclass allocate an instance of the CountDownClock and customize it in `viewDidLoad:`

    - (void)viewDidLoad
    {
        [super viewDidLoad];
        
        // Sets the CountDownClock with an end date of 60 seconds from now, the color red
        // and 60 point font
        [self.countDownClock startClockWithDuration:60];
        self.countDownClock.textFont = [UIFont fontWithName:@"Helvetica" size:60.0];
        self.countDownClock.textColor = [UIColor redColor];

    }
    
If you want to know when the `CountDownClock` instance counts down all the way you can make your UIViewController subclass respond to the `CountDownClockDelegate` protocol, set the `CountDownClock` instances delegate property to your UIViewController subclass and implement the `countDownClockDidFinish:` method. This will be called and passed to it the instance of the `CountDownClock` that has finished;

    - (void)countDownClockDidFinish:(CountDownClock *)sender {
        NSLog(@"Countdown complete!");
        // Do something interesting
    }
    
See the example code in this project for more information about usage.

License
====

MIT License - Copyright (C) 2013 Michael Kennedy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.