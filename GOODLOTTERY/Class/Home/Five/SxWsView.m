//
//  SxWsView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SxWsView.h"
#import "colorBallBt.h"

@implementation SxWsView
{
    UIButton *titleBt;
    UIButton *OddBt;
    UIButton *ChooseBt;
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
    titleBt.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame));
    titleBt.userInteractionEnabled = NO;
    titleBt.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
    [titleBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:titleBt];
    
    
    OddBt = [UIButton buttonWithType:UIButtonTypeCustom];
    OddBt.frame = CGRectMake(CGRectGetHeight(self.frame)+1*ScaleX, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame));
    OddBt.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
    OddBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [OddBt setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    OddBt.userInteractionEnabled = NO;
    [self addSubview:OddBt];
    
    
    ballView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetHeight(self.frame)*2+2*ScaleX, 0, CGRectGetWidth(self.frame)-CGRectGetHeight(self.frame)*3-3*ScaleX, CGRectGetHeight(self.frame))];
    ballView.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
    [self addSubview:ballView];
    
    
    ChooseBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ChooseBt.frame = CGRectMake(CGRectGetWidth(self.frame)-CGRectGetHeight(self.frame), 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame));
    ChooseBt.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
    ChooseBt.userInteractionEnabled = NO;
    [self addSubview:ChooseBt];
    
    
    selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
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
-(void)setChooseImage:(NSString *)chooseImage
{
    _chooseImage = chooseImage;
    [ChooseBt setImage:[UIImage imageNamed:_chooseImage] forState:UIControlStateNormal];
}
-(void)setBallArray:(NSArray *)BallArray
{
    _BallArray = BallArray;
    
    for (int i = 0; i<_BallArray.count; i++)
    {
        colorBallBt *button = [colorBallBt buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(1*ScaleX+(1*ScaleX+CGRectGetHeight(self.frame)*2/5)*i,CGRectGetHeight(self.frame)*3/10,CGRectGetHeight(self.frame)*2/5, CGRectGetHeight(self.frame)*2/5);
        button.userInteractionEnabled = NO;
        button.titleLabel.font = [UIFont systemFontOfSize:10*ScaleY];
        [button setBallTitle:_BallArray[i]];
        [ballView addSubview:button];
    }
}
@end
