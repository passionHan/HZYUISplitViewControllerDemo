//
//  HZYSubDetailViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYSubDetailViewController.h"
#import "HZYTextViewController.h"
@interface HZYSubDetailViewController ()

@end

@implementation HZYSubDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController pushViewController:[HZYTextViewController new] animated:YES];
}


@end
