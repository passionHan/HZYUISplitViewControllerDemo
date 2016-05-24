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


@end
