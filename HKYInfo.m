//
//  HKYTempAricle.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYInfo.h"

@implementation HKYInfo
-(id) initDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.identity = dic[@"id"];
        self.content  = dic[@"content"];
        NSNumberFormatter *numformatter = [[NSNumberFormatter alloc]init];
        self.floor = [numformatter stringFromNumber:dic[@"floor"]];
        if(![dic[@"user"] isEqual:[NSNull null]])
        {
            self.user = [[HKYUser alloc] initDic:dic[@"user"]];
        }
    }
    return self;
}
@end
