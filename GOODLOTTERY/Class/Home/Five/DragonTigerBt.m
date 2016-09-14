//
//  DragonTigerBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DragonTigerBt.h"

@implementation DragonTigerBt


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
        [self setSubButton];
    }
    return self;
}

- (void)setSubButton
{
    
    _BallBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _BallBt.userInteractionEnabled = NO;
    _BallBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:_BallBt];
    
    
    _OddBT = [UIButton buttonWithType:UIButtonTypeCustom];
    _OddBT.userInteractionEnabled = NO;
    _OddBT.titleLabel.font = [UIFont systemFontOfSize:12*ScaleY];
    [_OddBT setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self addSubview:_OddBT];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    if (_Kind==99)
    {
        _BallBt.frame = CGRectMake(CGRectGetWidth(self.frame)/5,(CGRectGetHeight(self.frame)-CGRectGetWidth(self.frame)*2/5)/2,CGRectGetWidth(self.frame)*2/5,CGRectGetWidth(self.frame)*2/5);
        
        
        _OddBT.frame = CGRectMake(CGRectGetWidth(self.frame)*3/5, (CGRectGetHeight(self.frame)-CGRectGetWidth(self.frame)*2/5)/2,CGRectGetWidth(self.frame)*2/5,CGRectGetWidth(self.frame)*2/5);
        
    }
    else if (_Kind==100)
    {
        _BallBt.frame = CGRectMake(CGRectGetWidth(self.frame)/4,CGRectGetWidth(self.frame)/4,CGRectGetWidth(self.frame)/2,CGRectGetWidth(self.frame)/2);
        
        _OddBT.frame = CGRectMake(0,CGRectGetWidth(self.frame)*3/4,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)-CGRectGetWidth(self.frame)*3/4);
    }
    
}


@end
