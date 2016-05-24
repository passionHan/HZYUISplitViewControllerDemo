//
//  HZYTabBarItem.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/20.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZYTabBarItem : UIView

/**
 *  tabBatItem 的标题
 */
@property (nonatomic, strong, nonnull) UILabel *itemTitle;
/**
 *  tabBarItem 的图标
 */
@property (nonatomic, strong, nonnull) UIImageView *itemView;
/**
 *  是否为选中状态
 */
@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (void)addTarget:(id)target action:(nonnull SEL)action;

@end
