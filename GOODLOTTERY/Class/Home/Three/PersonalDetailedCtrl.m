//
//  PersonalDetailedCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PersonalDetailedCtrl.h"
#import "PersonalDetailedView.h"

@interface PersonalDetailedCtrl ()

@end

@implementation PersonalDetailedCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =_TitleName;
    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    PersonalDetailedView *View = [[PersonalDetailedView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)AndKind:_kind];
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
