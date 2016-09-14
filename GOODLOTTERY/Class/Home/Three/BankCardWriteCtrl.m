//
//  BankCardWriteCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankCardWriteCtrl.h"
#import "BankWriteView.h"

@interface BankCardWriteCtrl ()

@end

@implementation BankCardWriteCtrl
{
    BankWriteView *bankwriteView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写银行卡信息";
    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    bankwriteView = [[BankWriteView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT-TABBARHEIGHT)];
    bankwriteView.backgroundColor = GETCOLOR(@"cgroup");
    [self.view addSubview:bankwriteView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
