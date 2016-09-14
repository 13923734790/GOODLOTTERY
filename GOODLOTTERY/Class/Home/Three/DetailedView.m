//
//  DetailedView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DetailedView.h"
#import "blackAndwhiteLable.h"

@implementation DetailedView
{
    UILabel *TitleView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    
    NSArray *array1 = @[@"用户名:",@"注单编号:",@"游戏:",@"倍数模式:",@"奖期:",@"投单时间:",@"注单奖金:",@"开奖内容:",@"玩法:",@"总金额:",@"动态返点:",@"订单状态:",@"投注内容:"];
    NSArray *array2 = @[@"奖级名称",@"号码",@"倍数",@"奖级",@"奖金"];
    self = [super initWithFrame:frame];
    if (self)
    {
        for (int i = 0; i<13; i++)
        {
            blackAndwhiteLable *lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(15*ScaleX,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH/4,20*ScaleY)];
            lable1.text = array1[i];
            blackAndwhiteLable *lable2 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+20*ScaleX,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH*3/4-20*ScaleX,20*ScaleY)];
            lable2.tag = 100+i;
            if (i==9) lable2.textColor =[UIColor redColor];
                if (i==11)lable2.textColor =DTAISCOLORE(63, 136, 37, 1);
              
            [self addSubview:lable2];
            [self addSubview:lable1];
        }
        
        for (int i = 0; i<5; i++)
        {
            blackAndwhiteLable *lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(15*ScaleX,375*ScaleY+5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH/4,20*ScaleY)];
            lable1.text = array2[i];
            blackAndwhiteLable *lable2 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+20*ScaleX,375*ScaleY+5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH*3/4-20*ScaleX,20*ScaleY)];
            lable2.tag = 200+i;
            [self addSubview:lable2];
            [self addSubview:lable1];
        }
    }
    TitleView = [[UILabel alloc]initWithFrame:CGRectMake(0,330*ScaleY,UIScreenWIDTH, 45*ScaleY)];
    TitleView.backgroundColor = GETCOLOR(@"b0.6b");
    TitleView.textAlignment =NSTextAlignmentCenter;
    TitleView.font = [UIFont systemFontOfSize:20*ScaleY];
    TitleView.textColor = [UIColor whiteColor];
    [self addSubview:TitleView];
    [self Updatas:nil];
    [self UpdateImageAndColor];
    return self;
}

- (void)Updatas:(NSArray *)array
{
    NSArray *array1 = @[@"SuperZachMan",@"20160225140426104",@"重庆时时彩",@"1倍，元",@"20160220509",@"2016-02-09 14:04:05:09",@"24545",@"2,2,2,2,2",@"后三直选复式",@"100000",@"99",@"未中奖",@"1｜1｜2"];
    NSArray *array2 = @[@"后三直选复式",@"0｜1｜2",@"1",@"1",@"1480"];
    for (int i = 0; i<13; i++)
    {
        UILabel *lable = [self viewWithTag:100+i];
        lable.text =array1[i];
    }
    
    for (int i = 0; i<5; i++)
    {
        UILabel *lable = [self viewWithTag:200+i];
        lable.text =array2[i];
    }
    
    TitleView.text =@"可能中奖情况";
}
- (void)UpdateImageAndColor
{
    self.backgroundColor = GETCOLOR(@"cw");
}

@end
