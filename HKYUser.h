//
//  HKYUser.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKYUser : NSObject <NSCoding>
@property (nonatomic,strong) NSString *login;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *identity;
-(id) initDic:(NSDictionary *)dic;
@end
