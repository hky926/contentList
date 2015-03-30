//
//  HKYInfoViewController.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKYRootViewController.h"
#import "HKYInfoTableViewCell.h"
#import "HKYAricle.h"
@interface HKYInfoViewController : HKYRootViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) id delegate;
@property (nonatomic,strong) HKYAricle *headInfo;
@end
