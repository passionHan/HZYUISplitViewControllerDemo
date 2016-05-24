//
//  MainViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "MainViewController.h"
#import "MasterTableViewController.h"
#import "DetatilViewController.h"
#import "SingleModel.h"
@interface MainViewController ()<masterTableViewControllerDelegate>


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //获取到导航控制器对象
    UINavigationController *masterNav = [self.childViewControllers firstObject];
    
    //获取到MasterTableViewController的对象
    MasterTableViewController *master = [masterNav.childViewControllers firstObject];
    
    master.delegate = self;
}
/**
 *  masterTableViewController的代理方法
 */
- (void)masterTableViewController:(MasterTableViewController *)masterVC didSelectedRow:(SingleModel *)singleModel{
    
    UINavigationController *detailNav = [self.childViewControllers lastObject];
    DetatilViewController *detail = [detailNav.childViewControllers firstObject];
    
    detail.singleModel = singleModel;
    
    [detailNav popToRootViewControllerAnimated:YES];
}

@end
