//
//  HKYAricle.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYAricle.h"

@implementation HKYAricle
-(id) initDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.identity = dic[@"id"];
        self.content  = dic[@"content"];
        self.comments_count = dic[@"comments_count"];
        NSDictionary *voteDic = dic[@"votes"];
        self.up = voteDic[@"up"];
        
        if (![dic[@"user"] isEqual:[NSNull null]]) {
             NSDictionary *userDic = dic[@"user"];
            self.user = [[HKYUser alloc] initDic:userDic];
        }
        
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.identity forKey:@"identity"];
    [aCoder encodeObject:self.content forKey:@"comments_count"];
    [aCoder encodeObject:self.user forKey:@"user"];
    [aCoder encodeObject:self.up forKey:@"up"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.identity = [aDecoder decodeObjectForKey:@"identity"];
        self.content = [aDecoder decodeObjectForKey:@"comments_count"];
        self.user = [aDecoder decodeObjectForKey:@"user"];
        self.up = [aDecoder decodeObjectForKey:@"up"];
    }
    return self;
}
@end
