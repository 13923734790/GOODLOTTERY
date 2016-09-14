//
//  ChangeDataCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangeDataCtrl.h"
#import "ChangeDataView.h"

@interface ChangeDataCtrl ()

@end

@implementation ChangeDataCtrl


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"资料修改";
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    ChangeDataView *DataView = [[ChangeDataView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT)];
    [self.view addSubview:DataView];
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
