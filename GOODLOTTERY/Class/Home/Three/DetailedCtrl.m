//
//  DetailedCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DetailedCtrl.h"
#import "DetailedView.h"

@interface DetailedCtrl ()

@end
@implementation DetailedCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"彩票详情";
//    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    DetailedView *View = [[DetailedView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:View];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
