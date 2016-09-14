//
//  RegisterCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RegisterCtrl.h"
#import "RegisterView.h"

@implementation RegisterCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册管理";
//    [self CustomRight:@"菜单"];
    RegisterView *Registerview = [[RegisterView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:Registerview];
}
@end
