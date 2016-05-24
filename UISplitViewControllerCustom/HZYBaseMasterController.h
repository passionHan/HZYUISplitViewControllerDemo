//
//  HZYBaseMasterController.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/23.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYBaseMasterController;
@protocol baseMasterViewControllerDelegate <NSObject>

- (void)baseMasterViewController:(HZYBaseMasterController *)masterVC didSelectedRowModelArray:(NSArray *)modelArray withVcIndex:(NSInteger)index;

@end

@interface HZYBaseMasterController : UITableViewController

@property (nonatomic, weak) id <baseMasterViewControllerDelegate>delegate;

@property (nonatomic, assign) NSInteger vcIndex;


@end
