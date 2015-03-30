//
//  HKYHTTPDownload.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKYHTTPDownload : NSObject<NSURLConnectionDataDelegate>
{
    NSURLConnection *_httpConnection;
}
@property(nonatomic,strong) id delegate;
@property(nonatomic,assign) SEL methd;
@property(nonatomic,copy) NSMutableData *downoadData;
@property(nonatomic,assign) NSInteger type;
@property(nonatomic,copy) NSString *url;
-(void) downloadFromURL:(NSString *)url;
@end
