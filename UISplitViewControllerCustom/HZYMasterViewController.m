//
//  HZYMasterViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYMasterViewController.h"
#import "MasterTableViewCell.h"
#import "MasterHeaderView.h"
#import "GroupModel.h"
#import "HZYDetailViewController.h"
@interface HZYMasterViewController () <masterHeaderViewDelegate>

@property (nonatomic, strong) NSArray *groupModelArray;

@end

@implementation HZYMasterViewController

/**
 *  组模型懒加载
 */
- (NSArray *)groupModelArray{
    
    if (_groupModelArray == nil) {
        
        _groupModelArray = [NSArray array];
    }
    
    return _groupModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    self.tableView.sectionHeaderHeight = 80;
    
    [self getData];
}


/**
 *  block回调获取模型数组
 */
- (void)getData{
    
    //避免循环引用
    __weak typeof(self) weakSelf = self;
    
    [GroupModel groupModelGetDataFromPlistFileName:@"DiscoverMasterGroup.plist" successBlock:^(NSArray *modelArray) {
        
        weakSelf.groupModelArray = modelArray;
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groupModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    GroupModel *groupModle = self.groupModelArray[section];
    
    return (groupModle.isOpened ? groupModle.typeList.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //创建cell
    MasterTableViewCell *cell = [MasterTableViewCell cellWithTableView:tableView];
    
    GroupModel *groupModel = self.groupModelArray[indexPath.section];
    
    //传递模型数据，cell中重写了模型的setter方法
    cell.singleModel = groupModel.typeList[indexPath.row];
    
    return cell;

}

#pragma mark --返回tableViewSection视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    MasterHeaderView *headerView = [MasterHeaderView headerWithTableView:tableView];
    
    headerView.delegate = self;
    
    headerView.groupModel = self.groupModelArray[section];
    
    return headerView;
}

#pragma mark --masterHeaderView代理方法
- (void)masterHeaderViewNameViewDidClicked:(MasterHeaderView *)headerView{
    
    [self.tableView reloadData];
}

#pragma mark --tableView行点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(masterViewController:didSelectedRowInSection:)]) {
        
        [self.delegate masterViewController:self didSelectedRowInSection:indexPath.section];
    }
}




@end
