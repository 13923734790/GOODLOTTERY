//
//  ChangePasswordCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangePasswordCtrl.h"
#import "ChangePasswordView.h"

@interface ChangePasswordCtrl ()

@end
@implementation ChangePasswordCtrl
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"修改密码";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    ChangePasswordView *changeView = [[ChangePasswordView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    changeView.PagIndex = _PagIndex;
    [self.view addSubview:changeView];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
