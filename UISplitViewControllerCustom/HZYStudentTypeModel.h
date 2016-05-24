//
//  HZYStudentTypeModel.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYStudentTypeModel : NSObject

/**
 *  学友的名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  装有HZYStudentModel的数组
 */
@property (nonatomic, strong) NSArray *studentList;


@end
