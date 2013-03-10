//
//  StartCountDownViewController.m
//  CountDownClockDemo
//
//  Created by Mike Kennedy on 3/9/13.
//  Copyright (c) 2013 Mike Kennedy. All rights reserved.
//

#import "StartCountDownViewController.h"
#import "ShowCountDownViewController.h"

@interface StartCountDownViewController ()

@end

@implementation StartCountDownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCountDown"]) {
        ShowCountDownViewController *scdvc = (ShowCountDownViewController *)[segue destinationViewController];
        scdvc.countDownSeconds = self.datePicker.countDownDuration;
    }
}

@end
