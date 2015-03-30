//
//  HKYAricle.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKYUser.h"

@interface HKYAricle : NSObject<NSCoding>
@property (nonatomic,copy) NSString *identity;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *comments_count;
@property (nonatomic,copy) NSString *up;

@property(nonatomic,strong) HKYUser *user;
-(id) initDic:(NSDictionary *)dic;
@end
