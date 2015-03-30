//
//  HKYInfoTableViewCell.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYInfoTableViewCell.h"
#import "HKYCommon.h"

@implementation HKYInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) reflash:(HKYInfo *)info
{
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.cornerRadius = 25.0;
    
    self.nameLabel.text = info.user.login;
    self.contentLabel.text = info.content;
    self.florLabel.text = info.floor;
    if (info.user != nil) {
        NSString *idStr = [info.user.identity substringToIndex:4];
        NSString *urlStr = [NSString stringWithFormat:HEADIMAG_URL,idStr,info.user.identity,info
                            .user.icon];
        
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"default_pic"]];
    }else{
        self.headImage.image = [UIImage imageNamed:@"default_pic"];
    }

}
@end
