//
//  iTravelAppDelegate.m
//  iTravel
//
//  Created by Thainq on 11/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "iTravelAppDelegate.h"




@implementation iTravelAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
  
     UIImage *navBackgroundImage = [UIImage imageNamed:@"c-2-1-1.png"];
      [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
  
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"001.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"001_1.png"]];
    
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"002.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"002_2.png"]];
    
     [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"003.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"003_3.png"]];
    
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"tv.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tv.png"]];
    
    [tabBarItem5 setFinishedSelectedImage:[UIImage imageNamed:@"clock.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"clock.png"]];
    
    [tabBar setSelectionIndicatorImage:[[UIImage alloc] init]];

    [[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
    UIImage* tabBarBackground = [UIImage imageNamed:@"c-2-1-1.png"];

    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

      //  [NSThread sleepForTimeInterval:10.0];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
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
