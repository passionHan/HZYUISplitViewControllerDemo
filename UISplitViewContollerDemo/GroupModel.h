//
//  GroupModel.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock) (NSArray *modelArray);

@interface GroupModel : NSObject

/**
 *  组名
 */
@property (nonatomic, copy) NSString *name;
/**
 *  装有SingleModel的数组
 */
@property (nonatomic, strong) NSArray *typeList;
/**
 *  判断组是否展开
 */
@property (nonatomic, assign, getter = isOpened) BOOL opened;


+ (void)groupModelGetDataFromPlistFileName:(NSString *)name successBlock:(successBlock)successBlock;

@end
