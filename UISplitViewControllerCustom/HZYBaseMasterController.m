//
//  HZYBaseMasterController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYBaseMasterController.h"
#import "Tool.h"
#import "MasterTableViewCell.h"
#import "HZYDetailViewController.h"

@interface HZYBaseMasterController ()

@property (nonatomic, strong) NSArray *modelArray;


@end

@implementation HZYBaseMasterController

/**
 *  模型数据懒加载
 */
- (NSArray *)modelArray{
    
    if (_modelArray == nil) {
        
        _modelArray = [NSArray array];
    }
    
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    self.tableView.sectionHeaderHeight = 80;
}

- (void)setVcIndex:(NSInteger)vcIndex{
    
    _vcIndex = vcIndex;
    //避免循环引用
    __weak typeof(self) weakSelf = self;
    
    [Tool getDataWithControllerIndex:_vcIndex successBlock:^(NSMutableArray *modelArray) {
        
        weakSelf.modelArray = modelArray;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //创建cell
    MasterTableViewCell *cell = [MasterTableViewCell cellWithTableView:tableView];
    
    [cell configCellWithModel:self.modelArray[indexPath.row] index:_vcIndex];

    return cell;
}

#pragma mark --tableView行点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(baseMasterViewController:didSelectedRowModelArray:withVcIndex:)]) {
        
        //判断当前ModelArray中装的是哪一个类的模型数据
        NSArray *array = [Tool judgementTheModel:self.modelArray[indexPath.row] WithControllerIndex:self.vcIndex];
        [self.delegate baseMasterViewController:self didSelectedRowModelArray:array withVcIndex:_vcIndex];
    }
}

@end
