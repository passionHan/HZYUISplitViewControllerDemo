//
//  Tool.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/19.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "Tool.h"
#import "MJExtension.h"
#import "HZYTeacherTypeModel.h"
#import "HZYTeacherModel.h"
#import "HZYStudentTypeModel.h"
#import "HZYStudentModel.h"
#import "HZYActivityModel.h"
#import "HZYActivityTypeModel.h"
@implementation Tool

+ (void)getDataWithControllerIndex:(NSInteger)vcIndex successBlock:(successBlock)successBlock{
    
    NSArray *modelArray;
    NSArray *array;
    if (vcIndex == 0) {
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GroupTeacher.plist" ofType:nil]];
        
        [HZYTeacherTypeModel mj_setupObjectClassInArray:^NSDictionary *{
            
            return @{@"teacherList":[HZYTeacherModel class]};
        }];
        
        modelArray = [HZYTeacherTypeModel mj_objectArrayWithKeyValuesArray:array];
        
    } else if (vcIndex == 1){
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GroupStudent.plist" ofType:nil]];
        
        [HZYStudentTypeModel mj_setupObjectClassInArray:^NSDictionary *{
            
            return @{@"studentList":[HZYStudentModel class]};
        }];
        
        modelArray = [HZYStudentTypeModel mj_objectArrayWithKeyValuesArray:array];
        
    }else if (vcIndex == 2) {
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GroupActivity.plist" ofType:nil]];
        [HZYActivityTypeModel mj_setupObjectClassInArray:^NSDictionary *{
            
            return @{@"activityList" : [HZYActivityModel class]};
        }];
        modelArray = [HZYActivityTypeModel mj_objectArrayWithKeyValuesArray:array];
    }
    
    successBlock(modelArray.copy);
}


+ (void)getDataWithSection:(NSInteger)section successBlock:(successBlock)successBlock{
    
    NSArray *modelArray;
    NSArray *array;
    if (section == 0) {
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Teacher.plist" ofType:nil]];
        modelArray = [NSClassFromString(@"TeacherModel") mj_objectArrayWithKeyValuesArray:array];
        
    } else if (section == 1){
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Student.plist" ofType:nil]];
        modelArray = [NSClassFromString(@"StudentModel") mj_objectArrayWithKeyValuesArray:array];
        
    }else {
        
        array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Activity.plist" ofType:nil]];
        modelArray = [NSClassFromString(@"ActivityModel") mj_objectArrayWithKeyValuesArray:array];
    }
    
    successBlock(modelArray.copy);
}

+ (NSArray *)judgementTheModel:(Class)model WithControllerIndex:(NSInteger)vcIndex{
    
    if (vcIndex == 0) {
        
        HZYTeacherTypeModel *typeModel = (HZYTeacherTypeModel *)model;
        return typeModel.teacherList;
        
    }else if (vcIndex == 1){
        
        HZYStudentTypeModel *typeModel = (HZYStudentTypeModel *)model;
        return typeModel.studentList;
        
    }else {
        
        HZYActivityTypeModel *typeModel = (HZYActivityTypeModel *)model;
        return typeModel.activityList;
    }
}

@end
