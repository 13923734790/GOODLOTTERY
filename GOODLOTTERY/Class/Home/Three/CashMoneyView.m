//
//  CashMoneyView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashMoneyView.h"
#import "NumbersCustomsField.h"
#import "deepBlocklable.h"
#import "shallowBL.h"

@implementation CashMoneyView

- (instancetype)initWithFrame:(CGRect)frame
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
    NSArray *titleArray = @[@"会员帐户",@"当前余额",@"扣款金额",@"提款金额",@"实收金额",@"",@"",@"首款银行",@"银行卡户名",@"银行账号",@"开户地址",@"资金密码",];
    
    for (int i = 0; i<12; i++)
    {
        deepBlocklable *lable1;
        shallowBL *lable2;
        lable1 = [[deepBlocklable alloc]init];
        lable1.frame = CGRectMake(1,1+(1+40*ScaleY)*i,100*ScaleX,40*ScaleY);
        lable1.text = titleArray[i];
        [self addSubview:lable1];
        
        lable2 = [[shallowBL alloc]init];
        lable2.frame = CGRectMake(100*ScaleX+2,1+(1+40*ScaleY)*i,(UIScreenWIDTH-3-100*ScaleX),40*ScaleY);
        [self addSubview:lable2];
        
        
        if (i==3||i==11)
        {
            NumbersCustomsField *fieldMoney = [[NumbersCustomsField alloc]init];
            fieldMoney.BitNub = 10;
            fieldMoney.FieldType = PureDigitType;
            fieldMoney.frame = CGRectMake(10, 5, lable2.frame.size.width-20, 40*ScaleY-10);
            fieldMoney.backgroundColor = DTAISCOLORE(255, 255, 255, 0.3);
            fieldMoney.textAlignment = NSTextAlignmentCenter;
            fieldMoney.textColor = [UIColor whiteColor];
            lable2.userInteractionEnabled = YES;
            [lable2 addSubview:fieldMoney];
        }
        if (i==5)
        {
            shallowBL *lable11 = [[shallowBL alloc]init];
            shallowBL *lable22 = [[shallowBL alloc]init];
            lable11.backgroundColor = [UIColor clearColor];
            lable22.backgroundColor = [UIColor clearColor];
            lable11.frame = CGRectMake(0, 0,lable2.frame.size.width/2, 40*ScaleY);
            lable22.frame = CGRectMake(lable2.frame.size.width/2, 0, lable2.frame.size.width/2, 40*ScaleY);
            [lable2 addSubview:lable11];
            [lable2 addSubview:lable22];
        }
        if (i==6)
        {
          lable1.frame = CGRectMake(0,0,0,0);
          lable2.frame = CGRectMake(2,1+(1+40*ScaleY)*i,(UIScreenWIDTH-2),40*ScaleY);
        }
        if (i==7)
        {
            lable2.backgroundColor = DTAISCOLORE(255, 255, 255, 0.3);
            lable2.textAlignment = NSTextAlignmentLeft;
            lable2.text = @"中国工商银行";
            lable2.userInteractionEnabled = YES;
            lable2.enabled = YES;

            UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(lable2.frame.size.width-20*ScaleY, 10*ScaleY, 20*ScaleY,20*ScaleY)];
            rightImage.image = [UIImage imageNamed:@"TitleRightImage"];
            [lable2 addSubview:rightImage];
            
              UITapGestureRecognizer *Top = [[  UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(ClickBank)];
            [lable2 addGestureRecognizer:Top];
        }
        
    }
    
    _ContinueBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _ContinueBt.frame = CGRectMake(5,FRAMEHEIGHT-60*ScaleY, UIScreenWIDTH-10, 45*ScaleY);
    _ContinueBt.layer.cornerRadius = 5;
    _ContinueBt.layer.masksToBounds = YES;
    [_ContinueBt setTitle:@"确认录入" forState:UIControlStateNormal];
    [_ContinueBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _ContinueBt.backgroundColor = GETCOLOR(@"blr");
    [self addSubview:_ContinueBt];
}


- (void)ClickBank
{
    NSLog(@"222222");
}
@end
