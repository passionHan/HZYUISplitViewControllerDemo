//
//  MasterTableViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "MasterTableViewController.h"
#import "MasterTableViewCell.h"
#import "MasterHeaderView.h"
#import "GroupModel.h"
#import "DetatilViewController.h"
@interface MasterTableViewController ()<masterHeaderViewDelegate>

@property (nonatomic, strong) NSArray *groupModel;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.frame = self.view.frame;
    self.tableView.rowHeight = 80;
    self.tableView.sectionHeaderHeight = 80;
    
    [self getData];
}

- (NSArray *)groupModel{
    
    if (_groupModel == nil) {
        
        _groupModel = [NSArray array];
    }
    
    return _groupModel;
}

- (void)getData{
    
    __weak typeof(self) weakSelf = self;
    
    [GroupModel groupModelGetDataFromPlistFileName:@"discoverMasterGroup.plist" successBlock:^(NSArray *modelArray) {
        
        weakSelf.groupModel = modelArray;
        
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return self.groupModel.count;
}

/**
 *  返回tableView每个section的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    GroupModel *model = self.groupModel[section];
    
    return (model.isOpened ? model.typeList.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MasterTableViewCell *cell = [MasterTableViewCell cellWithTableView:tableView];
    
    GroupModel *groupModel = self.groupModel[indexPath.section];
    
    //传递模型数据
    cell.singleModel = groupModel.typeList[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    MasterHeaderView *headerView = [MasterHeaderView headerWithTableView:tableView];
    
    headerView.delegate = self;
    
    headerView.groupModel = self.groupModel[section];
    
    return headerView;
}

#pragma mark --masterHeaderView代理方法
- (void)masterHeaderViewNameViewDidClicked:(MasterHeaderView *)headerView{
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(masterTableViewController:didSelectedRow:)]) {
        
        GroupModel *groupModel = self.groupModel[indexPath.section];
        [self.delegate masterTableViewController:self didSelectedRow:groupModel.typeList[indexPath.row]];
    }
}




@end
