//
//  HZYDetailCell.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "HZYDetailCell.h"
#import "HZYTeacherModel.h"
#import "HZYStudentModel.h"
#import "HZYActivityModel.h"

@interface HZYDetailCell()

@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *teacherIntro;
@property (weak, nonatomic) IBOutlet UILabel *studentName;
@property (weak, nonatomic) IBOutlet UILabel *activityName;

@end

@implementation HZYDetailCell


+ (instancetype)cellWithTableView:(UITableView *)tableView vcIndex:(NSInteger)index{
    
    NSString *ID = @"";
    if (index == 0) {
        ID = @"HZYTeacherCell";
    }else if(index == 1){
        ID = @"HZYStudentCell";
    }else{
        ID = @"HZYActivityCell";
    }
    
    HZYDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        if ([ID isEqualToString:@"HZYTeacherCell"]) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYDetailCell" owner:nil options:nil] firstObject];
        }else if([ID isEqualToString:@"HZYStudentCell"]){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYDetailCell" owner:nil options:nil] objectAtIndex:1];
        }else{
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HZYDetailCell" owner:nil options:nil] lastObject];
        }
    }
    
    return cell;
}

- (void)configCellWithModel:(Class)model vcIndex:(NSInteger)vcIndex{
    
    if (vcIndex == 0) {
        
        HZYTeacherModel *teacher = (HZYTeacherModel *)model;
        self.teacherName.text = teacher.name;
        self.teacherIntro.text = teacher.intro;
        
    }else if (vcIndex == 1){
        
        HZYStudentModel *student = (HZYStudentModel *)model;
        self.studentName.text = student.name;
    
    }else{

        HZYActivityModel *activity = (HZYActivityModel *)model;
        self.activityName.text = activity.name;
    }
    
    
}


@end
