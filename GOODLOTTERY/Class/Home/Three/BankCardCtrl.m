//
//  BankCardCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankCardCtrl.h"
#import "BankCardView.h"
#import "BankCardWriteCtrl.h"
#import "SkinpeelerDelegate.h"

@interface BankCardCtrl ()<SkinpeelerDelegate>

@end

@implementation BankCardCtrl
{
    BankCardView *bankView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定银行卡";
    self.Skindelegate = self;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    bankView = [[BankCardView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT-TABBARHEIGHT)];
    [self.view addSubview:bankView];
    [bankView.button addTarget:self action:@selector(WriteCard) forControlEvents:UIControlEventTouchUpInside];
}
-(void)SkinpeelrNub
{
    [bankView UpdatasImageAndColcor];
}
- (void)WriteCard
{
    BankCardWriteCtrl *Ctrl = [[BankCardWriteCtrl alloc]init];
    [self.navigationController pushViewController:Ctrl animated:YES];
}
@end
