//
//  DealbaseCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DealbaseCtrl.h"
#import "DealbaseView.h"

@interface DealbaseCtrl ()

@end

@implementation DealbaseCtrl
{
    DealbaseView *View;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"返点设定";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    View = [[DealbaseView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH ,UIScreenHEIGHT-20-NVHEIGHT)];
    View.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:View];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
