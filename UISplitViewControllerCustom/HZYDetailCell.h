//
//  HZYDetailCell.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZYDetailCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView vcIndex:(NSInteger)index;

- (void)configCellWithModel:(Class)model vcIndex:(NSInteger)vcIndex;


@end
