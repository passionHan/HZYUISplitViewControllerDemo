//
//  HZYTabBarController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYTabBarController.h"
#import "HZYNavigationController.h"
#import "HZYDiscoverViewController.h"
#import "HZYCourseViewController.h"

#define InitChildVc(VcName,NormalImage,Title) \
[self addChildVc:[[VcName alloc] init] normalImage:NormalImage title:Title]

@interface HZYTabBarController ()

@end

@implementation HZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    InitChildVc(HZYCourseViewController, @"", @"课程");
    InitChildVc(HZYDiscoverViewController, @"", @"发现");
    
}

- (void)addChildVc:(UIViewController *)childVc normalImage:(NSString *)normalImage title:(NSString *)title{
    
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:@"imic2(1)"];
    
    HZYNavigationController *nav = [[HZYNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
}



@end
