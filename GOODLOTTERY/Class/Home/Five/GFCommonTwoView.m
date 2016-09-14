//
//  GFCommonTwoView.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonTwoView.h"
#import "GFTwoBt.h"

@implementation GFCommonTwoView
{
    UIButton *TitleBt;
    UIView *objView;
    CGFloat objViewY;
    NSMutableArray *seletedArray;
    NSMutableArray *AllBtArray;
    UIButton *CurrentSelected;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        AllBtArray = [NSMutableArray arrayWithCapacity:5];
        seletedArray = [NSMutableArray arrayWithCapacity:5];
        [self setView];
    }
    return self;
}

-(void)setView
{
    UIImageView *_CutView =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,2.5*ScaleY)];
    _CutView.image =[UIImage imageNamed:IMAGEFILE(@"CutLine%ld")];
    [self addSubview:_CutView];
    
    
    TitleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    TitleBt.frame = CGRectMake(5*ScaleX,20*ScaleY,70*ScaleX,25*ScaleY);
    TitleBt.titleLabel.font = [UIFont systemFontOfSize:11*ScaleY];
    TitleBt.titleLabel.textAlignment = NSTextAlignmentCenter;
    TitleBt.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, 10*ScaleX);
    [TitleBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"Digit%ld")] forState:UIControlStateNormal];
    [self addSubview:TitleBt];
    
    objViewY = 10*ScaleY;
    objView = [[UIView alloc]initWithFrame:CGRectMake(80*ScaleX,objViewY,(UIScreenWIDTH-80*ScaleX), 0)];
    [self addSubview:objView];
}

-(void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;
    [TitleBt setTitle:_titleName forState:UIControlStateNormal];
    
}
-(void)setQuickArray:(NSArray *)quickArray
{
    _quickArray = quickArray;
    
    objViewY = 55*ScaleY;
    CGFloat space;
    space = (UIScreenWIDTH-90*ScaleX-6*35*ScaleX)/7;
    
    for (int i = 0;i<quickArray.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(75*ScaleX+15*ScaleX+(space+35*ScaleX)*i,20*ScaleY,35*ScaleX, 30*ScaleY);
        [button setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"DigitKing%ld")] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"SeletedDigitKing%ld")] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(quickClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:quickArray[i] forState:UIControlStateNormal];
        [button setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

-(void)setObjArray:(NSArray *)objArray
{
    _objArray = objArray;
    CGFloat with;
    with = (UIScreenWIDTH-80*ScaleX)/2;
    
    for (int i = 0; i<_objArray.count; i++)
    {
        GFTwoBt *TwoBt = [GFTwoBt buttonWithType:UIButtonTypeCustom];
        TwoBt.frame = CGRectMake(with*(i%2),with/3*(i/2),with,with/3);
        [TwoBt.titleBT setTitle:objArray[i] forState:UIControlStateNormal];
        [TwoBt addTarget:self action:@selector(TwoBtClick:) forControlEvents:UIControlEventTouchUpInside];
        [AllBtArray addObject:TwoBt];
        [objView addSubview:TwoBt];
    }
    
    CGFloat Height;
    if (_objArray.count%2)
    {
        Height =(with/3)*(_objArray.count/2)+with/3;
    }
    else
    {
        Height =(with/3)*(_objArray.count/2);
    }
    objView.frame = CGRectMake(80*ScaleX, objViewY, UIScreenWIDTH-80*ScaleX, Height);
    
}




- (void)quickClick:(UIButton *)bt
{
    
    if ([bt.currentTitle isEqualToString:@"清"])
    {
        if (!CurrentSelected);else  CurrentSelected.selected = NO,CurrentSelected = nil;
        for (GFTwoBt*Bt in AllBtArray)
        {
            Bt.titleBT.selected = NO;
        }
        if (_BlcokSeletedArray)
        {
            _BlcokSeletedArray([self CurrentSeletedObjc]);
        }

    }
    else if ([bt.currentTitle isEqualToString:@"全"])
    {
    if (!CurrentSelected)
    {
       CurrentSelected = bt,bt.selected = YES;
        for (GFTwoBt*Bt in AllBtArray)
        {
            Bt.titleBT.selected = YES;
        }
        if (_BlcokSeletedArray)
        {
            _BlcokSeletedArray([self CurrentSeletedObjc]);
        }
    }
    }

}

-(void)TwoBtClick:(GFTwoBt *)Bt
{
    Bt.titleBT.selected =  !Bt.titleBT.selected;
    if (_BlcokSeletedArray)
    {
        _BlcokSeletedArray([self CurrentSeletedObjc]);
    }

}
-(NSArray *)CurrentSeletedObjc
{
    [seletedArray removeAllObjects];
    
    for (GFTwoBt*Bt in AllBtArray)
    {
        if (Bt.titleBT.selected)
        {
            NSString *ttt;
            ttt = [NSString stringWithFormat:@"%@",Bt.titleBT.currentTitle];
            [seletedArray addObject:ttt];
        }
    }
    return seletedArray;
}

@end
