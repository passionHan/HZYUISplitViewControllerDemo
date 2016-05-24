//
//  HZYTeacherViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYTeacherViewController.h"

@interface HZYTeacherViewController ()

@end

@implementation HZYTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //默认导师控制器的index为0，学友控制器的index为1，活动控制器的index为2
    [self getVcIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
