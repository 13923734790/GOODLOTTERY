//
//  GFCommonView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonView.h"
#import "GFCommonViewDatas.h"
#import "GFBallBt.h"

@implementation GFCommonView
{
    UIButton *TitleBt;
    UIView *objView;
    CGFloat objViewY;
    
    NSMutableArray *seletedArray;
    NSMutableArray *AllBtArray;
    GFCommonViewDatas *ToolModel;
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
    with = (UIScreenWIDTH-80*ScaleX)/5;
    for (int i = 0; i<_objArray.count; i++)
    {
        GFBallBt *ballBt = [GFBallBt buttonWithType:UIButtonTypeCustom];
        ballBt.frame = CGRectMake(with*(i%5),(with)*(i/5),with,with);
        
        [ballBt.titleBT setTitle:objArray[i] forState:UIControlStateNormal];
        
        [ballBt addTarget:self action:@selector(ballBtClick:) forControlEvents:UIControlEventTouchUpInside];
        [objView addSubview:ballBt];
        
        [AllBtArray addObject:ballBt];
    }
    
    CGFloat Height;
    if (_objArray.count%5)
    {
        Height =with*(_objArray.count/5)+with;
    }
    else
    {
        Height =with*(_objArray.count/5);
    }
    objView.frame = CGRectMake(80*ScaleX, objViewY, UIScreenWIDTH-80*ScaleX, Height);
    
}


-(void)setAllBallNub:(NSInteger)allBallNub
{
    _allBallNub = allBallNub;
    if (_allBallNub)
    {
        CGFloat with;
        with = (UIScreenWIDTH-80*ScaleX)/5;
        
        CGFloat Height;
        if (_allBallNub%5)
        {
            Height =with*(_allBallNub/5)+with;
        }
        else
        {
            Height =with*(_allBallNub/5);
        }

        
        for (int i = 0; i<_allBallNub; i++)
        {
            GFBallBt *ballBt = [GFBallBt buttonWithType:UIButtonTypeCustom];
            ballBt.frame = CGRectMake(with*(i%5),(with)*(i/5),with,with);
            [ballBt.titleBT setTitle:[NSString stringWithFormat:@"%ld",i+_startBallNub] forState:UIControlStateNormal];
            [ballBt addTarget:self action:@selector(ballBtClick:) forControlEvents:UIControlEventTouchUpInside];
            [objView addSubview:ballBt];
            [AllBtArray addObject:ballBt];
        }
        objView.frame = CGRectMake(80*ScaleX, objViewY, UIScreenWIDTH-80*ScaleX, Height);
    }
    
}

-(void)setColdHotArray:(NSArray *)coldHotArray
{
    _coldHotArray = coldHotArray;
    if (_coldHotArray==nil)
    {
        NSArray *arr = [objView subviews];
        for (int i = 0; i<arr.count; i++)
        {
            GFBallBt *Bt = arr[i];
            Bt.coldHotLable.text = @"";
        }
    }else
    {
        NSArray *arr = [objView subviews];
        for (int i = 0; i<arr.count; i++)
        {
            GFBallBt *Bt = arr[i];
            Bt.coldHotLable.text = _coldHotArray[i];
        }
    }
    
}

-(void)setIsHaveClodHot:(BOOL)isHaveClodHot
{
    _isHaveClodHot = isHaveClodHot;
    if (_isHaveClodHot)
    {
            UIButton * ClodHotBt = [UIButton buttonWithType:UIButtonTypeCustom];
            ClodHotBt.frame = CGRectMake(5*ScaleX,50*ScaleY,60*ScaleX,20*ScaleY);
            ClodHotBt.titleLabel.adjustsFontSizeToFitWidth = YES;
            ClodHotBt.titleLabel.font = [UIFont boldSystemFontOfSize:11*ScaleY];
            ClodHotBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
            UIImageView *smallImage = [[UIImageView alloc]init];
            smallImage.image = [UIImage imageNamed:@"TitleRightImage"];
            smallImage.frame = CGRectMake(45*ScaleX,(20*ScaleY-10*ScaleX)/2, 10*ScaleX, 10*ScaleX);
            [ClodHotBt addSubview:smallImage];
            [ClodHotBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [ClodHotBt setTitle:@"排行" forState:UIControlStateNormal];
            [ClodHotBt addTarget:self action:@selector(ClickClodHotBt:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:ClodHotBt];
    }
}

-(void)ClickClodHotBt:(UIButton *)bt
{
    
    NSArray *titleArray = @[@"不显示",@"冷热",@"遗漏"];
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    
    NSInteger cellNub;
    if (titleArray.count<5)
    {
        cellNub = titleArray.count;
    }
    else{
        cellNub = 5;
    }
    
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*cellNub)];
    pullmenu.DatasArray = titleArray;
    pullmenu.GameNamestring = bt.currentTitle;
    
    __weak GFCommonView *BlockSelf = self;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        if ([string isEqualToString:@"不显示"])
        {
          [bt setTitle:@"排行" forState:UIControlStateNormal];
        }
        else{
            [bt  setTitle:string forState:UIControlStateNormal];
        }
        
        if (BlockSelf.BlockColdHot)
        {
            BlockSelf.BlockColdHot(string);
        }
    };
    [pullmenu show];
    
}

-(void)setToolModel
{
    if (!ToolModel)
    {
        ToolModel = [[GFCommonViewDatas alloc]init];
    }
    if (!ToolModel.BtArray)
    {
        ToolModel.BtArray = [NSArray array];
        ToolModel.BtArray = AllBtArray;
    }
    
}
- (void)quickClick:(UIButton *)bt
{
    [self setToolModel];
    
   __weak GFCommonView *bolckSlef = self;
    ToolModel.BlockSeletedArray = ^(NSArray *seletedArr)
    {
        if (bolckSlef.BlcokSeletedArray)
        {
        bolckSlef.BlcokSeletedArray(seletedArr);
        }
    };
    [ToolModel shareQuickClick:bt];
}


-(void)ballBtClick:(GFBallBt *)Bt
{
    [self setToolModel];
    if (_BlcokSeletedArray)
    {
        _BlcokSeletedArray([ToolModel shareBallBtClick:Bt]);
    }
    
}
@end
