//
//  HKYRootViewController.m
//  huaikaiyuan
//
//  Created by huai on 15/3/30.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HKYRootViewController.h"

@interface HKYRootViewController ()

@end

@implementation HKYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) addTitle:(NSString *)titleStr
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = titleStr;
    label.textAlignment = NSTextAlignmentCenter;
    label.font =  [UIFont fontWithName:@"Helvetica-Bold" size:20.0f];
    label.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = label;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
