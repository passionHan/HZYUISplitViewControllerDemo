//
//  HZYMasterViewController.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/18.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZYMasterViewController;
@protocol masterViewControllerDelegate <NSObject>

- (void)masterViewController:(HZYMasterViewController *)masterVC didSelectedRowInSection:(NSInteger)section;

@end

@interface HZYMasterViewController : UITableViewController 

@property (nonatomic, weak) id <masterViewControllerDelegate> delegate;


@end
