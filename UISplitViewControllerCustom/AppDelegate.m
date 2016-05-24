//
//  AppDelegate.m
//  UISplitViewControllerCustom
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "AppDelegate.h"
#import "HZYTabBarController.h"
#import "HZYCustomTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//ByCustom目录下
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    /**
     
     1.该target下分为五个模块,Main目录下存放着自定义的TabBar
     2.Discover下显示的MasterTableViewController是分组显示的tableView,根据行所在的Section获得不同的模型和Cell样式
     3.Teacher、Student和Activity是三个控制器,都继承自UIBaseViewController,在这三个控制器中只需要传入控制器的index就能创建好界面,简化了代码。
     4.Teacher、Student和Activity用到同一个HZYBaseMasterController和HZYBaseDetailController,根据传入的控制器的index获取相应模型和Cell样式。
     5.项目用到Masnory和MJExtension两个三方库,强烈推荐,没用到过的朋友可以自己与研究一下。
     6.项目用到的数据都在Supporting Files目录下的plist文件中。
     */
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //如果想要tabBar显示在下面的话 设置windows的跟控制器为HZYTabBarController
    //self.window.rootViewController = [HZYTabBarController new];
    
    self.window.rootViewController = [HZYCustomTabBarController new];
    
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
