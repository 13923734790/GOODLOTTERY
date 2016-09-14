//
//  FPTimeView.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FPTimeView.h"
#import "ChuMaYiLouView.h"

@implementation FPTimeView
{
    __block  NSInteger _index;
    NSArray *changeArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _index = 0;
        [self setAllView];
    }
    return self;
}



-(void)setAllView
{
    _FPView = [[UIView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,35*ScaleY)];
    _MiddleLable = [[UILabel alloc]initWithFrame:CGRectMake(5,0,UIScreenWIDTH/2,35*ScaleY)];
    _MiddleLable.font = [UIFont systemFontOfSize:13*ScaleY];
    _MiddleLable.adjustsFontSizeToFitWidth = YES;
    _MiddleLable.baselineAdjustment =UIBaselineAdjustmentAlignCenters;
    _topPullImage = [UIButton buttonWithType:UIButtonTypeCustom];
    _topPullImage.frame = CGRectMake(0, 0, UIScreenWIDTH, 6*ScaleY);
    [_FPView addSubview:_topPullImage];
    [_FPView addSubview:_MiddleLable];
    [self addSubview:_FPView];
    
    [self UpdataImageTextColor];

}

-(void)SetQuestionBt
{
    _leftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBt.frame = CGRectMake(UIScreenWIDTH-70*ScaleY, 0, 35*ScaleY, 35*ScaleY);
    UIImageView *Image1 = [[UIImageView alloc]initWithFrame:CGRectMake(7.5*ScaleY, 7.5*ScaleY, 20*ScaleY, 20*ScaleY)];
    Image1.image = [UIImage imageNamed:IMAGEFILE(@"question%ld")];
    
    [_leftBt addTarget:self action:@selector(Click2:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBt addSubview:Image1];
    [self addSubview:_leftBt];
}

-(void)SetPromptBt
{   _rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBt.frame = CGRectMake(UIScreenWIDTH-35*ScaleY,0, 35*ScaleY, 35*ScaleY);
    UIImageView *Image2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 7.5*ScaleY,35*ScaleY,20*ScaleY)];
    Image2.image = [UIImage imageNamed:IMAGEFILE(@"Prompt%ld")];
    [_rightBt addTarget:self action:@selector(Click1:) forControlEvents:UIControlEventTouchUpInside];
    [_rightBt addSubview:Image2];
    [self addSubview:_rightBt];
}

