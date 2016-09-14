//
//  GFCommonThreeView.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonThreeView.h"
#import "GFThreeBt.h"

@implementation GFCommonThreeView
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
    with = (UIScreenWIDTH-80*ScaleX-45*ScaleX)/3;
    
    for (int i = 0; i<_objArray.count; i++)
    {
        GFThreeBt *ThreeBt = [GFThreeBt buttonWithType:UIButtonTypeCustom];
        ThreeBt.frame = CGRectMake((with+15*ScaleX)*(i%3),with*(i/3),with,with);
        ThreeBt.oddString = @"2.36";
        ThreeBt.titleString = _objArray[i];
        ThreeBt.SubtitleString = @"大>小";
        [ThreeBt addTarget:self action:@selector(ThreeBtClick:) forControlEvents:UIControlEventTouchUpInside];
        [AllBtArray addObject:ThreeBt];
        [objView addSubview:ThreeBt];
    }
    
    CGFloat Height;
    if (_objArray.count%3)
    {
        Height =with*(_objArray.count/3)+with;
    }
    else
    {
        Height =with*(_objArray.count/3);
    }
    objView.frame = CGRectMake(80*ScaleX, objViewY, UIScreenWIDTH-80*ScaleX, Height);
    
}




- (void)quickClick:(UIButton *)bt
{
    
    if ([bt.currentTitle isEqualToString:@"清"])
    {
        if (!CurrentSelected);else  CurrentSelected.selected = NO,CurrentSelected = nil;
        for (GFThreeBt*Bt in AllBtArray)
        {
            Bt.titleBt.selected = NO;
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
            for (GFThreeBt*Bt in AllBtArray)
            {
                Bt.titleBt.selected = YES;
            }
            if (_BlcokSeletedArray)
            {
                _BlcokSeletedArray([self CurrentSeletedObjc]);
            }
        }
    }
    
}

-(void)ThreeBtClick:(GFThreeBt *)Bt
{
    Bt.titleBt.selected =  !Bt.titleBt.selected;
    if (_BlcokSeletedArray)
    {
        _BlcokSeletedArray([self CurrentSeletedObjc]);
    }
    
}
-(NSArray *)CurrentSeletedObjc
{
    [seletedArray removeAllObjects];
    
    for (GFThreeBt*Bt in AllBtArray)
    {
        if (Bt.titleBt.selected)
        {
            NSString *ttt;
            ttt = [NSString stringWithFormat:@"%@",Bt.titleString];
            [seletedArray addObject:ttt];
        }
    }
    return seletedArray;
}
@end
