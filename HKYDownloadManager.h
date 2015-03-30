//
//  HKYDownloadManager.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKYHTTPDownload.h"
#import "HKYCommon.h"
#import "HKYAricle.h"
#import "HKYInfo.h"

@interface HKYDownloadManager : NSObject
{
    NSMutableDictionary *_resutlDict;
    NSMutableDictionary *_taskDict;
}
+(HKYDownloadManager *)sharManager;
-(id) objectForKey:(NSString *)key;
-(void) addDownload:(NSString *)url type:(NSInteger) type;
@end
