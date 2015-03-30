//
//  HKYDownloadManager.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYDownloadManager.h"

@implementation HKYDownloadManager
+ (HKYDownloadManager *)sharManager
{
    static HKYDownloadManager *httpManager = nil;
    if (!httpManager) {
        httpManager = [[HKYDownloadManager alloc] init];
    }
    return httpManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _taskDict   = [[NSMutableDictionary alloc] init];
        _resutlDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)addDownload:(NSString *)url type:(NSInteger)type
{
    HKYHTTPDownload *hd = [[HKYHTTPDownload alloc] init];
    hd.url = url;
    hd.type = type;
    hd.delegate = self;
    hd.methd = @selector(downloadComple:);
    [hd downloadFromURL:url];
        
    [_taskDict setObject:hd forKey:url];
}
-(void) addResultDownload:(NSString *)url type:(NSInteger) type
{
    HKYHTTPDownload *hd = [[HKYHTTPDownload alloc] init];
    hd.url = url;
    hd.type = type;
    hd.delegate = self;
    hd.methd = @selector(downloadComple:);
    [hd downloadFromURL:url];
    
}
-(id)objectForKey:(NSNumber *)key
{
    return [_resutlDict objectForKey:key];
}
-(void)downloadComple:(HKYHTTPDownload *)hd
{
    switch (hd.type) {
        case ARTICLE_TYPE:
            [self pariseArticleList:hd];
            break;
        case INFO_TYPE:
            [self pariseInfoList:hd];
        }
    [[NSNotificationCenter defaultCenter] postNotificationName:hd.url object:nil];
}
-(void) pariseArticleList:(HKYHTTPDownload *)hd
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:hd.downoadData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *articArray = [[NSMutableArray alloc] init];
    if ( [_resutlDict objectForKey:[NSNumber numberWithInteger:hd.type]] != nil) {
         NSArray *array =  [_resutlDict objectForKey:[NSNumber numberWithInteger:hd.type]];
        [articArray addObjectsFromArray:array];
    }
   
    if (dic != nil) {
        NSArray *arr = dic[@"items"];
        for (NSDictionary *dic in arr) {
            HKYAricle *aricle = [[HKYAricle alloc] initDic:dic];
            [articArray addObject:aricle];
        }
    }
    [_resutlDict setObject:articArray forKey:[NSNumber numberWithInteger:hd.type]];
}
-(void) pariseInfoList:(HKYHTTPDownload *)hd
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:hd.downoadData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *infoArray = [[NSMutableArray alloc] init];
    NSArray *arr = [_resutlDict objectForKey:[NSNumber numberWithInteger:hd.type]];
    [infoArray addObjectsFromArray:arr];
    
    if (dic != nil) {
        NSArray *arr = dic[@"items"];
        for (NSDictionary *dic in arr) {
            HKYInfo *info = [[HKYInfo alloc] initDic:dic];
            [infoArray addObject:info];
        }
    }
    [_resutlDict setObject:infoArray forKey:[NSNumber numberWithInteger:hd.type]];
}
@end
