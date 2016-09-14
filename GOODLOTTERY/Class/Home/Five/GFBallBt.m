//
//  GFBallBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFBallBt.h"

@implementation GFBallBt

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
    _titleBT.titleLabel.font = [UIFont boldSystemFontOfSize:20*ScaleX];
//    [_titleBT setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
//    //    为button文字设置阴影位置
//    _titleBT.titleLabel.layer.shadowOffset = CGSizeMake(2,1);
//    _titleBT.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    
//    [_titleBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_titleBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_titleBT setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"PourBall%ld")] forState:UIControlStateNormal];
    [_titleBT setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"SeletedBall%ld")] forState:UIControlStateSelected];
    
    _titleBT.userInteractionEnabled = NO;
    [self addSubview:_titleBT];
    
    
    _coldHotLable = [[UILabel alloc]init];
    _coldHotLable.font = [UIFont boldSystemFontOfSize:10*ScaleX];
    _coldHotLable.textAlignment = NSTextAlignmentRight;
    _coldHotLable.textColor = [UIColor yellowColor];
    //为button文字设置阴影位置
    [self addSubview:_coldHotLable];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    //1.414 = 2开根。
    _titleBT.frame=  CGRectMake(10*ScaleX,10*ScaleX,CGRectGetWidth(self.frame)-20*ScaleX,CGRectGetHeight(self.frame)-20*ScaleX);
    _coldHotLable.frame = CGRectMake(0,0,CGRectGetWidth(self.frame),10*ScaleX);
    
}

@end
