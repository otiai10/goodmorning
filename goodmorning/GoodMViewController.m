//
//  GoodMViewController.m
//  goodmorning
//
//  Created by otiai10 on 2013/08/11.
//  Copyright (c) 2013年 oti10. All rights reserved.
//

#import "GoodMViewController.h"

@interface GoodMViewController ()
-(void)updateNowDisplay;
-(void)runTheClock;
@end

@implementation GoodMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.now.text = @"FUGA";
    [self runTheClock];
}

-(void)updateNowDisplay
{
    /* 日付を取得する */
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:date];
    
    self.now.text = dateStr;
}
-(void)runTheClock
{
    [NSTimer scheduledTimerWithTimeInterval: 0.5
											 target: self
										   selector:@selector(updateNowDisplay)
										   userInfo: nil
											repeats: YES];  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
