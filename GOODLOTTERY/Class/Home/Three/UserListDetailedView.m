//
//  UserListDetailedView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListDetailedView.h"
#import "blackAndwhiteLable.h"

@implementation UserListDetailedView
{
    UILabel *TitleView;
    NSArray *array;
    NSInteger nub;
}
- (instancetype)initWithFrame:(CGRect)frame
{
        self = [super initWithFrame:frame];
        if (self)
        {
            [self SetAllUI];
        }

        return self;
}



- (void)SetAllUI
{
    self.backgroundColor = GETCOLOR(@"cw");
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH, 315*ScaleY)];
    backView.backgroundColor = GETCOLOR(@"cgroup");
    [self addSubview:backView];
    
    array = @[@"下属用户详情:",@"用户名称:",@"用户昵称:",@"用户等级:",@"可用金额:",@"注册时间:",@"最后登录时间:"];
    for (int i = 0; i<7; i++)
    {
        UIView *backCell= [[UIView alloc]initWithFrame:CGRectMake(0,45*ScaleY*i, UIScreenWIDTH, 45*ScaleY-1)];
        if (i!=0)
        {
          backCell.backgroundColor = GETCOLOR(@"b0.3w");
        }
        [backView addSubview:backCell];
        
        blackAndwhiteLable *lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(10,0,UIScreenWIDTH/3,45*ScaleY-1)];
        lable1.text = array[i];
        blackAndwhiteLable *lable2;
        if (i==0)
        {
            UIButton *OtherBt = [UIButton buttonWithType:UIButtonTypeCustom];
            OtherBt.frame= CGRectMake(UIScreenWIDTH/3+10,5*ScaleY, UIScreenWIDTH*2/3-30,35*ScaleY);
            OtherBt.layer.cornerRadius = 5;
            OtherBt.layer.masksToBounds = YES;
            [OtherBt setTitle:@"用户信息" forState:UIControlStateNormal];
            [OtherBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
            [OtherBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
            
            [OtherBt addTarget:self action:@selector(OtherBtClick:) forControlEvents:UIControlEventTouchUpInside];
            OtherBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            //      OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
            OtherBt.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH*2/3-30-25*ScaleX,0, -5*ScaleX);
            
            OtherBt.backgroundColor = GETCOLOR(@"w0.1group");
            [backCell addSubview:OtherBt];

        }
        else
        {
            lable2 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/3+10,0,UIScreenWIDTH*2/3-10,45*ScaleY-1)];
            lable2.tag = 100+i;
        }
        [backCell addSubview:lable2];
        [backCell addSubview:lable1];

    }
    
    [self Updatas:nil];
}

- (void)OtherBtClick:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    
    
    pullmenu.DatasArray = @[@"用户信息",@"重庆时时彩",@"北京快乐8",@"北京PK10",@"福彩3D"];
    
    
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
}

- (void)Updatas:(NSArray *)array
{
  NSArray *array1 = @[@"1212121",@"XUXUXU",@"代理用户",@"0.00元",@"2015-10-08-11：32:36",@"2015-10-08-11：32:36"];
   for (int i = 0; i<6; i++)
   {
    UILabel *lable = [self viewWithTag:101+i];
    lable.text =array1[i];
   }
}

- (void)UpdateImageAndColor
{
}

@end
