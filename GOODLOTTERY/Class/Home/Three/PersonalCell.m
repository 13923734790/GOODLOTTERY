//
//  PersonalCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PersonalCell.h"

@implementation PersonalCell
{
    UILabel *SJmoney;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        for (int i = 0; i<4; i++)
        {
            
            if (i==3)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(((UIScreenWIDTH-3)/4+1)*i,0,(UIScreenWIDTH-3)/4,40*ScaleY-1);
                [button setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                button.backgroundColor = GETCOLOR(@"b0.3w");
                [button addTarget:self action:@selector(ClickPull) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                
            }
            else
            {
                UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-3)/4+1)*i,0,(UIScreenWIDTH-3)/4,40*ScaleY-1)];
                
                lable.tag = 100+i;
                [self AttributeLable:lable];
                lable.textColor = GETCOLOR(@"yr");
                [self addSubview:lable];
            }
        }
        
    }
    
    _PullBackView = [[UIView alloc]initWithFrame:CGRectMake(0,40*ScaleY,UIScreenWIDTH,100*ScaleY)];
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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self Updatas:nil];
    return self;
}

- (void)AttributeLable:(UILabel *)Lb
{
    Lb.textColor = GETCOLOR(@"wb");
    Lb.backgroundColor = GETCOLOR(@"b0.3w");
    Lb.font = [UIFont systemFontOfSize:13*ScaleY];
    Lb.textAlignment = NSTextAlignmentCenter;
    
}
- (void)ClickPull
{
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
}


- (void)Updatas:(NSArray *)array
{
    NSArray *array1 = @[@"test03",@"3级代理",@"0"];
    for (int i = 0; i<4; i++)
    {
        if (i==3)
        {
        }
        else
        {
            UILabel *lable = [self viewWithTag:100+i];
            lable.text = array1[i];
        }
    }
    
}

- (void)ClickPull:(UIButton *)bt
{
    
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
    
}
@end
