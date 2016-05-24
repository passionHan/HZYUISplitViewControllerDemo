//
//  HZYDetailViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYDetailViewController.h"
#import "HZYSubDetailViewController.h"
#import "DetailTableViewCell.h"
#import "Tool.h"
@interface HZYDetailViewController ()

/**
 *  接受master界面点击的Section
 */
@property (nonatomic, assign) NSInteger section;
/**
 *  存放解析出来的model
 */
@property (nonatomic, strong) NSMutableArray *modelArray;


@end

@implementation HZYDetailViewController

/**
 *  modelArray 懒加载
 */
- (NSMutableArray *)modelArray{
    
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

- (void)putSection:(NSInteger)section{
    
    _section = section;
    
    __weak typeof (self) weakSelf = self;
    
    //获取点击Section的模型数据，为了方便这里每个Section中的行都是一个模型数据，如果获取网络数据的话要更改工具类中的方法，视情况而定！
    [Tool getDataWithSection:section successBlock:^(NSMutableArray *modelArray) {
        
        weakSelf.modelArray = modelArray;
        
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //创建cell,传入masterViewController中点击的哪一个Section
    DetailTableViewCell *cell = [DetailTableViewCell cellWithTableView:tableView andSection:_section];

    //传递所在Section的模型数据
    [cell configCellWithModel:self.modelArray[indexPath.row] section:_section];
    
    return cell;
}

/**
 *  点击详情页tableViewCell跳到测试控制器
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZYSubDetailViewController *subDetail = [[HZYSubDetailViewController alloc] init];
    
    [self.navigationController pushViewController:subDetail animated:YES];
}


@end
