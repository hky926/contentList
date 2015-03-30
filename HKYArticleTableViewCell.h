//
//  HKYArticleTableViewCell.h
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKYAricle.h"

@interface HKYArticleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImag;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLabel;

-(void) reflash:(HKYAricle *)aricle;
@end
