//
//  UserListCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListCtrl.h"
#import "UserListView.h"
#import "UserListPushModel.h"


@interface UserListCtrl ()

@end

@implementation UserListCtrl
{
    UserListView *listView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户列表";
    
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    listView = [[UserListView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT)];
    __weak  UserListCtrl *Blockself = self;
    listView.blcokpushView = ^(NSString *TitleString)
    {
        [Blockself PUshCtrl:TitleString];
    };
    [self.view addSubview:listView];
    
    
}
-(void)PUshCtrl:(NSString *)titlestring
{
    
    [self.navigationController pushViewController:[UserListPushModel   returnCtrl:titlestring] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
