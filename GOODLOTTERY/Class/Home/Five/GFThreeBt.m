//
//  GFThreeBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFThreeBt.h"

@implementation GFThreeBt
{
    UILabel *titleLable;
    UILabel *subTitleLable;
    UILabel *Oddlable;
}

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
    _titleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleBt.titleLabel.font = [UIFont boldSystemFontOfSize:15*ScaleX];
    //    [_titleBT setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    //    为button文字设置阴影位置
    //    _titleBT.titleLabel.layer.shadowOffset = CGSizeMake(2,1);
    //    _titleBT.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //    [_titleBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_titleBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_titleBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"ReportBack%ld")] forState:UIControlStateNormal];
    [_titleBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"ChangePass%ld")] forState:UIControlStateSelected];
    
    _titleBt.userInteractionEnabled = NO;
    [self addSubview:_titleBt];
    
    
    titleLable = [[UILabel alloc]init];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:15*ScaleY];
    [_titleBt addSubview:titleLable];
    
    subTitleLable= [[UILabel alloc]init];
    subTitleLable.textColor = [UIColor whiteColor];
    subTitleLable.textAlignment = NSTextAlignmentCenter;
    subTitleLable.font = [UIFont systemFontOfSize:15*ScaleY];
    [_titleBt addSubview:subTitleLable];

    Oddlable= [[UILabel alloc]init];
    Oddlable.textColor = [UIColor orangeColor];
    Oddlable.textAlignment = NSTextAlignmentCenter;
    Oddlable.font = [UIFont systemFontOfSize:15*ScaleY];
    [self addSubview:Oddlable];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    //1.414 = 2开根。
    _titleBt.frame=  CGRectMake(0,0,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)*3/4);
    titleLable.frame = CGRectMake(0,0,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)*3/8);
    subTitleLable.frame = CGRectMake(0,CGRectGetHeight(self.frame)*3/8,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)*3/8);
    Oddlable.frame = CGRectMake(0,CGRectGetHeight(self.frame)*3/4,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)/4);
}

-(void)setOddString:(NSString *)oddString
{
    _oddString = oddString;
    Oddlable.text = _oddString;
}
-(void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    titleLable.text = _titleString;
}
-(void)setSubtitleString:(NSString *)SubtitleString
{
    _SubtitleString = SubtitleString;
    subTitleLable.text = _SubtitleString;
}
@end
