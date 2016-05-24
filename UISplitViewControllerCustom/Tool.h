//
//  Tool.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/19.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock) (NSMutableArray *modelArray);
@interface Tool : NSObject


+ (void)getDataWithControllerIndex:(NSInteger)vcIndex successBlock:(successBlock)successBlock;

/**
 *  工具类，获取点击的某个section中的行的模型数据
 */
+ (void)getDataWithSection:(NSInteger)section successBlock:(successBlock)successBlock;

+ (NSArray *)judgementTheModel:(Class)model WithControllerIndex:(NSInteger)vcIndex;

@end
