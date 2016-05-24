//
//  HZYBaseViewController.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZYBaseViewController : UIViewController

/**
 *  获得当前控制器的下标,根据不同的下标获得相应的模型和Cell样式
 */
- (void)getVcIndex:(NSInteger)index;

@end
