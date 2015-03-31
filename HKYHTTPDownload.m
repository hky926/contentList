//
//  HKYHTTPDownload.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYHTTPDownload.h"

@implementation HKYHTTPDownload
-(void) downloadFromURL:(NSString *)url
{
    _httpConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
    _downoadData = [[NSMutableData alloc] init];
}
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.downoadData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.downoadData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([self.delegate respondsToSelector:self.methd]) {
        [self.delegate performSelector:self.methd withObject:self afterDelay:0];
        
    }else{
        NSStringFromSelector(self.methd);
    }
}
@end
