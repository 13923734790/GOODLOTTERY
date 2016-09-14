//
//  PromotedCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PromotedCtrl.h"
#import "PromotedView.h"
@implementation PromotedCtrl
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册管理";
    PromotedView *_PromotedView = [[PromotedView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:_PromotedView];
}
@end
