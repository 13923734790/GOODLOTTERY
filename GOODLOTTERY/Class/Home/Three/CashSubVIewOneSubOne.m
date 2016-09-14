//
//  CashSubVIewOneSubOne.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashSubVIewOneSubOne.h"

@implementation CashSubVIewOneSubOne
{
    UILabel *TitleName;
    UILabel *orderNumber;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        UILabel *lable00 = [[UILabel alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH/3,30*ScaleY)];
        lable00.textColor = GETCOLOR(@"blr");
        lable00.textAlignment = NSTextAlignmentCenter;
        lable00.font = [UIFont systemFontOfSize:15*ScaleY];
        lable00.text = @"您的资料如下:";
        [self addSubview:lable00];
        
        UIView *MoneyView = [[UIView alloc]initWithFrame:CGRectMake(0,30*ScaleY,UIScreenWIDTH,120*ScaleY+2)];
        MoneyView.backgroundColor = [UIColor whiteColor];
        [self addSubview:MoneyView];
        
        
        
        UILabel *merchant = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90*ScaleX,40*ScaleY)];
        merchant.textColor = DTAISCOLORE(66,66,66, 1);
        merchant.text = @"商家订单号:";
        merchant.textAlignment = NSTextAlignmentRight;
        merchant.font = [UIFont systemFontOfSize:15*ScaleY];
        [MoneyView addSubview:merchant];
        
        orderNumber = [[UILabel alloc]initWithFrame:CGRectMake(100*ScaleX,0,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
        orderNumber.textColor = DTAISCOLORE(66,66,66, 1);
        orderNumber.font = [UIFont systemFontOfSize:15*ScaleY];
        orderNumber.text = @"201605090019748";
        [MoneyView addSubview:orderNumber];

        
        
        
        
        UILabel *NameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 40*ScaleY+1, 90*ScaleX,40*ScaleY)];
        NameLable.textColor = DTAISCOLORE(66,66,66, 1);
        NameLable.text = @"会员账号:";
        NameLable.textAlignment = NSTextAlignmentRight;
        NameLable.font = [UIFont systemFontOfSize:15*ScaleY];
        [MoneyView addSubview:NameLable];
        
        TitleName = [[UILabel alloc]initWithFrame:CGRectMake(100*ScaleX,40*ScaleY+1,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
        TitleName.textColor = DTAISCOLORE(66,66,66, 1);
        TitleName.font = [UIFont systemFontOfSize:15*ScaleY];
        TitleName.text = @"sssss";
        [MoneyView addSubview:TitleName];
        
        UIView *lineVIew1 = [[UIView alloc]initWithFrame:CGRectMake(10,40*ScaleY, UIScreenWIDTH-20, 1)];
        lineVIew1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [MoneyView addSubview:lineVIew1];
        
        UIView *lineVIew2 = [[UIView alloc]initWithFrame:CGRectMake(10,80*ScaleY+1, UIScreenWIDTH-20, 1)];
        lineVIew2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [MoneyView addSubview:lineVIew2];
        
        
        
        
        UILabel *Moneylable = [[UILabel alloc]initWithFrame:CGRectMake(0,80*ScaleY+2,90*ScaleX,40*ScaleY)];
        Moneylable.textColor = DTAISCOLORE(66,66,66, 1);
        Moneylable.text = @"*提款金额:";
        Moneylable.textAlignment = NSTextAlignmentRight;
        Moneylable.font = [UIFont systemFontOfSize:15*ScaleY];
        [MoneyView addSubview:Moneylable];
        
        
        NumbersCustomsField *Moneyfield = [[NumbersCustomsField alloc]initWithFrame:CGRectMake(100*ScaleX, 80*ScaleY+2,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
        Moneyfield.BitNub = 6;
        Moneyfield.FieldType = PureDigitType;
        Moneyfield.textColor = DTAISCOLORE(66,66,66, 1);
        [MoneyView addSubview:Moneyfield];
        
        
        
        
        
        
        UIButton *ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
        ConfirmBt.frame = CGRectMake(10*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
        [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
        [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ConfirmBt setTitle:@"开始充值" forState:UIControlStateNormal];
        [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ConfirmBt];
    }
    
    return self;
}

- (void)btClick
{
    
    
    
}
@end
