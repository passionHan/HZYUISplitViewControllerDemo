//
//  DetailTableViewCell.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/19.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andSection:(NSInteger)section;

- (void)configCellWithModel:(Class)model section:(NSInteger)section;

@end
