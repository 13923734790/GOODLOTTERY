//
//  TwoFaceBT.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TwoFaceBT.h"

@implementation TwoFaceBT

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setSubButton];
    }
    return self;
}

- (void)setSubButton
{
    
    _titleBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [_titleBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _titleBT.userInteractionEnabled = NO;
    _titleBT.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:_titleBT];
    
    _OddBT = [UIButton buttonWithType:UIButtonTypeCustom];
     _OddBT.userInteractionEnabled = NO;
    _OddBT.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [_OddBT setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self addSubview:_OddBT];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    _titleBT.frame = CGRectMake(0, 5*ScaleY,CGRectGetWidth(self.frame),(CGRectGetHeight(self.frame)-5*ScaleY)/2);
    _OddBT.frame = CGRectMake(0, 5*ScaleY+(CGRectGetHeight(self.frame)-5*ScaleY)/2,CGRectGetWidth(self.frame),(CGRectGetHeight(self.frame)-5*ScaleY)/2);
    
}
@end
