//
//  UserListDetailedCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListDetailedCtrl.h"
#import "UserListDetailedView.h"

@interface UserListDetailedCtrl ()

@end

@implementation UserListDetailedCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"彩种信息";
     self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    UserListDetailedView *View = [[UserListDetailedView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH ,UIScreenHEIGHT)];
    [self.view addSubview:View];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
