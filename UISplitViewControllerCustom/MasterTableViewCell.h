//
//  MasterTableViewCell.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SingleModel;
@interface MasterTableViewCell : UITableViewCell

@property (nonatomic, strong) SingleModel *singleModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  次方法是分三个控制器显示导师、学友和活动用到的方法
 *
 *  @param model 导师、学友和活动Cell用到的Model
 *  @param index 代表导师、学友和活动控制器的index
 */
- (void)configCellWithModel:(Class)model index:(NSInteger)index;

@end
