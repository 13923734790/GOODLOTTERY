//
//  RunALotteryCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RunALotteryCtrl.h"
#import "RunALotteryView.h"

@interface RunALotteryCtrl ()

@end

@implementation RunALotteryCtrl
{
    RunALotteryView *LotteryView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开奖结果";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    LotteryView = [[RunALotteryView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT)];
    [self.view addSubview:LotteryView];
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
