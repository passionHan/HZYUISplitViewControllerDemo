//
//  MasterHeaderView.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterHeaderView, GroupModel;
@protocol masterHeaderViewDelegate <NSObject>

- (void)masterHeaderViewNameViewDidClicked:(MasterHeaderView *)headerView;

@end

@interface MasterHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) GroupModel *groupModel;

@property (nonatomic, weak) id <masterHeaderViewDelegate> delegate;


+ (instancetype)headerWithTableView:(UITableView *)tableView;

@end
