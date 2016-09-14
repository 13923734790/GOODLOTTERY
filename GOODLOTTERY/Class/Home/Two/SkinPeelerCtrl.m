//
//  SkinPeelerCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "SkinPeelerCtrl.h"
#import "Masonry.h"
#import "RESideMenu.h"

@interface SkinPeelerCtrl ()<SkinpeelerDelegate>
@end

@implementation SkinPeelerCtrl
{
    NSUserDefaults *userDef;
    SkinpManger *manger;
    NSInteger nub;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Skindelegate = self;
    nub=2;
    NSArray *TitleArray = @[@"蓝色皮肤",@"红色皮肤"];
    for (int i = 0; i<nub; i++)
    {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(5*ScaleX+((UIScreenWIDTH-15*ScaleX)/2+5*ScaleX)*(i%2),5*ScaleY+(105*ScaleY)*(i/2), (UIScreenWIDTH-15*ScaleX)/2,100*ScaleY);
        but.layer.cornerRadius = 5*ScaleY;
        but.layer.masksToBounds = YES;
        but.tag = i+100;
        NSString *string = [NSString stringWithFormat:@"BackImageKing%d",i+1];
        [but setBackgroundImage:[UIImage imageNamed:string] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *Lable = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX+((UIScreenWIDTH-15*ScaleX)/2+5*ScaleX)*(i%2),110*ScaleY+(110*ScaleY)*(i/2), (UIScreenWIDTH-15*ScaleX)/2,20*ScaleY)];
        Lable.textColor = [UIColor whiteColor];
        Lable.font = [UIFont systemFontOfSize:15*ScaleY];
        Lable.textAlignment = NSTextAlignmentCenter;
        Lable.text = TitleArray[i];
        [self.view addSubview:Lable];
        [self.view addSubview:but];
    }
    
   
}

- (void)click:(UIButton *)bt
{
    if (!userDef)userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%ld",bt.tag-99] forKey:@"SkinSpeelerNub"],[userDef synchronize];//存皮肤值
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%ld",bt.tag-99] forKey:@"king"];
    NSNotification *notifion = [NSNotification notificationWithName:@"skinpeeler" object:nil userInfo:dic];
    if (!manger) manger = [SkinpManger ShareSkinpManger];
    manger.Nub = bt.tag-99;
    [[NSNotificationCenter defaultCenter] postNotification:notifion];
    
}
- (void)SkinpeelrNub
{
    
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
