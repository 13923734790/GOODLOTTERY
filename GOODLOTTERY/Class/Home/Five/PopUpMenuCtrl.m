//
//  PopUpMenuCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PopUpMenuCtrl.h"
#import "RESideMenu.h"

@implementation PopUpMenuCtrl
{
    UIButton *button;
}
-(void)viewDidLoad
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = self.view.frame;
    [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)Click:(UIButton *)bt
{
[self dismissViewControllerAnimated:NO completion:nil];
}
@end
