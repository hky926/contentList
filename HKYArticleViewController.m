//
//  HKYArticleViewController.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYArticleViewController.h"
#import "HKYInfoViewController.h"
#import "HKYCommon.h"
@interface HKYArticleViewController ()
{
    int _page;
}
@end

@implementation HKYArticleViewController
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self addTitle:@"纯文"];
    
    _page = 1;
    [self locationData];
    
    [self.view addSubview:self.tableView];
    [self loadData];
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [self loadData];
    }];
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [self addLoadData];
    }];
}
-(void) locationData
{
    NSData *data =  [[NSUserDefaults standardUserDefaults] objectForKey:@"article"];
    NSArray *arr =   [NSKeyedUnarchiver unarchiveObjectWithData:data];
    _dataArray = [NSMutableArray arrayWithArray:arr];
}
-(void) loadData
{
    NSString *urlStr =[NSString stringWithFormat:ARTICLE_URL,_page];
    [[HKYDownloadManager sharManager] addDownload:urlStr type:ARTICLE_TYPE];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upData:) name:urlStr object:nil];
    [self.tableView.header endRefreshing];
    
}
-(void)addLoadData
{
    _page += 1;
    NSString *urlStr =[NSString stringWithFormat:ARTICLE_URL,_page];
    [[HKYDownloadManager sharManager] addDownload:urlStr type:ARTICLE_TYPE];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upData:) name:urlStr object:nil];
    [self.tableView.footer endRefreshing];
}
-(void) upData:(NSNotification *)notification
{
    _dataArray = [[HKYDownloadManager sharManager] objectForKey:[NSNumber       numberWithInt:ARTICLE_TYPE]];
    [self.tableView reloadData];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_dataArray];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"article"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    HKYArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"HKYArticleTableViewCell" owner:self options:nil][0];
    }
    [cell reflash:_dataArray[indexPath.row]];
    return cell;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HKYInfoViewController *infoVC = [[HKYInfoViewController alloc] init];
    [infoVC setHeadInfo:_dataArray[indexPath.row]];
    [self.navigationController pushViewController:infoVC animated:YES];
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
