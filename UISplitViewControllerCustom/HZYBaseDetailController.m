//
//  HZYBaseDetailController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYBaseDetailController.h"
#import "HZYSubDetailViewController.h"
#import "HZYDetailCell.h"
#import "Tool.h"
@interface HZYBaseDetailController ()

/**
 *  接受master界面点击的Section
 */
@property (nonatomic, assign) NSInteger vcIndex;;
/**
 *  存放解析出来的model
 */
@property (nonatomic, strong) NSArray *modelArray;


@end

@implementation HZYBaseDetailController

/**
 *  modelArray 懒加载
 */
- (NSArray *)modelArray{
    
    if (_modelArray == nil) {
        
        _modelArray = [NSMutableArray array];
    }
    
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设定固定行高，避免使用代理设置
    self.tableView.rowHeight = 100;
}

- (void)getModelArray:(NSArray *)array withVcIndex:(NSInteger)index{
    
    self.vcIndex = index;
    self.modelArray = array;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYDetailCell *cell = [HZYDetailCell cellWithTableView:tableView vcIndex:_vcIndex];
    
    //传递当前控制器选中行的模型数据
    [cell configCellWithModel:self.modelArray[indexPath.row] vcIndex:_vcIndex];
    
    return cell;
}

/**
 *  点击详情页tableViewCell跳到测试控制器
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYSubDetailViewController *subDetail = [[HZYSubDetailViewController alloc] init];
    
    //这里就这样简单验证一下
    if (_vcIndex == 0) {
        
        NSLog(@"这是导师控制器界面的--->%ld行",indexPath.row);
        
    }else if (_vcIndex == 1) {
        
        NSLog(@"这是学友控制器界面的--->%ld行",indexPath.row);

    }else {
        
        NSLog(@"这是活动控制器界面的--->%ld行",indexPath.row);
    }
    
    [self.navigationController pushViewController:subDetail animated:YES];
}


@end