-(void)setRightPullBt
{
    
    _pullRightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _pullRightBt.frame = CGRectMake(UIScreenWIDTH-85*ScaleX,5*ScaleY,80*ScaleX,25*ScaleY);
    _pullRightBt.layer.cornerRadius = 2;
    _pullRightBt.layer.masksToBounds = YES;
    _pullRightBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    _pullRightBt.titleLabel.font = [UIFont boldSystemFontOfSize:11*ScaleY];
    _pullRightBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    UIImageView *smallImage = [[UIImageView alloc]init];
    smallImage.image = [UIImage imageNamed:@"TitleRightImage"];
    smallImage.frame = CGRectMake(60*ScaleX+3.5*ScaleX,(25*ScaleY-13*ScaleX)/2, 13*ScaleX, 13*ScaleX);
    [_pullRightBt addSubview:smallImage];
    //标题框左边向左移动了10个位子然后 右边向左移动了15个位子
    _pullRightBt.titleEdgeInsets = UIEdgeInsetsMake(0,-10*ScaleX,0,10*ScaleX);
    //图标框左边向右移动了55个位子然后 右边向右移动了50个位子
//    _pullRightBt.imageEdgeInsets = UIEdgeInsetsMake(0,80*ScaleX-20,0,-(80*ScaleX-30));
    
    [_pullRightBt setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateNormal];
    [_pullRightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.pullRightBt addTarget:self action:@selector(ClickpullRight:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pullRightBt];

}
-(void)SetLeftPullBt
{
    _pullLeftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _pullLeftBt.frame = CGRectMake(UIScreenWIDTH-170*ScaleX,5*ScaleY,80*ScaleX,25*ScaleY);
    _pullLeftBt.layer.cornerRadius = 2;
    _pullLeftBt.layer.masksToBounds = YES;
    _pullLeftBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    _pullLeftBt.titleLabel.font = [UIFont boldSystemFontOfSize:11*ScaleY];
    _pullLeftBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //标题框左边向左移动了10个位子然后 右边向左移动了15个位子
    _pullLeftBt.titleEdgeInsets = UIEdgeInsetsMake(0,-10*ScaleX,0,10*ScaleX);

    
    UIImageView *smallImage = [[UIImageView alloc]init];
    smallImage.image = [UIImage imageNamed:@"TitleRightImage"];
    smallImage.frame = CGRectMake(60*ScaleX+3.5*ScaleX,(25*ScaleY-13*ScaleX)/2, 13*ScaleX, 13*ScaleX);
    [_pullLeftBt addSubview:smallImage];
    //图标框左边向右移动了55个位子然后 右边向右移动了50个位子
//    _pullLeftBt.imageEdgeInsets = UIEdgeInsetsMake(0,80*ScaleX-20,0,-(80*ScaleX-30));
    [_pullLeftBt setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateNormal];
    [_pullLeftBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.pullLeftBt addTarget:self action:@selector(ClickpullLeftBt:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pullLeftBt];

}

-(void)setYiLouPaiHanView
{
    
    _YiLouView = [[UIView alloc]initWithFrame:CGRectMake(0, 35*ScaleY, UIScreenWIDTH, 35*ScaleY)];
    [self addSubview:_YiLouView];
    
    UIButton *ChuMaBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ChuMaBt.frame = CGRectMake(0,0,UIScreenWIDTH/2,35*ScaleY);
    [ChuMaBt addTarget:self action:@selector(ClickChuMaBt) forControlEvents:UIControlEventTouchUpInside];
    [_YiLouView addSubview:ChuMaBt];
    
    UILabel *ChuMalable = [[UILabel alloc]init];
    ChuMalable.frame = CGRectMake(UIScreenWIDTH/6,15*ScaleY/2,UIScreenWIDTH/6,20*ScaleY);
    ChuMalable.text = @"出码排行";
    ChuMalable.font = [UIFont systemFontOfSize:15*ScaleY];
    ChuMalable.textColor = [UIColor whiteColor];
    ChuMalable.userInteractionEnabled = NO;
    [ChuMaBt addSubview:ChuMalable];
    
    UIImageView *ChuMaImage = [[UIImageView alloc]init];
    ChuMaImage.frame = CGRectMake(UIScreenWIDTH/6-20*ScaleY,15*ScaleY/2, 20*ScaleY, 20*ScaleY);
    ChuMaImage.image = [UIImage imageNamed:IMAGEFILE(@"CQLeftImage%ld")];
    ChuMaImage.userInteractionEnabled = NO;
    [ChuMaBt addSubview:ChuMaImage];
    
    
    UIButton *YiLouBt = [UIButton buttonWithType:UIButtonTypeCustom];
    YiLouBt.frame = CGRectMake(UIScreenWIDTH/2,0,UIScreenWIDTH/2,35*ScaleY);
    [YiLouBt addTarget:self action:@selector(ClickYiLouBt) forControlEvents:UIControlEventTouchUpInside];
    [_YiLouView addSubview:YiLouBt];
    
    UILabel *YiLoulable = [[UILabel alloc]init];
    YiLoulable.frame = CGRectMake(UIScreenWIDTH/6,15*ScaleY/2,UIScreenWIDTH/6,20*ScaleY);
    YiLoulable.text = @"遗漏排行";
    YiLoulable.font = [UIFont systemFontOfSize:15*ScaleY];
    YiLoulable.textColor = [UIColor whiteColor];
    YiLoulable.userInteractionEnabled = NO;
    [YiLouBt addSubview:YiLoulable];
    
    UIImageView *YiLouImage = [[UIImageView alloc]init];
    YiLouImage.frame = CGRectMake(UIScreenWIDTH/6-20*ScaleY,15*ScaleY/2, 20*ScaleY, 20*ScaleY);
    YiLouImage.image = [UIImage imageNamed:IMAGEFILE(@"CQLeftImage%ld")];
    YiLouImage.userInteractionEnabled = NO;
    [YiLouBt addSubview:YiLouImage];
    
    
}



-(void)setLeftArray:(NSArray *)LeftArray
{
    _LeftArray = LeftArray;
    [self UpdatasLeftBt];
}

-(void)UpdatasLeftBt
{
    if(_IsChange)
    {
        changeArray = _LeftArray[_index];
        
    }else{
        changeArray = _LeftArray;
    }
    if (changeArray==nil)_pullLeftBt.hidden =YES;else _pullLeftBt.hidden =NO;
    [_pullLeftBt setTitle:changeArray[0] forState:UIControlStateNormal];

}

-(void)setRightArray:(NSArray *)RightArray
{
    _RightArray = RightArray;
    if (RightArray==nil)_pullRightBt.hidden =YES;else _pullRightBt.hidden =NO;
    [_pullRightBt setTitle:_RightArray[0] forState:UIControlStateNormal];
    
}





-(void)ClickpullRight:(UIButton *)bt
{
    if (_RightArray.count==1)
    {
        if (_blockRightSelected)
        {
            _blockRightSelected(bt.currentTitle);
        }
    }
    else if (_RightArray)
    {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[bt convertRect: bt.bounds toView:window];
        
        NSInteger cellNub;
        
        if (_RightArray.count<5)
        {
        cellNub = _RightArray.count;
        }
        else
        {
        cellNub = 5;
        }
        
        PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*cellNub)];
        pullmenu.DatasArray = _RightArray;
        pullmenu.GameNamestring = bt.currentTitle;
        pullmenu.appearance.resultCallBack = ^(NSString * string)
        {
            [bt  setTitle:string forState:UIControlStateNormal];
            
            
            if (_blockRightSelected)
            {
                _blockRightSelected(string);
            }
            
            if (_IsChange)
            {
                _index = [_RightArray indexOfObject:string];
                [self UpdatasLeftBt];
            }
            
        };
        [pullmenu show];
    }
    
}

