//
//  CatchCheckDetailedCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchCheckDetailedCtrl.h"
#import "CatchDetaildView.h"
@interface CatchCheckDetailedCtrl ()

@end

@implementation CatchCheckDetailedCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"追号记录";
//    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    CatchDetaildView *View = [[CatchDetaildView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    View.backgroundColor =GETCOLOR(@"cw");
    [self.view addSubview:View];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
