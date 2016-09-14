//
//  CashMoneyCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashMoneyCtrl.h"
#import "CashMoneyView.h"

@interface CashMoneyCtrl ()

@end

@implementation CashMoneyCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    CashMoneyView *cashView = [[CashMoneyView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:cashView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
