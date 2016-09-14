//
//  TopUpHeard.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TopUpHeard.h"

@implementation TopUpHeard
{
    UIButton *headImagebt;
    UILabel *NameLable;
    UILabel *MoneyLable;
    UIImageView *JuhuaImage;
    NSInteger BtNub;
}

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
    
    headImagebt = [UIButton buttonWithType:UIButtonTypeCustom];
    headImagebt.frame = CGRectMake(70*ScaleX,10*ScaleX,80*ScaleX,80*ScaleX);
    headImagebt.layer.cornerRadius =40*ScaleX;
    headImagebt.layer.masksToBounds = YES;
    [self addSubview:headImagebt];
    
    NameLable = [[UILabel alloc]init];
    NameLable.frame = CGRectMake(160*ScaleX,20*ScaleX,150*ScaleX,20*ScaleX);
        NameLable.textColor = [UIColor whiteColor];
    NameLable.font = [UIFont systemFontOfSize:15*ScaleX];
    NameLable.text = @"Comtemplation";
    [self addSubview:NameLable];
    JuhuaImage = [[UIImageView alloc]init];
    
    JuhuaImage.frame = CGRectMake(320*ScaleX,20*ScaleX,20*ScaleX, 20*ScaleX);
    JuhuaImage.image = [UIImage imageNamed:@"CenterJuhua"];
    [self addSubview:JuhuaImage];
    
    MoneyLable = [[UILabel alloc]init];
    
    MoneyLable.frame = CGRectMake(170*ScaleX,45*ScaleX,150*ScaleX,20*ScaleX);
        MoneyLable.textColor = [UIColor whiteColor];
    MoneyLable.font = [UIFont systemFontOfSize:15*ScaleX];
    MoneyLable.text = @"账户余额:10000000";
    [self addSubview:MoneyLable];
    
    
    NSArray *array = @[@"充值",@"提现",@"个人报表",@"账变纪录"];
    for (int i = 0; i<4; i++)
    {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(UIScreenWIDTH/4*i,100*ScaleX,UIScreenWIDTH/4,100*ScaleX);
        bt.tag = 100+i;
        [bt addTarget:self action:@selector(Clickbtpush:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
        UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(UIScreenWIDTH/16, 0, UIScreenWIDTH/8,UIScreenWIDTH/8)];
        image1.layer.cornerRadius = UIScreenWIDTH/16;
        image1.layer.masksToBounds = YES;
        image1.image = [UIImage imageNamed:[NSString stringWithFormat:@"CashImage%d",i+1]];
        [bt addSubview:image1];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,UIScreenWIDTH/8+5*ScaleX,UIScreenWIDTH/4,20*ScaleX)];
        lable.font = [UIFont systemFontOfSize:15*ScaleX];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = array[i];
        lable.textColor = [UIColor whiteColor];
        [bt addSubview:lable];
    }
    
    
    UIImageView *SignImage = [[UIImageView alloc]initWithFrame:CGRectMake((UIScreenWIDTH/4-15*ScaleX)/2, 170*ScaleX, 15*ScaleX, 15*ScaleX)];
    SignImage.image = [UIImage imageNamed:@"CashImage9"];
    [self addSubview:SignImage];
    
    
    NSArray *array1 = @[@"第三方",@"公司入款",@"微信入款",@"支付宝"];
    for (int i = 0; i<4; i++)
    {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(UIScreenWIDTH/4*i,185*ScaleX,UIScreenWIDTH/4,40*ScaleY);
        [bt setTitle:array1[i] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bt setTitleColor:GETCOLOR(@"blr") forState:UIControlStateSelected];
        [bt setBackgroundColor:[UIColor whiteColor]];
        bt.tag = 200+i;
        if (i==0)
        {
        bt.selected = YES;
        bt.backgroundColor =DTAISCOLORE(203, 203, 203, 1);
        }
        [bt addTarget:self action:@selector(Clickbtupdatas:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
    }

    [self updatas:nil];
}
- (void)Clickbtpush:(UIButton *)bt
{
    if (_blcokPushNub)
    {
        _blcokPushNub(bt.tag-100);
    }
}
- (void)updatas:(NSArray *)datas
{
    [headImagebt setBackgroundImage:[UIImage imageNamed:@"CenterTitleView"] forState:UIControlStateNormal];
}

- (void)Clickbtupdatas:(UIButton *)bt
{
    NSInteger nub;
    if (bt==nil) nub = 200;else nub = bt.tag;
    if (nub!=BtNub)
    {
        UIButton *but1 = [self viewWithTag:200+BtNub];
        but1.backgroundColor = [UIColor whiteColor];
        but1.selected = NO;
        BtNub = nub-200;
        UIButton *but2 = [self viewWithTag:200+BtNub];
        but2.selected = YES;
        but2.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
    }
    if (_blockUpdataTableView)
    {
        _blockUpdataTableView(BtNub);
    }
    
}

//- (UIView *)Return:(NSInteger)nub
//{
//    if (nub==1) return Oneview;
//    if (nub==2) return Twoview;
//    if (nub==3) return Threeview;
//    return nil;
//}

@end
