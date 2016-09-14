//
//  ConfirmHeard.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ConfirmHeard.h"
#import "FPTimeView.h"

@implementation ConfirmHeard
{
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *CutLine;
    UILabel *leftlable;
    UILabel *rightlable;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self)
    {
    CutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,70*ScaleY-1,UIScreenWIDTH, 1)];
    [self addSubview:CutLine];
        
    FPTimeView *timeView = [[FPTimeView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH, 35*ScaleY)];
    [self addSubview:timeView];
        
      
       
    _rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBt.frame = CGRectMake(0,37.5*ScaleY,UIScreenWIDTH/2,30*ScaleY);
    _rightBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    _rightBt.titleLabel.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    _rightBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _rightBt.titleEdgeInsets = UIEdgeInsetsMake(0,50*ScaleX,0,-10*ScaleX);
    _rightBt.imageEdgeInsets = UIEdgeInsetsMake(0,20*ScaleX,0,-(UIScreenWIDTH/2-40*ScaleX));
    [_rightBt  setTitle:@"增加手动投注" forState:UIControlStateNormal];
        
        
    _leftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBt.frame = CGRectMake(UIScreenWIDTH/2,37.5*ScaleY,UIScreenWIDTH/2,30*ScaleY);
        
    _leftBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    _leftBt.titleLabel.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    _leftBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _leftBt.titleEdgeInsets = UIEdgeInsetsMake(0,50*ScaleX,0,-10*ScaleX);
    _leftBt.imageEdgeInsets = UIEdgeInsetsMake(0,20*ScaleX,0,-(UIScreenWIDTH/2-40*ScaleX));
    [_leftBt  setTitle:@"增加随机投注" forState:UIControlStateNormal];
        
    

    [self addSubview:_rightBt];
    [self addSubview:_leftBt];
        
    }
    
    [self updataImageAndTxtColor];
    return self;
}

- (void)updataImageAndTxtColor
{
    
    [_rightBt  setImage:[UIImage imageNamed:IMAGEFILE(@"AddBet%ld")] forState:UIControlStateNormal];
    [_leftBt setImage:[UIImage imageNamed:IMAGEFILE(@"AddBet%ld")] forState:UIControlStateNormal];
    
    [_rightBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    [_leftBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    CutLine.image = [UIImage imageNamed:IMAGEFILE(@"CatchCutline%ld")];
}
@end
