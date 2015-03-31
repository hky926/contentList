//
//  HKYArticleTableViewCell.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYArticleTableViewCell.h"
#import "HKYCommon.h"
#import "UIImageView+WebCache.h"
@implementation HKYArticleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void) reflash:(HKYAricle *) aricle
{
    self.headImag.layer.masksToBounds = YES;
    self.headImag.layer.cornerRadius = 30.0;
    
    self.nameLabel.text = aricle.user.login;
    self.contentlabel.text = aricle.content;
    NSString *evluate = [NSString stringWithFormat:@"%@ 好笑 · %@ 评论",aricle.up,aricle.comments_count];
    self.evaluateLabel.text = evluate;
    if (aricle.user != nil) {
        
        NSString *idStr = [aricle.user.identity substringToIndex:4];
        NSString *urlStr = [NSString stringWithFormat:HEADIMAG_URL,idStr,aricle.user.identity,aricle.user.icon];
      
        [self.headImag sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"default_pic"]];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
        self.headImag.image = [UIImage imageWithData:data];
    }else{
     self.headImag.image = [UIImage imageNamed:@"default_pic"];
    }
    
    
    CGSize size = CGSizeMake(300, MAXFLOAT);
    
    [aricle.content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:@""} context:nil];
    
   // CGSize labelSize = [aricle.content sizeWithFont:[UIFont systemFont constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap]];
   // NSLog(@"%d %d",labelSize.with,labelSize.height);
    //NSDictionary *dic = [NSDictionary dictionarywithobj]
//    CGSize actureSize = [self.contentlabel.text ];
}
@end
