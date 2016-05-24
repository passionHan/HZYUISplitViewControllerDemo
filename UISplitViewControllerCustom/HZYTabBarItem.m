//
//  HZYTabBarItem.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/20.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYTabBarItem.h"

@interface HZYTabBarItem ()

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;

@end

@implementation HZYTabBarItem

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        self.itemView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_itemView];
        
        self.itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height , self.frame.size.width, 15)];
        self.itemTitle.font = [UIFont systemFontOfSize:14];
        self.itemTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.itemTitle];
    }
    
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesEnded:touches withEvent:event];
    
    if ([_target respondsToSelector:_action]) {
        
        IMP imp = [_target methodForSelector:_action];
        
        void(*func)(id, SEL, id) = (void *)imp;
        
        func(_target, _action, self);
    }
}

- (void)addTarget:(id)target action:(SEL)action{
    
    _target = target;
    _action = action;
}

@end
