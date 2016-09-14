//
//  withdrawalCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "withdrawalCtrl.h"
#import "withdrawalView.h"

@interface withdrawalCtrl ()

@end

@implementation withdrawalCtrl
{
    withdrawalView *DrawalView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =_titleString;
    DrawalView = [[withdrawalView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    __weak withdrawalCtrl *blockSelf = self;
    DrawalView.blcokCtrl = ^(UIViewController *Ctrl)
    {
        [blockSelf.navigationController pushViewController:Ctrl animated:YES];
    };
    [self.view addSubview:DrawalView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
