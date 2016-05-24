//
//  GroupModel.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "GroupModel.h"
#import "SingleModel.h"
#import "MJExtension.h"
@implementation GroupModel

+ (void)groupModelGetDataFromPlistFileName:(NSString *)name successBlock:(successBlock)successBlock{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
    
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        
        return @{@"typeList" : [SingleModel class]};
    }];
    
    NSArray *groupModelArray = [GroupModel mj_objectArrayWithKeyValuesArray:array];
    
    successBlock(groupModelArray.copy);
}

@end
