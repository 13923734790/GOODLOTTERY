//
//  CashSubViewOne.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashSubViewOne.h"
#import "CashSubVIewOneSubOne.h"

@implementation CashSubViewOne
{
    UILabel *MoneyLable;
    UILabel *TitleName;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIView *MoneyView = [[UIView alloc]initWithFrame:CGRectMake(0,30*ScaleY,UIScreenWIDTH,80*ScaleY+1)];
        MoneyView.backgroundColor = [UIColor whiteColor];
        [self addSubview:MoneyView];
        
        
        UILabel *NameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90*ScaleX,40*ScaleY)];
        NameLable.textColor = DTAISCOLORE(66,66,66, 1);
        NameLable.text = @"会员账号:";
        NameLable.textAlignment = NSTextAlignmentRight;
        NameLable.font = [UIFont systemFontOfSize:15*ScaleY];
        [MoneyView addSubview:NameLable];
        
        TitleName = [[UILabel alloc]initWithFrame:CGRectMake(100*ScaleX,0,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
        TitleName.textColor = DTAISCOLORE(66,66,66, 1);
        TitleName.font = [UIFont systemFontOfSize:15*ScaleY];
        TitleName.text = @"sssss";
        [MoneyView addSubview:TitleName];

        UIView *lineVIew1 = [[UIView alloc]initWithFrame:CGRectMake(10,40*ScaleY, UIScreenWIDTH-20, 1)];
        lineVIew1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [MoneyView addSubview:lineVIew1];
        
        
    
        
        UILabel *Moneylable = [[UILabel alloc]initWithFrame:CGRectMake(0,40*ScaleY+1,90*ScaleX,40*ScaleY)];
        Moneylable.textColor = DTAISCOLORE(66,66,66, 1);
        Moneylable.text = @"*提款金额:";
        Moneylable.textAlignment = NSTextAlignmentRight;
        Moneylable.font = [UIFont systemFontOfSize:15*ScaleY];
        [MoneyView addSubview:Moneylable];
        
        
         NumbersCustomsField *Moneyfield = [[NumbersCustomsField alloc]initWithFrame:CGRectMake(100*ScaleX, 40*ScaleY+1,MoneyView.frame.size.width-100*ScaleX, 40*ScaleY)];
        Moneyfield.BitNub = 6;
        Moneyfield.FieldType = PureDigitType;
        Moneyfield.textColor = DTAISCOLORE(66,66,66, 1);
        [MoneyView addSubview:Moneyfield];
        
        
        UILabel *lableTilte = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX, 110*ScaleY,UIScreenWIDTH-10*ScaleX,75*ScaleY)];
        lableTilte.textColor = DTAISCOLORE(66,66,66, 1);
        lableTilte.numberOfLines = 0;
        lableTilte.text = @"备注:\n1,标记有*者为必填项目。\n2,单笔最低存款金额:1.00元以上。\n3,单笔最高存款金额:1000.00元以下。";
        lableTilte.font = [UIFont systemFontOfSize:13*ScaleY];
        [self addSubview:lableTilte];
        
        
        
        
        
        
        
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
    
    CashSubVIewOneSubOne * OneView = [[CashSubVIewOneSubOne alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    OneView.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
    [self addSubview:OneView];
}
@end
