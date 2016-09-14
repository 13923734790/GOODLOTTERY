//
//  ActivityCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ActivityCtrl.h"
#import "ActivityView.h"

@implementation ActivityCtrl
{
    ActivityView *activityView;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"优惠活动";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    
    activityView = [[ActivityView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH, UIScreenHEIGHT-20-NVHEIGHT)];
    activityView.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:activityView];
    
}
@end
