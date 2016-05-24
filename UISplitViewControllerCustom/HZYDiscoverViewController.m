//
//  HZYDiscoverViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYDiscoverViewController.h"
#import "HZYMasterViewController.h"
#import "HZYDetailViewController.h"
#import "Masonry.h"

#define kMasterWidth @(480)

@interface HZYDiscoverViewController ()<masterViewControllerDelegate>

@property (nonatomic, strong) UINavigationController *masterNav;
@property (nonatomic, strong) UINavigationController *detailNav;

@end

@implementation HZYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // self.navigationController.navigationBarHidden = YES;
    
    HZYMasterViewController *masterVC = [HZYMasterViewController new];
    self.masterNav = [[UINavigationController alloc] initWithRootViewController:masterVC];
    [self addChildViewController:self.masterNav];
    [self.view addSubview:self.masterNav.view];
    
    HZYDetailViewController *detailVC = [HZYDetailViewController new];
    self.detailNav = [[UINavigationController alloc] initWithRootViewController:detailVC];
    [self addChildViewController:self.detailNav];
    [self.view addSubview:self.detailNav.view];
    
    masterVC.delegate = self;
}

/**
 *  实现masterViewController的代理方法，实现masterViewController和DetailViewController的交互
 */
- (void)masterViewController:(HZYMasterViewController *)masterVC didSelectedRowInSection:(NSInteger)section{
    
    HZYDetailViewController *detailVC = [self.detailNav.childViewControllers firstObject];
    
    [self.detailNav popToRootViewControllerAnimated:YES];
    
    //向detailVC传递点击的Section用来区分detailVC中tableViewCell的显示样式
    [detailVC putSection:section];
}

- (void)viewWillLayoutSubviews{
    
        [_masterNav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@64);
            make.left.equalTo(@70);
            make.width.equalTo(kMasterWidth);
            make.bottom.equalTo(@0);
        }];
        
        [_detailNav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_masterNav.view);
            make.right.equalTo(self.view.mas_right);
            make.left.equalTo(_masterNav.view.mas_right);
        }];
}

@end
