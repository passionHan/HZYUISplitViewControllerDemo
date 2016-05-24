//
//  HZYCustomTabBarController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/20.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYCustomTabBarController.h"
#import "Masonry.h"
#import "HZYDiscoverViewController.h"
#import "HZYCourseViewController.h"
#import "HZYTextOneViewController.h"
#import "HZYTextTwoViewController.h"
#import "HZYTeacherViewController.h"
#import "HZYStudentViewController.h"
#import "HZYActivityViewController.h"
#import "HZYTabBarItem.h"

#define InitChildVc(VcName,NormalImage,Title) \
[self addChildVc:[[VcName alloc] init] normalImage:NormalImage title:Title]

@interface HZYCustomTabBarController ()

@end

@implementation HZYCustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tabBar removeFromSuperview];
    
    self.customTabBar = [UIImageView new];
    self.customTabBar.userInteractionEnabled = YES;
    self.customTabBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customTabBar];
    
    [self.customTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.left.equalTo(self.view);
        make.width.mas_equalTo(@70);
    }];
    
    InitChildVc(HZYDiscoverViewController, @"", @"发现");
    InitChildVc(HZYTeacherViewController, @"", @"导师");
    InitChildVc(HZYStudentViewController, @"", @"学友");
    InitChildVc(HZYActivityViewController, @"", @"活动");
    InitChildVc(HZYTextOneViewController, @"", @"呵呵");
    InitChildVc(HZYDiscoverViewController, @"", @"发现");
    
}

- (void)addChildVc:(UIViewController *)childVc normalImage:(NSString *)normalImage title:(NSString *)title{
    
    childVc.title = title;
    
    childVc.tabBarItem.image = [[UIImage imageNamed:@"tabbar_set_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_set_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
    
    HZYTabBarItem *item = [[HZYTabBarItem alloc] initWithFrame:CGRectMake(0, 0, 40, 75)];
    [self.customTabBar addSubview:item];
    
    item.tag = self.childViewControllers.count - 1;
    
    [item mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_customTabBar).offset(80 + (item.tag) * (75 + 30));
        make.centerX.equalTo(_customTabBar);
        make.width.equalTo(@40);
        make.height.equalTo(@75);
    }];

    if (item.tag == 0) {
        
        item.itemView.image = childVc.tabBarItem.selectedImage;
        item.itemTitle.textColor = [UIColor colorWithRed:243/255.0 green:174/255.0 blue:40/255.0 alpha:1];
        
    }else{
        
        item.itemView.image = childVc.tabBarItem.image;
    }
    
    item.itemTitle.text = title;
    
    [item addTarget:self action:@selector(tabBarItemDidClick:)];
}

- (void)tabBarItemDidClick:(HZYTabBarItem *)item{
    
    self.selectedIndex = item.tag;
    for (int i = 0; i < _customTabBar.subviews.count; i++){
        HZYTabBarItem * subItem = _customTabBar.subviews[i];
        if ([subItem isKindOfClass:[HZYTabBarItem class]]) {
            subItem.itemView.image = self.viewControllers[i].tabBarItem.image;
            subItem.itemTitle.textColor = [UIColor whiteColor];
        }
    }
    item.itemView.image = self.childViewControllers[item.tag].tabBarItem.selectedImage;
    item.itemTitle.textColor = [UIColor colorWithRed:243/255.0 green:174/255.0 blue:40/255.0 alpha:1];
}

@end