-(void)ClickpullLeftBt:(UIButton *)bt
{
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    
    NSInteger cellNub;
    if (changeArray.count<5)
    {
        cellNub = changeArray.count;
    }
    else{
        cellNub = 5;
    }

    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*cellNub)];
    pullmenu.DatasArray = changeArray;
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        [bt  setTitle:string forState:UIControlStateNormal];
        if (_blockLeftSelected)
        {
            _blockLeftSelected(string);
        }
    };
    [pullmenu show];
    
}


-(void)Click1:(UIButton *)bt
{
    PromptBox *promptbox = [[PromptBox alloc]initWithFrame:CGRectMake(0, 0,250*ScaleX,170*ScaleY)];\
    ChuMaYiLouView *YiLouView = [[ChuMaYiLouView alloc]init];
    promptbox.PromptView = YiLouView;
    promptbox.appearance.BackgroundColor = DTAISCOLORE(1, 1, 1, 0.8);
    promptbox.appearance.BorderWithl = 3.0;
    promptbox.appearance.BorderColor = [UIColor orangeColor];
    promptbox.appearance.textColor = [UIColor whiteColor];
    promptbox.appearance.font = [UIFont systemFontOfSize:15*ScaleY];
    
    promptbox.appearance.textString = @"介绍:本文介绍的CoreData不在AppDelegate中创建,在程序中新建工程使用,即创建本地数据库,缓存数据,隔几个小时后更新数据1. 创建CoreData:本人命名为ZHZMOdel,插入一张表:News:如图备注:创建方式:command+N->ios/coredate->DataModel介绍:本文介绍的CoreData不在AppDelegate中创建,在程序中新建工程使用,即创建本地数据库,缓存数据,隔几个小时后更新数据1. 创建CoreData:本人命名为ZHZMOdel,插入一张表:News:如图备注:创建方式:command+N->ios/coredate->DataModel";
   [promptbox show];
}

