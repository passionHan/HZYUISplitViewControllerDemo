//
//  MasterHeaderView.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "MasterHeaderView.h"
#import "GroupModel.h"
@interface MasterHeaderView()

@property (nonatomic, strong) UIButton *nameView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation MasterHeaderView

+ (instancetype)headerWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"header";

    MasterHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (!headerView) {
        
        headerView = [[MasterHeaderView alloc] initWithReuseIdentifier:ID];
    }

    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.nameView = [UIButton buttonWithType:UIButtonTypeSystem];
        self.nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        self.nameView.titleLabel.font = [UIFont systemFontOfSize:18];
        
        [self.nameView addTarget:self action:@selector(nameViewDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.nameView];
    }
    
    return self;
}

- (void)nameViewDidClick{
    
    self.groupModel.opened = !self.groupModel.isOpened;
    
    if ([self.delegate respondsToSelector:@selector(masterHeaderViewNameViewDidClicked:)]) {
        
        [self.delegate masterHeaderViewNameViewDidClicked:self];
    }
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.nameView.frame = self.bounds;
    self.lineView.frame = CGRectMake(0, self.bounds.size.height - 2, self.bounds.size.width, 2);
}

- (void)setGroupModel:(GroupModel *)groupModel{
    
    _groupModel = groupModel;
    
    [self.nameView setTitle:groupModel.name forState:UIControlStateNormal];
}

@end
