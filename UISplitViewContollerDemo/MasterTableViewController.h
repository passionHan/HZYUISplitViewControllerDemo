//
//  MasterTableViewController.h
//  UISplitViewContollerDemo
//
//  Created by 韩昭永 on 16/5/17.
//  Copyright © 2016年 韩昭永. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterTableViewController, SingleModel;
@protocol masterTableViewControllerDelegate <NSObject>

- (void)masterTableViewController:(MasterTableViewController *)masterVC didSelectedRow:(SingleModel *)singleModel;

@end

@interface MasterTableViewController : UITableViewController

@property (nonatomic, weak) id <masterTableViewControllerDelegate> delegate;


@end