-(void)Click2:(UIButton *)bt
{
    
    PromptBox *promptbox = [[PromptBox alloc]initWithFrame:CGRectMake(0, 0,345*ScaleX,345*ScaleY)];
    ChuMaYiLouView *YiLouView = [[ChuMaYiLouView alloc]init];
    promptbox.PromptView = YiLouView;
    promptbox.appearance.BackgroundColor = DTAISCOLORE(1, 1, 1, 0.8);
    promptbox.appearance.BorderWithl = 3.0;
    promptbox.appearance.BorderColor = [UIColor orangeColor];
    promptbox.appearance.textColor = [UIColor whiteColor];
    promptbox.appearance.font = [UIFont systemFontOfSize:15*ScaleY];
    promptbox.appearance.textString = @"介绍:本文介绍的CoreData不在AppDelegate中创建,在程序中新建工程使用,即创建本地数据库,缓存数据,隔几个小时后更新数据1. 创建CoreData:本人命名为ZHZMOdel,插入一张表:News:如图备注:创建方式:command+N->ios/coredate->DataModel";
    [promptbox show];
    
}

-(void)ClickChuMaBt
{
    PromptBox *promptbox = [[PromptBox alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH-40*ScaleX,UIScreenHEIGHT-200*ScaleY)];
    ChuMaYiLouView *YiLouView = [[ChuMaYiLouView alloc]init];
    YiLouView.titleString = @"出码排行";
    promptbox.PromptView = YiLouView;
    promptbox.appearance.BackgroundColor = DTAISCOLORE(1, 1, 1, 0.8);
    promptbox.appearance.BorderWithl = 3.0;
    promptbox.appearance.BorderColor = [UIColor orangeColor];
    promptbox.appearance.textColor = [UIColor whiteColor];
    [promptbox show];
}

-(void)ClickYiLouBt
{
    PromptBox *promptbox = [[PromptBox alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH-40*ScaleX,UIScreenHEIGHT-200*ScaleY)];
    ChuMaYiLouView *YiLouView = [[ChuMaYiLouView alloc]init];
    YiLouView.titleString = @"遗漏排行";
    promptbox.PromptView = YiLouView;
    promptbox.appearance.BackgroundColor = DTAISCOLORE(1, 1, 1, 0.8);
    promptbox.appearance.BorderWithl = 3.0;
    promptbox.appearance.BorderColor = [UIColor orangeColor];
    promptbox.appearance.textColor = [UIColor whiteColor];
    [promptbox show];
}
- (void)UpdataImageTextColor;
{
self.backgroundColor = GETCOLOR(@"cbw");
    
//[_topPullImage setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"TopPullDown%ld")] forState:UIControlStateNormal];
self.MiddleLable.textColor = GETCOLOR(@"wt1");
NSMutableAttributedString *AttString = [[NSMutableAttributedString alloc]initWithString:@"距 093 期封盘 04:46:53"];
NSRange ClolorRange = NSMakeRange(0,1);
NSRange Clolor2Range = NSMakeRange([[AttString string] rangeOfString:@"期"].location,3);
[AttString addAttribute:NSForegroundColorAttributeName value:GETCOLOR(@"yr") range:ClolorRange];
[AttString addAttribute:NSForegroundColorAttributeName value:GETCOLOR(@"yr") range:Clolor2Range];
[self.MiddleLable setAttributedText:AttString];
    
}

@end
