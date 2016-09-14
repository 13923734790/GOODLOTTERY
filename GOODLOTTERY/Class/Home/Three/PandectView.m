//
//  PandectView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PandectView.h"
#import "SearchVIew.h"

@interface CurrentLable : UILabel
@end
@implementation CurrentLable
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {   self.textColor = GETCOLOR(@"wb");
        self.font = [UIFont systemFontOfSize:13*ScaleY];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = GETCOLOR(@"b0.3w");
    }
    return self;
}
@end
@implementation PandectView
{
    NSInteger Nub;
}

- (instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _Sview = [[SearchVIew alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH, 44*ScaleY) AndKind:1];        
        [self addSubview:_Sview];
        [self setAllView];
    }
    return self;
}
- (void)setAllView
{
    CGFloat BackHeight;
    NSInteger count;
    if (Nub==1)count=5;else count=6;
    BackHeight=(count*45+0.5)*ScaleY;
    NSArray *array1;    NSArray *array2;
    if (Nub==1)
    {
    array1 = @[@"余额",@"充值",@"投注金额",@"投注返点",@"中奖金额"];
    array2 = @[@"净盈利",@"提现",@"打和返款",@"投注返点"];
    }
    else{
        array1 = @[@"团队人数",@"余额",@"充值",@"投注金额",@"投注返点",@"净盈利"];
        array2 = @[@"注册人数",@"提现",@"中奖金额",@"打和返款",@"投注返点"];
    }
    UIView *BackView = [[UIView alloc]initWithFrame:CGRectMake(0,44*ScaleY,UIScreenWIDTH,BackHeight*ScaleY)];
    BackView.backgroundColor = GETCOLOR(@"cgroup");
    [self addSubview:BackView];
    for (int i = 0;i<count;i++)
    {
        CurrentLable *lable1 = [[CurrentLable alloc]initWithFrame:CGRectMake(0.5*ScaleX,0.5*ScaleY+45*ScaleY*i,(UIScreenWIDTH-2.5*ScaleX)/5,44.5*ScaleY)];
        CurrentLable *lable2 = [[CurrentLable alloc]initWithFrame:CGRectMake((UIScreenWIDTH-2.5*ScaleX)/5+1*ScaleX,0.5*ScaleY+45*ScaleY*i,(UIScreenWIDTH-2.5*ScaleX)*3/10,44.5*ScaleY)];
        
        if(i!=count-1)
        {
            CurrentLable *lable3 = [[CurrentLable alloc]initWithFrame:CGRectMake(1.5*ScaleX+(UIScreenWIDTH-2.5*ScaleX)/2,0.5*ScaleY+45*ScaleY*i,(UIScreenWIDTH-2.5*ScaleX)/5,44.5*ScaleY)];
            CurrentLable *lable4 = [[CurrentLable alloc]initWithFrame:CGRectMake(2*ScaleX+(UIScreenWIDTH-2.5*ScaleX)*7/10,0.5*ScaleY+45*ScaleY*i, (UIScreenWIDTH-2.5*ScaleX)*3/10, 44.5*ScaleY)];
            lable3.backgroundColor = GETCOLOR(@"b0.6w");
            lable4.tag = 400+i;
            lable3.text = array2[i];
            [BackView addSubview:lable3];
            [BackView addSubview:lable4];
        }
        
        lable1.backgroundColor = GETCOLOR(@"b0.6w");
        lable2.tag = 200+i;
        lable1.text = array1[i];
        [BackView addSubview:lable1];
        [BackView addSubview:lable2];

    }
    CurrentLable *lable = [[CurrentLable alloc]initWithFrame:CGRectMake(0.5*ScaleX,0.5*ScaleY+45*ScaleY*count,(UIScreenWIDTH-1*ScaleX),44.5*ScaleY)];
    lable.tag = 99;
    lable.text = @"净盈利=中奖金额+打和返款+投注返点+代理返点-投注金额";
    lable.textAlignment = NSTextAlignmentLeft;
    [BackView addSubview:lable];
}

- (void)Updatas:(NSArray *)array
{
}
@end
