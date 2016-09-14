//
//  ValueView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ValueView.h"


@implementation ValueView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAllView];
    }
    return self;
}


- (void)setAllView
{
    self.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
    UIImageView *SignImage = [[UIImageView alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+(UIScreenWIDTH/4-15*ScaleX)/2, -15*ScaleX, 15*ScaleX, 15*ScaleX)];
    SignImage.image = [UIImage imageNamed:@"CashImage9"];
    [self addSubview:SignImage];
    
    NSArray *array = @[@"支付模式",@"填写金额",@"选择银行",@"充值到账"];
    for (int i = 0; i<4; i++)
    {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX+(UIScreenWIDTH-20*ScaleX)/4*i,30*ScaleY,(UIScreenWIDTH-20*ScaleX)/4, 20*ScaleY)];
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        lable.textColor = DTAISCOLORE(66,66,66, 1);
        if (i==1||i==2)lable.textAlignment =NSTextAlignmentCenter;
        if (i==3) lable.textAlignment = NSTextAlignmentRight;
        lable.text = array[i];
        [self addSubview:lable];
        if (i<3)
        {
            UIButton *btView = [UIButton buttonWithType:UIButtonTypeCustom];
            btView.frame = CGRectMake(30*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,67.5*ScaleY,(UIScreenWIDTH-100*ScaleX)/3,5*ScaleX);
            if (i==0)btView.selected =YES;
            
            btView.backgroundColor = DTAISCOLORE(66,66,66, 1);
            [self addSubview:btView];
        }
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(10*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,60*ScaleY,20*ScaleX,20*ScaleX);
        bt.layer.cornerRadius = 10*ScaleX;
        bt.layer.masksToBounds = YES;
        if (i==0)bt.selected =YES;
        [bt setBackgroundImage:[UIImage imageNamed:@"progressNo1"] forState:UIControlStateNormal];
        [bt setBackgroundImage:[UIImage imageNamed:@"progressYes1"] forState:UIControlStateSelected];
        [self addSubview:bt];
    }
    
    UIView *MoneyView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleX,110*ScaleY,UIScreenWIDTH-20*ScaleX,40*ScaleY)];
    UIView *ClipView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleX,170*ScaleY,UIScreenWIDTH-20*ScaleX,40*ScaleY)];
    MoneyView.backgroundColor = [UIColor whiteColor];
    ClipView.backgroundColor = [UIColor whiteColor];
    [self addSubview:MoneyView];
    [self addSubview:ClipView];
    
    UILabel *Moneylable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,90*ScaleX,40*ScaleY)];
    Moneylable.textColor = DTAISCOLORE(66,66,66, 1);
    Moneylable.text = @"提款金额:";
    Moneylable.textAlignment = NSTextAlignmentRight;
    Moneylable.font = [UIFont systemFontOfSize:15*ScaleY];
    [MoneyView addSubview:Moneylable];
    UITextField *Moneyfield = [[UITextField alloc]initWithFrame:CGRectMake(100*ScaleX, 0,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
    Moneyfield.textColor = DTAISCOLORE(66,66,66, 1);
    [MoneyView addSubview:Moneyfield];
    
    
    UILabel *Cliplable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,90*ScaleX,40*ScaleY)];
    Cliplable.textColor = DTAISCOLORE(66,66,66, 1);
    Cliplable.text = @"银行卡:";
    Cliplable.textAlignment = NSTextAlignmentRight;
    Cliplable.font = [UIFont systemFontOfSize:15*ScaleY];
    [ClipView addSubview:Cliplable];

    
    
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(110*ScaleX, 250*ScaleY,UIScreenWIDTH-110*ScaleX,15*ScaleY)];
    field.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20*ScaleX,15*ScaleY)];
    imageView.image = [UIImage imageNamed:@"CashImage6"];
    field.leftView  = imageView;
    field.textColor = DTAISCOLORE(66,66,66, 1);
    field.text = @"添加/绑定银行卡";
    field.enabled = NO;
    [self addSubview:field];

    
    
    UIButton *ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ConfirmBt.frame = CGRectMake(10*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
    [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ConfirmBt setTitle:@"立即提款" forState:UIControlStateNormal];
    [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ConfirmBt];
}

- (void)btClick
{

}
@end
