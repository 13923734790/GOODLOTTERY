//
//  CreditTabbarConfirm.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/27.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "CreditTabbarConfirm.h"

@implementation CreditTabbarConfirm

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self SetConfirmBetsView];
    }
    return self;
}

- (void)SetConfirmBetsView
{
    
    _leftbutton1 = [UIButton  buttonWithType:UIButtonTypeCustom];
    _rightbutton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftbutton1.frame = CGRectMake(5*ScaleX, 5*ScaleY,60*ScaleX,35*ScaleY);
    _rightbutton1.frame = CGRectMake(UIScreenWIDTH-(65*ScaleX),5*ScaleY,60*ScaleX,35*ScaleY);
    
    _MoneyField = [[NumbersCustomsField alloc]init];
    _MoneyField.frame = CGRectMake(UIScreenWIDTH/4,5*ScaleY,UIScreenWIDTH/2,35*ScaleY);
    _MoneyField.FieldType = PureDigitType;
    _MoneyField.keyboardType = UIKeyboardTypeNumberPad;
    _MoneyField.BitNub = 5;
    _MoneyField.textAlignment = NSTextAlignmentCenter;
    _MoneyField.contentHorizontalAlignment =UIControlContentVerticalAlignmentCenter;
    _MoneyField.textColor = [UIColor whiteColor];
    _MoneyField.placeholder = @"输入金额";
    [_MoneyField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_MoneyField setValue:[UIFont boldSystemFontOfSize:15]forKeyPath:@"_placeholderLabel.font"];
    
    [self addSubview:_leftbutton1];
    [self addSubview:_rightbutton1];
    [self addSubview:_MoneyField];
    [self UpdataImageTextColor2];
    
}

- (void)UpdataImageTextColor2
{
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGEFILE(@"customBackTwo%ld")]];
    _MoneyField.backgroundColor = [UIColor colorWithPatternImage:[CommonDatas createImageWithColor:DTAISCOLORE(105,105,105,0.7)]];
    [_leftbutton1 setBackgroundImage:[UIImage imageNamed:@"LeftAddImage1"] forState:UIControlStateNormal];
    [_rightbutton1 setBackgroundImage:[UIImage imageNamed:@"RightSeleted1"] forState:UIControlStateNormal];
    
}

@end
