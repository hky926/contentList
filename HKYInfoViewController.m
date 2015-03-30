//
//  HKYInfoViewController.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYInfoViewController.h"
#import "HKYDownloadManager.h"
#import "HKYArticleTableViewCell.h"
@interface HKYInfoViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _count;
    int _page;
}
@end

@implementation HKYInfoViewController
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
  
}
- (void)viewDidAppear:(BOOL)animated
{
    HKYArticleTableViewCell *headView = [[NSBundle mainBundle] loadNibNamed:@"HKYArticleTableViewCell" owner:self options:nil][0];
    [headView reflash:self.headInfo];
    self.tableView.tableHeaderView = headView;
    
    _count = 10;
    _page = 1;
    [self loadData];
    
    __weak typeof(self) weaSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weaSelf loadData];
    }];
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weaSelf addLoadData];
    }];
}
-(void) loadData
{
    NSString *urlStr = [NSString stringWithFormat:INFO_URL,_count,_page];
    [[HKYDownloadManager sharManager] addDownload:urlStr type:INFO_TYPE];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upData:) name:urlStr object:nil];
    
    [self.tableView.header endRefreshing];
}
-(void) addLoadData
{
    _page += 1;
    NSString *urlStr = [NSString stringWithFormat:INFO_URL,_count,_page];
    [[HKYDownloadManager sharManager] addDownload:urlStr type:INFO_TYPE];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upData:) name:urlStr object:nil];
    [self.tableView.footer endRefreshing];
}
-(void) upData:(NSNotification *)notification
{
    _dataArray = [[HKYDownloadManager sharManager] objectForKey:[NSString stringWithFormat:@"%d",ARTICLE_TYPE]];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HKYInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HKYInfoTableViewCell" owner:self options:nil][0];
    }
    [cell reflash:_dataArray[indexPath.row]];
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
