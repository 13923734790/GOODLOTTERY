//
//  ReportFootView.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReportFootView.h"

@implementation ReportFootView
{
    UILabel *SJmoney;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = GETCOLOR(@"cgroup");
    }
    
    return self;
}
- (void)setKind:(NSInteger)Kind
{
    _Kind = Kind;
    if (_Kind==1)
    {
        [self personneView];
    }
    if (_Kind==2)
    {
        [self TeamView];
    }
    
}
- (void)personneView
{
    
    for (int i = 0; i<4; i++)
    {
        if (i==3)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(((UIScreenWIDTH-3)/4+1)*i,0,(UIScreenWIDTH-3)/4,39*ScaleY);
            [button setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
            button.backgroundColor = GETCOLOR(@"b0.6w");
            [button addTarget:self action:@selector(ClickPull:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
        }
        else
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-3)/4+1)*i,0,(UIScreenWIDTH-3)/4,39*ScaleY)];
            lable.tag = 100+i;
            [self AttributeLable:lable];
            lable.backgroundColor = GETCOLOR(@"b0.6w");
            if (i==0)
            {
                lable.backgroundColor = GETCOLOR(@"rg");
            }
            [self addSubview:lable];
        }
    }
    
    _PullBackView = [[UIView alloc]initWithFrame:CGRectMake(0,40,UIScreenWIDTH,125*ScaleY)];
    _PullBackView.hidden = YES;
    
    NSArray *Lb1Array = @[@"提款",@"充值",@"彩票中奖",@"代理返点",@"投注返点"];
    for (int i = 0; i<5; i++)
    {
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,25*ScaleY*i,(UIScreenWIDTH-1)/2,24.5*ScaleY)];
        [_PullBackView addSubview:lable1];
        
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH-1)/2+1,25*ScaleY*i,(UIScreenWIDTH-1)/2,24.5*ScaleY)];
        [_PullBackView addSubview:lable2];
        lable1.text = Lb1Array[i];
        lable2.text = @"0";
        [self AttributeLable:lable1];
        [self AttributeLable:lable2];
    }
    
    [self addSubview:_PullBackView];
    [self Uppersonnedatas:nil];
    
}
- (void)TeamView
{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(((UIScreenWIDTH-3)/4)*3+3,0,(UIScreenWIDTH-3)/4,39*ScaleY);
        [button setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
        button.backgroundColor = GETCOLOR(@"b0.6w");
       [button addTarget:self action:@selector(ClickPull:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    
    
       UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,0,(UIScreenWIDTH-3)/2+1,39*ScaleY)];
       [self AttributeLable:lable1];
       lable1.text = @"总计(资金变动总额)";
       lable1.backgroundColor = GETCOLOR(@"b0.6w");
       [self addSubview:lable1];
    
    
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-3)/4)*2+2,0,(UIScreenWIDTH-3)/4,39*ScaleY)];
        [self AttributeLable:lable2];
        lable2.backgroundColor = GETCOLOR(@"b0.6w");
        lable2.text = @"0";
        [self addSubview:lable2];
   
    
    _PullBackView = [[UIView alloc]initWithFrame:CGRectMake(0,40,UIScreenWIDTH,100*ScaleY)];
    _PullBackView.hidden = YES;
    
    
    NSArray *Lb1Array = @[@"投注返点",@"代理返点",@"返奖总额",@"充值总额",@"提现总额",@"总盈亏"];
    for (int i = 0; i<6; i++)
    {
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-1)/2+1)*(i%2),25*ScaleY*(i/2),(UIScreenWIDTH-1)/4,24.5*ScaleY)];
        [_PullBackView addSubview:lable1];
        
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH-1)/4+((UIScreenWIDTH-1)/2+1)*(i%2),25*ScaleY*(i/2),(UIScreenWIDTH-1)/4,24.5*ScaleY)];
        [_PullBackView addSubview:lable2];
        lable1.text = Lb1Array[i];
        [self AttributeLable:lable1];
        [self AttributeLable:lable2];
    }
    
    SJmoney = [[UILabel alloc]initWithFrame:CGRectMake(0,75*ScaleY,UIScreenWIDTH,24.5*ScaleY)];
    SJmoney.text = @"实际销售总额度0";
    [self AttributeLable:SJmoney];
    [_PullBackView addSubview:SJmoney];
    [self addSubview:_PullBackView];

}

- (void)AttributeLable:(UILabel *)Lb
{
    Lb.textColor = GETCOLOR(@"wb");
    Lb.backgroundColor = GETCOLOR(@"b0.3w");
    Lb.font = [UIFont systemFontOfSize:13*ScaleY];
    Lb.textAlignment = NSTextAlignmentCenter;
}

- (void)ClickPull:(UIButton *)bt
{
    
    bt.selected = !bt.selected;
    if (_blcokpullCell)
    {
        _blcokpullCell(bt.selected);
    }
}

- (void)Uppersonnedatas:(NSArray *)array
{
    UILabel *lable1 = (UILabel *)[self viewWithTag:100];
    UILabel *lable2 = (UILabel *)[self viewWithTag:101];
    UILabel *lable3 = (UILabel *)[self viewWithTag:102];
    
    lable1.text = @"总计";
    lable2.text = @"0";
    lable3.text = @"0";
    
}

- (void)UpTeamdatas:(NSArray *)array
{
    
}
@end
