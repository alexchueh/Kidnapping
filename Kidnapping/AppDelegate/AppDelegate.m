//
//  AppDelegate.m
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    //建立NavigationController及首頁
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController *mainViewController = [[MainViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:mainViewController];
    self.window = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
    [self.window setRootViewController:navigation];
    [self.window makeKeyAndVisible];
    
    //設定Parse的Key
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"pKmHRiilZsTYFVSSA02rtNfbNmM3gfGTVDGoW6j7"
                  clientKey:@"n3uLicHfHQvnzmTBokT7npIQSWuHOoqE8PaQY3aN"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
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
