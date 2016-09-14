//
//  LiuHeSeBoView.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeSeBoView.h"

@implementation LiuHeSeBoView
{
    UIButton *titleBt;
    UIButton *OddBt;
    UIView *ballView;
    UIView *selectedView;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setSeboView];
    }
    return self;
}

-(void)setSeboView
{
    titleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBt.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame)*1.2, CGRectGetHeight(self.frame));
    titleBt.userInteractionEnabled = NO;
    [titleBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:titleBt];
    
    
    OddBt = [UIButton buttonWithType:UIButtonTypeCustom];
    OddBt.frame = CGRectMake(60*ScaleX, 0, CGRectGetHeight(self.frame)*1.2, CGRectGetHeight(self.frame));
    OddBt.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
    OddBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [OddBt setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    OddBt.userInteractionEnabled = NO;
    [self addSubview:OddBt];
    
    
    ballView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetHeight(self.frame)*2.4, 0, CGRectGetWidth(self.frame)-CGRectGetHeight(self.frame)*2.4, CGRectGetHeight(self.frame))];
    ballView.backgroundColor = DTAISCOLORE(255, 255, 255, 0.5);
    [self addSubview:ballView];
    
    selectedView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetHeight(self.frame)*1.2, 0, CGRectGetWidth(self.frame)-CGRectGetHeight(self.frame)*1.2, CGRectGetHeight(self.frame))];
    selectedView.backgroundColor = DTAISCOLORE(22, 166, 47, 0.3);
    selectedView.hidden = YES;
    [self addSubview:selectedView];
    
    UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicktop:)];
    
    [self addGestureRecognizer:top];
    
    
    
}
-(void)clicktop:(UITapGestureRecognizer *)top
{
    selectedView.hidden = !selectedView.hidden;
}

-(void)setTitleString:(NSString *)TitleString
{
    _TitleString = TitleString;
    [titleBt setTitle:_TitleString forState:UIControlStateNormal];
}
-(void)setOddString:(NSString *)OddString
{
    _OddString = OddString;
    [OddBt setTitle:OddString forState:UIControlStateNormal];
}
-(void)setSeBoColor:(UIColor *)SeBoColor
{
    _SeBoColor = SeBoColor;
    titleBt.backgroundColor = _SeBoColor;
}

-(void)setBallArray:(NSArray *)BallArray
{
    _BallArray = BallArray;
    
    UIColor *currentColor = [UIColor grayColor];
    if (_SeBoColor)
    {
        currentColor = _SeBoColor;
    }
    for (int i = 0; i<_BallArray.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(1*ScaleX+(1*ScaleX+CGRectGetHeight(self.frame)*2/5)*i,CGRectGetHeight(self.frame)*3/10,CGRectGetHeight(self.frame)*2/5, CGRectGetHeight(self.frame)*2/5);
        button.userInteractionEnabled = NO;
        button.titleLabel.font = [UIFont systemFontOfSize:10*ScaleY];
        button.layer.cornerRadius = CGRectGetHeight(self.frame)*1/5;
        button.backgroundColor = currentColor;
        [button setTitle:_BallArray[i] forState:UIControlStateNormal];
        [ballView addSubview:button];
    }
}

@end
