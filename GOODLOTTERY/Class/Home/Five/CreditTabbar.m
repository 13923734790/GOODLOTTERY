//
//  CreditTabbar.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CreditTabbar.h"

@implementation CreditTabbar

//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    _sliderBt.minimumValue = 0;
//    _sliderBt.maximumValue =7;
//    _sliderBt.value = 0;
//    [_rulesBt setTitle:@"游戏规则" forState:UIControlStateNormal];
//    _rulesBt.backgroundColor = DTAISCOLORE(255, 255, 255, 0.5);
//    _rulesBt.layer.cornerRadius = 2;
//    _rulesBt.layer.masksToBounds = YES;
//    _OddLable.font = [UIFont systemFontOfSize:13*ScaleY];
//    _OddLable.text = @"0%";
//    [self UpdataImageTextColor];
//}

//+(CreditTabbar *)shareCreditTabbar
//{
//    NSBundle *buddle = [NSBundle mainBundle];
//    NSArray *array = [buddle loadNibNamed:NSStringFromClass(self) owner:nil options:nil ];
//    return [array lastObject];
//}
//- (instancetype)initTabbarWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if(self)
//    {
//        UIView *view = [CreditTabbar shareCreditTabbar];
//        if (view !=nil)
//        {
//            view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame),CGRectGetHeight(self.frame));
//            [self addSubview:view];
//        }
//        
//    }
//    return self;
//}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setTabbarView];
    }
    return self;
}


-(void)setTabbarView
{
    _rulesBt = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _rulesBt.frame = CGRectMake(10*ScaleX,7.5*ScaleY,70*ScaleX,25*ScaleY);
    
    [_rulesBt setTitle:@"游戏规则" forState:UIControlStateNormal];
    _rulesBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    _rulesBt.layer.cornerRadius = 2;
    _rulesBt.layer.masksToBounds = YES;
    [_rulesBt addTarget:self action:@selector(ClickRulest) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rulesBt];
    
    
    _sliderBt = [[UISlider alloc]init];
    _sliderBt.frame = CGRectMake(UIScreenWIDTH/2+30*ScaleX,7.5*ScaleY,UIScreenWIDTH/2-70*ScaleX,25*ScaleY);
    _sliderBt.minimumValue = 0;
    _sliderBt.maximumValue =7;
    _sliderBt.value = 0;
    [_sliderBt addTarget:self action:@selector(sliderBtClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_sliderBt];
    
    
    
    _OddLable = [[UILabel alloc]init];
    _OddLable.frame = CGRectMake(UIScreenWIDTH/2-35*ScaleX,10*ScaleY,35*ScaleX,20*ScaleY);
    _OddLable.font = [UIFont systemFontOfSize:13*ScaleY];
    _OddLable.text = @"0%";
    [self addSubview:_OddLable];
    
    
    
    _AddBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _AddBt.frame = CGRectMake(UIScreenWIDTH/2, 10*ScaleY, 20*ScaleY,20*ScaleY);
    [_AddBt addTarget:self action:@selector(AddClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_AddBt];
    
    _CutBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _CutBt.frame = CGRectMake(UIScreenWIDTH-30*ScaleX,10*ScaleY,20*ScaleY,20*ScaleY);
    [_CutBt addTarget:self action:@selector(CutBt:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_CutBt];
    
    
    [self UpdataImageTextColor];
}

- (void)ClickRulest
{
//    PromptBox *promptbox = [[PromptBox alloc]initWithFrame:CGRectMake(0, 0,345*ScaleX,345*ScaleY)];
//    promptbox.appearance.BackgroundColor = DTAISCOLORE(1, 1, 1, 0.8);
//    promptbox.appearance.BorderWithl = 3.0;
//    promptbox.appearance.BorderColor = [UIColor orangeColor];
//    promptbox.appearance.textColor = [UIColor whiteColor];
//    promptbox.appearance.font = [UIFont systemFontOfSize:15*ScaleY];
//    promptbox.appearance.textString = @"介绍:本文介绍的CoreData不在AppDelegate中创建,在程序中新建工程使用,即创建本地数据库,缓存数据,隔几个小时后更新数据1. 创建CoreData:本人命名为ZHZMOdel,插入一张表:News:如图备注:创建方式:command+N->ios/coredate->DataModel";
//    [promptbox show];
    
}


- (void)sliderBtClick:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _OddLable.text = [NSString stringWithFormat:@"%.1lf%c",slider.value,'%'];
    if (_BlcokOdd)
    {
        _BlcokOdd(_OddLable.text);
    }
}

- (void)AddClick:(UIButton *)sender
{
    _sliderBt.value = _sliderBt.value+0.1;
    _OddLable.text = [NSString stringWithFormat:@"%.1lf%c",_sliderBt.value,'%'];
    if (_BlcokOdd)
    {
        _BlcokOdd(_OddLable.text);
    }
}
- (void)CutBt:(UIButton *)sender
{
    _sliderBt.value = _sliderBt.value-0.1;
    _OddLable.text = [NSString stringWithFormat:@"%.1lf%c",_sliderBt.value,'%'];
    if (_BlcokOdd)
    {
        _BlcokOdd(_OddLable.text);
    }
}



- (void)UpdataImageTextColor
{
    
      self.backgroundColor = [UIColor colorWithPatternImage:[CommonDatas createImageWithColor:GETCOLOR(@"b0.5w")]];
     [_rulesBt setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateNormal];
      UIColor *CurrentColor = GETCOLOR(@"wt2");
     _OddLable.textColor = CurrentColor;
     [_rulesBt setTitleColor:CurrentColor forState:UIControlStateNormal];
    
//    [_OddField setBackground:[UIImage imageNamed:IMAGEFILE(@"OddBack%ld")]];
//    _bottomTwoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGEFILE(@"customBackTwo%ld")]];
//    [_leftbutton setBackgroundImage:[UIImage imageNamed:@"delete1"] forState:UIControlStateNormal];
//    [_rightbutton setBackgroundImage:[UIImage imageNamed:@"Determine1"] forState:UIControlStateNormal];
    
    
    [_CutBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CutBt%ld")] forState:UIControlStateNormal];
    [_AddBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"AddBt%ld")] forState:UIControlStateNormal];
    [_sliderBt setThumbImage:[UIImage imageNamed:IMAGEFILE(@"Slider%ld")] forState:UIControlStateNormal];
    
}
@end
