//
//  OnlineServiceCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OnlineServiceCtrl.h"
#import "RESideMenu.h"

@interface OnlineServiceCtrl ()
@end

@implementation OnlineServiceCtrl
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.sideMenuViewController.panGestureEnabled = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (;) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com