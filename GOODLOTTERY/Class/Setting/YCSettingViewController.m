//
//  YCSettingViewController.m
//  Colors
//
//  Created by apple on 15/12/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "YCSettingViewController.h"
#import "RESideMenu.h"

@interface YCSettingViewController ()
@end

@implementation YCSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(presentLeftMenuViewController:)];
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TTPP"]];
    ;

    // Do any additional setup after loading the view.
}
 

#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com