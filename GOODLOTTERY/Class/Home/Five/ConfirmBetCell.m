//
//  ConfirmBetCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ConfirmBetCell.h"

@implementation ConfirmBetCell
{
    UIImageView *CutLine;
    UIButton *RemoveBt;
    UIButton *AndCutImage;
    UILabel *NameLable;
    UILabel *NubLable;
    UILabel *objlable;
    UILabel *moneylable;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,80*ScaleY-1,UIScreenWIDTH, 1)];
        [self addSubview:CutLine];
        RemoveBt = [UIButton buttonWithType:UIButtonTypeCustom];
        RemoveBt.frame =CGRectMake(25*ScaleX, 40*ScaleY,20*ScaleY,20*ScaleY);
        [self addSubview:RemoveBt];
        AndCutImage = [UIButton  buttonWithType:UIButtonTypeCustom];
        AndCutImage.frame = CGRectMake(UIScreenWIDTH/2+20*ScaleX,35*ScaleY,UIScreenWIDTH/2-90*ScaleX,30*ScaleY);
        [self addSubview:AndCutImage];
        
        UIButton *CutBt = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *AndBt = [UIButton buttonWithType:UIButtonTypeCustom];
        CutBt.frame = CGRectMake(0, 0, AndCutImage.frame.size.width/2,AndCutImage.frame.size.height);
        AndBt.frame = CGRectMake(AndCutImage.frame.size.width/2, 0,AndCutImage.frame.size.width/2, AndCutImage.frame.size.height);
        [AndCutImage addSubview:CutBt];
        [AndCutImage addSubview:AndBt];
        [CutBt addTarget:self action:@selector(CutClick:) forControlEvents:UIControlEventTouchUpInside];
        [AndBt addTarget:self action:@selector(AndClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        NameLable = [[UILabel alloc]initWithFrame:CGRectMake(60*ScaleX,42.5*ScaleY,UIScreenWIDTH/2-80*ScaleX, 15*ScaleY)];
        [self addSubview:NameLable];
        
        NubLable = [[UILabel alloc]initWithFrame:CGRectMake(60*ScaleX,10*ScaleY,UIScreenWIDTH/2, 15*ScaleY)];
        [self addSubview:NubLable];
        
        objlable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH-60*ScaleX, 30*ScaleY,60*ScaleX, 15*ScaleY)];
        [self addSubview:objlable];
        moneylable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH-60*ScaleX,55*ScaleY, 60*ScaleX, 15*ScaleY)];
        [self addSubview:moneylable];
        NameLable.font = [UIFont systemFontOfSize:15*ScaleY];
        NubLable.font = [UIFont systemFontOfSize:15*ScaleY];
        objlable.font = [UIFont systemFontOfSize:15*ScaleY];
        moneylable.font = [UIFont systemFontOfSize:15*ScaleY];
        NameLable.textAlignment =NSTextAlignmentRight;
        NubLable.textAlignment =NSTextAlignmentCenter;
        objlable.textAlignment =NSTextAlignmentCenter;
        moneylable.textAlignment =NSTextAlignmentCenter;
        
        NameLable.text = @"五星 直选复式";
        NubLable.text = @"3.8.5.6.83.8.5.6.83.8.5.6.8";
        objlable.text = @"4倍1注";
        moneylable.text = @"4.00元";
    }
    
    [self UpdataImageAndTxtColor];
    return self;
}

- (void)UpdataImageAndTxtColor
{
    NameLable.textColor =GETCOLOR(@"wt1");
    NubLable.textColor =GETCOLOR(@"wt1");
    objlable.textColor =GETCOLOR(@"wt1");
    moneylable.textColor =GETCOLOR(@"Yr");
    CutLine.image = [UIImage imageNamed:IMAGEFILE(@"CatchCutline%ld")];
    [RemoveBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"RemoveCell%ld")] forState:UIControlStateNormal];
    [AndCutImage setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CellAddCut%ld")] forState:UIControlStateNormal];
}

- (void)CutClick:(UIButton *)bt
{
    NSLog(@"减减");
}
- (void)AndClick:(UIButton *)bt
{
    NSLog(@"加加");
}
@end
