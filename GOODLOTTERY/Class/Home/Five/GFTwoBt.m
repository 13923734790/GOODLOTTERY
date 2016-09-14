//
//  GFTwoBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFTwoBt.h"

@implementation GFTwoBt

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
    _titleBT.titleLabel.font = [UIFont boldSystemFontOfSize:15*ScaleX];
    //    [_titleBT setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    //    为button文字设置阴影位置
    //    _titleBT.titleLabel.layer.shadowOffset = CGSizeMake(2,1);
    //    _titleBT.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //    [_titleBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_titleBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_titleBT setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"ReportBack%ld")] forState:UIControlStateNormal];
    [_titleBT setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"ChangePass%ld")] forState:UIControlStateSelected];
    
    _titleBT.userInteractionEnabled = NO;
    [self addSubview:_titleBT];
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    //1.414 = 2开根。
    _titleBT.frame=  CGRectMake(5*ScaleX,5*ScaleX,CGRectGetWidth(self.frame)-10*ScaleX,CGRectGetHeight(self.frame)-10*ScaleX);
    
}


@end
