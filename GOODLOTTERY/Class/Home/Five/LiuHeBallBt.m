//
//  LiuHeBallBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeBallBt.h"

@implementation LiuHeBallBt

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
    [_titleBT setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
//    为button文字设置阴影位置
    _titleBT.titleLabel.layer.shadowOffset = CGSizeMake(2,1);
    _titleBT.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    [_titleBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_titleBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     _titleBT.userInteractionEnabled = NO;
    [self addSubview:_titleBT];
    
    
    _OddBT = [UIButton buttonWithType:UIButtonTypeCustom];
    _OddBT.titleLabel.adjustsFontSizeToFitWidth = YES;
    _OddBT.titleLabel.font = [UIFont boldSystemFontOfSize:10*ScaleX];
    
    [_OddBT setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    //为button文字设置阴影位置
    _OddBT.titleLabel.layer.shadowOffset = CGSizeMake(2,1);
    _OddBT.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    
    [_OddBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_OddBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _OddBT.userInteractionEnabled = NO;
    
    [self addSubview:_OddBT];

    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //这里没有super  会有错误
    
    //1.414 = 2开根。
    _titleBT.frame=  CGRectMake(CGRectGetWidth(self.frame)/2*(1-1/1.41),CGRectGetWidth(self.frame)/2*(1-1/1.41),CGRectGetWidth(self.frame)/1.41,CGRectGetWidth(self.frame)/1.41*(3.0/4));
    _OddBT.frame = CGRectMake(CGRectGetWidth(self.frame)/2*(1-1/1.41),CGRectGetWidth(self.frame)/2*(1-1/1.41)+CGRectGetWidth(self.frame)/1.41*(3.0/4),CGRectGetWidth(self.frame)/1.41,CGRectGetWidth(self.frame)/1.41/4);
    
}
-(void)setBallTitle:(NSString *)Nubstring
{
    [self.titleBT setTitle:Nubstring forState:UIControlStateNormal];
    [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
}
-(void)setThreeBallTitle:(NSString *)Nubstring
{
    
    [self.titleBT setTitle:Nubstring forState:UIControlStateNormal];
   //  固定颜色的区分
   NSArray * ColorArry = @[@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3"];
    
    NSInteger index = [Nubstring integerValue]-1;
    if ([ColorArry[index] isEqualToString:@"1"])
    {
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    if ([ColorArry[index] isEqualToString:@"2"]) {
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    if ([ColorArry[index] isEqualToString:@"3"]) {
        
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    

}

@end
