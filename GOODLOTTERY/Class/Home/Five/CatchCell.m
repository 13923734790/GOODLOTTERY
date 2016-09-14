//
//  CatchCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchCell.h"

@implementation CatchCell
{
    UIImageView *CutLine;
    UIButton *AndCutImage;
    UILabel *NubLable;
    UILabel *Oddlable;
    UILabel *moneylable;
    NSInteger Nub;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    Nub = [SkinPeelerTool ReturnSkinpManger];
    if (self)
    {
        CutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,60*ScaleY-1,UIScreenWIDTH, 1)];
        [self addSubview:CutLine];
        AndCutImage = [UIButton  buttonWithType:UIButtonTypeCustom];
        AndCutImage.frame = CGRectMake(UIScreenWIDTH/2,15*ScaleY,UIScreenWIDTH/4,30*ScaleY);
        [self addSubview:AndCutImage];

        UIButton *CutBt = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *AndBt = [UIButton buttonWithType:UIButtonTypeCustom];
        CutBt.frame = CGRectMake(0, 0, AndCutImage.frame.size.width/2,AndCutImage.frame.size.height);
        AndBt.frame = CGRectMake(AndCutImage.frame.size.width/2, 0,AndCutImage.frame.size.width/2, AndCutImage.frame.size.height);
        [AndCutImage addSubview:CutBt];
        [AndCutImage addSubview:AndBt];
        [CutBt addTarget:self action:@selector(CutClick:) forControlEvents:UIControlEventTouchUpInside];
        [AndBt addTarget:self action:@selector(AndClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
       
        NubLable = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX,20*ScaleY,UIScreenWIDTH/3*ScaleX, 20*ScaleY)];
        [self addSubview:NubLable];
        Oddlable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/3, 20*ScaleY,UIScreenWIDTH/2-UIScreenWIDTH/3, 20*ScaleY)];
        [self addSubview:Oddlable];
        moneylable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*3/4,20*ScaleY,UIScreenWIDTH/4, 20*ScaleY)];
        [self addSubview:moneylable];

        NubLable.font = [UIFont systemFontOfSize:15*ScaleY];
        Oddlable.font = [UIFont systemFontOfSize:15*ScaleY];
        moneylable.font = [UIFont systemFontOfSize:15*ScaleY];
        NubLable.textAlignment =NSTextAlignmentLeft;
        Oddlable.textAlignment =NSTextAlignmentCenter;
        moneylable.textAlignment =NSTextAlignmentCenter;
        
        NubLable.text = @"150914024期";
        Oddlable.text = @"4 倍";
        moneylable.text = @"40000元";
        
        self.backgroundColor = [UIColor clearColor];
        NubLable.textColor =GETCOLOR(@"wt1");
        Oddlable.textColor =GETCOLOR(@"wt1");
        moneylable.textColor =GETCOLOR(@"wt1");
        
        CutLine.image = [UIImage imageNamed:IMAGEFILE(@"CatchCutline%ld")];
        [AndCutImage setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CellAddCut%ld")] forState:UIControlStateNormal];
    }
    return self;
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
