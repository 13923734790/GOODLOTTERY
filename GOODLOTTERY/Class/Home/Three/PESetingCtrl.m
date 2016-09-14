//
//  PESetingCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PESetingCtrl.h"
#import "PESetingView.h"

@interface PESetingCtrl ()

@end

@implementation PESetingCtrl
{
    PESetingView *PEVIew;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"配额设定";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    
    PEVIew = [[PESetingView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT)];
    PEVIew.backgroundColor = GETCOLOR(@"cw");
    
    [self.view addSubview:PEVIew];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
