//
//  TopUpViewCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TopUpViewCtrl.h"
#import "TopUpView.h"

@interface TopUpViewCtrl ()

@end

@implementation TopUpViewCtrl
{
    TopUpView *UpView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _titleString;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    UpView = [[TopUpView  alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:UpView];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


@end
