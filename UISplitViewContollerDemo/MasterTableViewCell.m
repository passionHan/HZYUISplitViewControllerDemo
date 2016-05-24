//
//  MasterTableViewCell.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "MasterTableViewCell.h"
#import "SingleModel.h"
@interface MasterTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@end

@implementation MasterTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"masterCell";
    
    MasterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MasterTableViewCell" owner:self options:nil] lastObject];
    }
    
    return cell;
}

- (void)setSingleModel:(SingleModel *)singleModel{
    
    self.iconView.image = [UIImage imageNamed:@"imic2(1)"];
    
    self.nameView.text = singleModel.subjectName;
}



@end
