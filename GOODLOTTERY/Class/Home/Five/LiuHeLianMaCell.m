//
//  LiuHeLianMaCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeLianMaCell.h"
#import "LiuHeLianMaBt.h"

@implementation LiuHeLianMaCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];
    }
    return self;
}

-(void)setButtonView
{
    for (int i = 0; i<_FaceNub; i++)
    {
        LiuHeLianMaBt *optionsBt = [LiuHeLianMaBt buttonWithType:UIButtonTypeCustom];
        optionsBt.frame = CGRectMake(5*ScaleX+((UIScreenWIDTH-10*ScaleX-(_WithFaceNub-1)*ScaleX)/_WithFaceNub+1*ScaleX)*(i%_WithFaceNub),(((UIScreenWIDTH-10*ScaleX-(_WithFaceNub-1)*ScaleX)/_WithFaceNub)*_heightOddwith+1*ScaleY)*(i/_WithFaceNub),(UIScreenWIDTH-10*ScaleX-(_WithFaceNub-1)*ScaleX)/_WithFaceNub,((UIScreenWIDTH-10*ScaleX-(_WithFaceNub-1)*ScaleX)/_WithFaceNub)*_heightOddwith);
        optionsBt.tag = 100+i;
        
        [optionsBt addTarget:self action:@selector(ClickoptionsBt:) forControlEvents:UIControlEventTouchUpInside];
        [optionsBt setBackgroundImage:[hybridTool createImageWithColor:GETCOLOR(@"b0.3w")] forState:UIControlStateNormal];
        [optionsBt setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
        [self.contentView addSubview:optionsBt];
        [optionsBt.titleBT setBallTitle:[NSString stringWithFormat:@"%d",i+1]];
        
        [optionsBt.OddBT setTitle:@"22.22" forState:UIControlStateNormal];
        
    }
}

-(void)ClickoptionsBt:(UIButton *)Bt
{
    Bt.selected = !Bt.selected;
}

-(void)setOddstring:(NSString *)Odd
{
    for (int i = 0; i<_FaceNub; i++)
    {
        LiuHeLianMaBt *button = [self viewWithTag:100+i];
        [button.OddBT setTitle:Odd forState:UIControlStateNormal];
    }
}
-(void)ChangeOdd:(NSNotification *)notidic
{
    NSDictionary *dic = notidic.userInfo;
    [self setOddstring:dic[@"Odd"]];
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
