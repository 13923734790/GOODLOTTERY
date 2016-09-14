//
//  CashValueHeard.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashValueHeard.h"

@implementation CashValueHeard
{
    UIButton *headImagebt;
    UILabel *NameLable;
    UILabel *MoneyLable;
    UIImageView *JuhuaImage;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self setAllView];
        [self updatas:nil];
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
    
    NameLable = [[UILabel alloc]initWithFrame:CGRectMake(160*ScaleX,20*ScaleX,150*ScaleX,20*ScaleX)];
    NameLable.textColor = [UIColor whiteColor];
    NameLable.font = [UIFont systemFontOfSize:15*ScaleX];
    NameLable.text = @"Comtemplation";
    [self addSubview:NameLable];
    JuhuaImage = [[UIImageView alloc]initWithFrame:CGRectMake(320*ScaleX,20*ScaleX,20*ScaleX, 20*ScaleX)];
    JuhuaImage.image = [UIImage imageNamed:@"CenterJuhua"];
    [self addSubview:JuhuaImage];
    
    MoneyLable = [[UILabel alloc]initWithFrame:CGRectMake(170*ScaleX,45*ScaleX,150*ScaleX,20*ScaleX)];
    MoneyLable.textColor = [UIColor whiteColor];
    MoneyLable.font = [UIFont systemFontOfSize:15*ScaleX];
    MoneyLable.text = @"账户余额";
    [self addSubview:MoneyLable];
    
    
    NSArray *array = @[@"充值",@"提现",@"个人报表",@"账变纪录"];
    for (int i = 0; i<4; i++)
    {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(UIScreenWIDTH/4*i,100*ScaleX,UIScreenWIDTH/4,100*ScaleX);
        bt.tag = 100+i;
        [bt addTarget:self action:@selector(Clickbt:) forControlEvents:UIControlEventTouchUpInside];
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
//        UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(42.5*ScaleX,85*ScaleY, 15*ScaleX, 15*ScaleX)];
//        image2.image = [UIImage imageNamed:@"CashImage9"];
//        [bt addSubview:image2];
    }
}
- (void)Clickbt:(UIButton *)bt
{
    if (_blcokNub)
    {
       _blcokNub(bt.tag);
    }
    
}
- (void)updatas:(NSArray *)datas
{
//        [leftbutton setBackgroundImage:[UIImage imageNamed:@"CenterLeft"] forState:UIControlStateNormal];
//        [rightbutton setBackgroundImage:[UIImage imageNamed:@"CenterRight"] forState:UIControlStateNormal];
//        [mailbox setBackgroundImage:[UIImage imageNamed:@"CenterMail"] forState:UIControlStateNormal];
//        [_heardBt setBackgroundImage:[UIImage imageNamed:@"CenterTitleView"] forState:UIControlStateNormal];
//        for (int i = 0; i<16; i++)
//        {
//            UIButton *maxbt = [ButtonView viewWithTag:100+i];
//            UIImageView *imageV = [maxbt viewWithTag:5];
//            UILabel *Lable = [maxbt viewWithTag:9];
//            imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"Center%d",i+1]];
//            Lable.text = Titlearray[i];
//        }
//        namelable.text = @"contemplation";
//        moneylable.text = @"100000元";
//    }
    [headImagebt setBackgroundImage:[UIImage imageNamed:@"CenterTitleView"] forState:UIControlStateNormal];

}
@end
