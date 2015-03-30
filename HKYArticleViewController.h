//
//  HKYArticleViewController.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYRootViewController.h"
#import "HKYDownloadManager.h"
#import "HKYAricle.h"
#import "HKYArticleTableViewCell.h"
#import "MJRefresh.h"
@interface HKYArticleViewController : HKYRootViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}

@end
