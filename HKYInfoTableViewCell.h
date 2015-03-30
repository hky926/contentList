//
//  HKYInfoTableViewCell.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKYInfo.h"
@interface HKYInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *florLabel;
-(void) reflash:(HKYInfo *)info;
@end
