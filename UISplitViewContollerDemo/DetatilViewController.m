//
//  DetatilViewController.m
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import "DetatilViewController.h"
#import "SingleModel.h"
@interface DetatilViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation DetatilViewController

- (instancetype)init{
    
    if (self = [super init]) {
        
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSingleModel:(SingleModel *)singleModel{
    
    _singleModel = singleModel;
    
    self.nameView.text = singleModel.subjectName;
}



@end
