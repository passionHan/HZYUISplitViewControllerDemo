//
//  HZYBaseViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYBaseViewController.h"
#import "HZYBaseMasterController.h"
#import "HZYBaseDetailController.h"
#import "Masonry.h"
#define kBaseMasterWidth @(480)
@interface HZYBaseViewController () <baseMasterViewControllerDelegate>

@property (nonatomic, strong) UINavigationController *masterNav;
@property (nonatomic, strong) UINavigationController *detailNav;

@end

@implementation HZYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)getVcIndex:(NSInteger)index{
    
    HZYBaseMasterController *masterVC = [HZYBaseMasterController new];
    self.masterNav = [[UINavigationController alloc] initWithRootViewController:masterVC];
    [self addChildViewController:self.masterNav];
    [self.view addSubview:self.masterNav.view];
    
    HZYBaseDetailController *detailVC = [HZYBaseDetailController new];
    self.detailNav = [[UINavigationController alloc] initWithRootViewController:detailVC];
    [self addChildViewController:self.detailNav];
    [self.view addSubview:self.detailNav.view];
    
    masterVC.delegate = self;
    
    masterVC.vcIndex = index;
}

/**
 *  实现masterViewController的代理方法，实现masterViewController和DetailViewController的交互
 */

- (void)baseMasterViewController:(HZYBaseMasterController *)masterVC didSelectedRowModelArray:(NSArray *)modelArray withVcIndex:(NSInteger)index{
    
    HZYBaseDetailController *detailVC = [self.detailNav.childViewControllers firstObject];
    
    [self.detailNav popToRootViewControllerAnimated:YES];
    
    [detailVC getModelArray:modelArray withVcIndex:index];
    
    
}

- (void)viewWillLayoutSubviews{
    
        [_masterNav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@64);
            make.left.equalTo(@70);
            make.width.equalTo(kBaseMasterWidth);
            make.bottom.equalTo(@0);
        }];
        
        [_detailNav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_masterNav.view);
            make.right.equalTo(self.view.mas_right);
            make.left.equalTo(_masterNav.view.mas_right);
        }];
}


@end
