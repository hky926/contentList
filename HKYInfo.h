//
//  HKYTempAricle.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKYUser.h"
@interface HKYInfo : NSObject
@property (nonatomic,copy) NSString *identity;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) HKYUser *user;
@property (nonatomic,strong) NSString *floor;
-(id) initDic:(NSDictionary *)dic;
@end
