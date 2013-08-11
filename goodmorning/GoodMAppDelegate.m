//
//  GoodMAppDelegate.m
//  goodmorning
//
//  Created by otiai10 on 2013/08/11.
//  Copyright (c) 2013年 oti10. All rights reserved.
//

#import "GoodMAppDelegate.h"

@implementation GoodMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSDate *date = [NSDate date];
    NSTimeInterval t = 3;
    self.period = [date dateByAddingTimeInterval:t];

    UIApplication *app = [UIApplication sharedApplication];
    self.bgtask = [app beginBackgroundTaskWithExpirationHandler:^{
        [NSTimer scheduledTimerWithTimeInterval: 0.5 target: self selector: @selector(checkTimer) userInfo: nil repeats: YES];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{   
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    UIApplication *app = [UIApplication sharedApplication];
    [app endBackgroundTask: self.bgtask];
}
- (void)checkTimer
{
    
    NSDate *date = [NSDate date];
    if (date == self.period) {
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"( ﾟдﾟ )ｸﾜｯ!!" message:@"時間です" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
        [alert show];
    }
    NSLog(@"checkTimer");
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    NSLog(@"%@", dateStr);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
