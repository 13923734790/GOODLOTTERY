//
//  MemberCenterCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MemberCenterCtrl.h"
#import "RESideMenu.h"
#import "MemberCenterView.h"
#import "MemberModel.h"

@interface MemberCenterCtrl ()
@end
@implementation MemberCenterCtrl
{
    MemberCenterView *CenterView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    CenterView = [[MemberCenterView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,UIScreenHEIGHT-20-TABBARHEIGHT-NVHEIGHT)];
    __block MemberCenterCtrl *BlockSelf = self;
    //判断推出的下一界面。
    CenterView.PushCtrlID = ^(NSString *string)
    {

    if ([MemberModel PushCtrlID:string])
    {
        UINavigationController *NVCtrl = [[UINavigationController alloc]initWithRootViewController:[MemberModel PushCtrlID:string]];
        [BlockSelf presentViewController:NVCtrl animated:YES completion:nil];
    }
        
    };
    [self.view addSubview:CenterView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CenterView StartAnimotion];
//   self.navigationController.navigationBar.hidden = YES;
    self.sideMenuViewController.panGestureEnabled = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
