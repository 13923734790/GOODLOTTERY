//
//  CatchNubCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchNubCtrl.h"
#import "LotteryBarView.h"
#import "CatchView.h"

@implementation CatchNubCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"追号详情";
    [self CustomRight:@"菜单"];
    CatchView *catchview = [[CatchView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:catchview];

}
@end
