//
//  ColorKindCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ColorKindCtrl.h"
#import "ColorKindView.h"

@implementation ColorKindCtrl
{
    ColorKindView *ColorView;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _Titlename;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    ColorView = [[ColorKindView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    ColorView.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:ColorView];
}
@end
