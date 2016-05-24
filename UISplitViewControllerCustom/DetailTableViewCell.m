//
//  DetailTableViewCell.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/19.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "TeacherModel.h"
#import "StudentModel.h"
#import "ActivityModel.h"
@interface DetailTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *teacherName;

@property (weak, nonatomic) IBOutlet UILabel *studentName;

@property (weak, nonatomic) IBOutlet UILabel *activityName;

@end

@implementation DetailTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView andSection:(NSInteger)section{
    
    NSString *ID = @"";
    if (section == 0) {
        ID = @"teacherCell";
    }else if(section == 1){
        ID = @"studentCell";
    }else{
        ID = @"activityCell";
    }
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        if ([ID isEqualToString:@"teacherCell"]) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:nil options:nil] firstObject];
        }else if([ID isEqualToString:@"studentCell"]){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:nil options:nil] objectAtIndex:1];
        }else{
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:nil options:nil] lastObject];
        }
    }
    
    return cell;
}

- (void)configCellWithModel:(Class)model section:(NSInteger)section{
    
    if (section == 0) {
        
        TeacherModel *teacher = (TeacherModel *)model;
        self.teacherName.text = teacher.name;
        
    }else if (section == 1){
        
        StudentModel *student = (StudentModel *)model;
        self.studentName.text = student.name;
        
    }else{
        
        ActivityModel *activity = (ActivityModel *)model;
        self.activityName.text = activity.name;
    }
    
    
}






@end
