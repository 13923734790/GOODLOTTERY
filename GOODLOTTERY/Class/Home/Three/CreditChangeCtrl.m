//
//  CreditChangeCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CreditChangeCtrl.h"
#import "CreditChangeView.h"
#import "LotteryCheckHeardView.h"

@interface CreditChangeCtrl ()

@end

@implementation CreditChangeCtrl
{
    UIView *BackView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"彩票账变";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    
    CreditChangeView *CreditView = [[CreditChangeView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-20*ScaleY-NVHEIGHT)];
    [self.view addSubview:CreditView];
    
}


@end
