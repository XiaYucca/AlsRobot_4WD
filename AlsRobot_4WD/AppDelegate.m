//
//  AppDelegate.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

#define URL_bj [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"bj" ofType:@"mp3"]]
#define URL_ok [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"an_old" ofType:@"mp3"]]
#define URL_ok1 [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"ok1" ofType:@"mp3"]]
#define URL_an [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"an" ofType:@"mp3"]]

#define URL_open [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"打开大型机械铁" ofType:@"wav"]]

#define URL_close [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"打开有链子的铁门" ofType:@"wav"]]



@implementation AppDelegate

-(void)setup
{
    XYAudio* audio = [XYAudio shareXYAudion];
    [audio addMusicFileURL:URL_bj];
    [audio addMusicFileURL:URL_an];
    [audio addMusicFileURL:URL_ok];
    [audio addMusicFileURL:URL_ok1];
    [audio addMusicFileURL:URL_open];
    [audio addMusicFileURL:URL_close];
   // [audio playMusicAtIndex:0];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setup];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
