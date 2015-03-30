//
//  HKYUser.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYUser.h"

@implementation HKYUser
-(id) initDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.login    = dic[@"login"];
        self.icon     = dic[@"icon"];
        self.identity = dic[@"id"];
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.login = [aDecoder decodeObjectForKey:@"login"];
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.identity = [aDecoder decodeObjectForKey:@"identity"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.login forKey:@"login"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.identity forKey:@"identity"];
}
@end
