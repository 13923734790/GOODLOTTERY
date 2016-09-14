//
//  OfficialTabbarOne.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OfficialTabbarOne.h"
#import "OddAndNubModel.h"

@implementation OfficialTabbarOne
{
    UIButton *cutButton;
    UIButton *addButton;
    OddAndNubModel *model;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        model = [OddAndNubModel shareOddAndNubModel];
        [self setBallView];
    }
    return self;
}

-(void)setBallView
{
        {
        _typeBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _typeBt.frame = CGRectMake(5*ScaleX,5*ScaleY,(UIScreenWIDTH/2-((5+20)*ScaleX))/4,30*ScaleY);
        
        _typeBt.titleLabel.font = [UIFont boldSystemFontOfSize:13*ScaleY];
        _typeBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _typeBt.titleEdgeInsets = UIEdgeInsetsMake(0,-5,0,15);
        _typeBt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH/2-((5+20)*ScaleX))/4-20,0, -((UIScreenWIDTH/2-((5+20)*ScaleX))/4-15));
        [_typeBt setImage:[UIImage imageNamed:@"MoneyType"] forState:UIControlStateNormal];
        
        [_typeBt setTitle:@"元" forState:UIControlStateNormal];
        [_typeBt addTarget:self action:@selector(ClickMoneyType:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_typeBt];
        
        
        
        
        _typeTitle = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX+(UIScreenWIDTH/2-((5+20)*ScaleX))/4, 5*ScaleY, (UIScreenWIDTH/2-((5+20)*ScaleX))/4, 30*ScaleY)];
        _typeTitle.textAlignment = NSTextAlignmentCenter;
        _typeTitle.font = [UIFont systemFontOfSize:13*ScaleY];
        _typeTitle.text = @"模式";
        [self addSubview:_typeTitle];
    }
    
    
    _OddField = [[NumbersCustomsField alloc]init];
    _OddField.frame = CGRectMake(5*ScaleX+_typeBt.frame.size.width*2, 5*ScaleY, (UIScreenWIDTH/2-((5+20)*ScaleX))/4+10,30*ScaleY);
    _OddField.FieldType = PureDigitType;
    _OddField.keyboardType = UIKeyboardTypeNumberPad;
    _OddField.BitNub = 3;
    _OddField.text = @"1";
    _OddField.textAlignment = NSTextAlignmentCenter;
    [_OddField addTarget:self action:@selector(ClickOdd:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_OddField];
    
    
    
    
    
    _OddTitle = [[UILabel alloc]initWithFrame:CGRectMake(15*ScaleX+_typeBt.frame.size.width*3, 5*ScaleY, _typeBt.frame.size.width*2/3, 30*ScaleY)];
    _OddTitle.textAlignment = NSTextAlignmentCenter;
    _OddTitle.font = [UIFont systemFontOfSize:13*ScaleY];
    _OddTitle.text = @"倍";
    [self addSubview:_OddTitle];
    
    
    
    _SliderLeftLable = [[UILabel alloc]initWithFrame:CGRectMake(15*ScaleX+_typeBt.frame.size.width*3+_typeBt.frame.size.width*2/3, 5*ScaleY, _typeBt.frame.size.width, 30*ScaleY)];
    _SliderLeftLable.font = [UIFont systemFontOfSize:10*ScaleY];
    _SliderLeftLable.text = @"11.5%";
    _SliderLeftLable.textAlignment = NSTextAlignmentRight;
    [self addSubview:_SliderLeftLable];
    
    
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(15*ScaleX+_typeBt.frame.size.width*4+_typeBt.frame.size.width*2/3+20*ScaleY, 12.5*ScaleY,UIScreenWIDTH-(15*ScaleX+_typeBt.frame.size.width*4+_typeBt.frame.size.width*2/3+15*ScaleY+5*ScaleY+5*ScaleY+15*ScaleY+_typeBt.frame.size.width*2/3), 15*ScaleY)];
    
    [_slider addTarget:self action:@selector(sliderBtClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_slider];
    
    
    cutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cutButton.frame = CGRectMake(15*ScaleX+_typeBt.frame.size.width*4+_typeBt.frame.size.width*2/3, 12.5*ScaleY,15*ScaleY, 15*ScaleY);
    
    cutButton.layer.cornerRadius = 15*ScaleY/2;
    cutButton.layer.masksToBounds = YES;
    [cutButton addTarget:self action:@selector(CutBt:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cutButton];
    
    addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(15*ScaleX+_typeBt.frame.size.width*4+_typeBt.frame.size.width*2/3+20*ScaleY+_slider.frame.size.width+5*ScaleY, 12.5*ScaleY,15*ScaleY, 15*ScaleY);
    addButton.layer.cornerRadius = 15*ScaleY/2;
    addButton.layer.masksToBounds = YES;
    [addButton addTarget:self action:@selector(AddClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addButton];
    
    
    _SliderRightLable = [[UILabel alloc]initWithFrame:CGRectMake(15*ScaleX+_typeBt.frame.size.width*4+_typeBt.frame.size.width*2/3+20*ScaleY+_slider.frame.size.width+20*ScaleY, 5*ScaleY, _typeBt.frame.size.width*2/3, 30*ScaleY)];
    _SliderRightLable.font = [UIFont systemFontOfSize:10*ScaleY];
    _SliderRightLable.textAlignment = NSTextAlignmentCenter;
    _SliderRightLable.text = @"8.5";
    [self addSubview:_SliderRightLable];

    
    [self UpdataImageTextColor];

}

- (void)ClickMoneyType:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y-30*4, rect.size.width,30*4)];
    pullmenu.DatasArray = @[@"元",@"角",@"分",@"厘"];
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
    
}

