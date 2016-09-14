//
//  TransferCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TransferCtrl.h"
#import "TransferView.h"

@interface TransferCtrl ()

@end

@implementation TransferCtrl
{
    TransferView *View;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转帐";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    View = [[TransferView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH ,UIScreenHEIGHT-20-NVHEIGHT)];
    View.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:View];
    
}


@end
