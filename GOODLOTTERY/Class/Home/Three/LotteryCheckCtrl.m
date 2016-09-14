//
//  LotteryCheckCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LotteryCheckCtrl.h"
#import "LotteryCheckHeardView.h"
#import "CheckView.h"
#import "DetailedCtrl.h"

@implementation LotteryCheckCtrl
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"彩票查询";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    CheckView *heardView = [[CheckView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:heardView];
    __weak LotteryCheckCtrl *BlockSelf = self;
    
    heardView.SeletedCell = ^(NSString *string)
    {
        DetailedCtrl *ctrl = [[DetailedCtrl alloc]init];
        [BlockSelf.navigationController pushViewController:ctrl animated:YES];
    };
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
@end