- (void)ClickOdd:(NumbersCustomsField *)Field
{
    model.Odd = [Field.text floatValue];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:Field.text forKey:@"Odd"];
    NSNotification *notion = [NSNotification notificationWithName:@"ChangeOdd" object:nil userInfo:dic];
    [[NSNotificationCenter defaultCenter] postNotification:notion];
}

- (void)sliderBtClick:(UISlider *)sender
{
  
    _SliderLeftLable.text = [NSString stringWithFormat:@"%.1lf%c",sender.value,'%'];
//    if (_BlcokOdd)
//    {
//        _BlcokOdd(_OddLable.text);
//    }
}

- (void)AddClick:(UIButton *)sender
{
    _slider.value = _slider.value+0.1;
    _SliderLeftLable.text = [NSString stringWithFormat:@"%.1lf%c",_slider.value,'%'];
//    if (_BlcokOdd)
//    {
//        _BlcokOdd(_OddLable.text);
//    }
}
- (void)CutBt:(UIButton *)sender
{
    _slider.value = _slider.value-0.1;
    _SliderLeftLable.text = [NSString stringWithFormat:@"%.1lf%c",_slider.value,'%'];
//    if (_BlcokOdd)
//    {
//        _BlcokOdd(_OddLable.text);
//    }
}



- (void)UpdataImageTextColor
{
    
    UIColor *CurrentColor = GETCOLOR(@"wt2");
    _SliderRightLable.textColor = CurrentColor;
    _SliderLeftLable.textColor = CurrentColor;
    _typeTitle.textColor = CurrentColor;
    _OddTitle.textColor = CurrentColor;
    [_typeBt setTitleColor:CurrentColor forState:UIControlStateNormal];
    _OddField.textColor = CurrentColor;
    
    
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGEFILE(@"customBackOne%ld")]];
    [_typeBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"TypeBack%ld")] forState:UIControlStateNormal];
    [_OddField setBackground:[UIImage imageNamed:IMAGEFILE(@"OddBack%ld")]];
    
    [cutButton setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CutBt%ld")] forState:UIControlStateNormal];
    
    [addButton setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"AddBt%ld")] forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:IMAGEFILE(@"Slider%ld")] forState:UIControlStateNormal];
    
    
    
}
@end
