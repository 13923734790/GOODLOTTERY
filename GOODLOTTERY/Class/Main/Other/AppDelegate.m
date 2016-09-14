//
//  AppDelegate.m
//  YCWKeeper
//
//  Created by apple on 15/12/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//
//#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#import "AppDelegate.h"
#import "AdaptiveManger.h"
#import "LoginCtrl.h"
#import  "AFNetworking.h"

@interface AppDelegate ()

@end
@implementation AppDelegate
{
    AdaptiveManger *appmanger;
}
- (void)GetScale
{
    if (!appmanger)appmanger = [AdaptiveManger ShareManger];
        appmanger.autoSizeScaleX =UIScreenWIDTH/375;
        appmanger.autoSizeScaleY =UIScreenHEIGHT/667;

}
- (void)returnDevice
{
    if (!appmanger)appmanger = [AdaptiveManger ShareManger];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480.f)
        {
        }
        else
        {
            appmanger.IphoneName =@"iPhone5_6";
            return;
        }
    }
    appmanger.IphoneName =@"iPad";
}

-(void)AFNet
{
    
    AFNetworkReachabilityManager *reachmanager = [AFNetworkReachabilityManager sharedManager];
    //开始监听
    [reachmanager startMonitoring];
    //设置监听代码块
    [reachmanager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"当前使用wifi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前使用流量");
                break;
            default:
                break;
        }
    }];

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self returnDevice];
    [self GetScale];
    [self AFNet];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    LoginCtrl *ctrl = [[LoginCtrl alloc]init];
    self.window.rootViewController = ctrl;
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
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
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com