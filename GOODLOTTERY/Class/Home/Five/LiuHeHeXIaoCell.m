//
//  LiuHeHeXIaoCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeHeXIaoCell.h"
#import "SxWsView.h"

@implementation LiuHeHeXIaoCell
{
    UIButton *winBt;
    UIButton *missBt;
    UIButton *currentSelected;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setTeXiaoView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];
    }
    return self;
}


-(void)setTeXiaoView
{
    
    winBt = [UIButton buttonWithType:UIButtonTypeCustom];
    winBt.frame = CGRectMake(5*ScaleX,0,(UIScreenWIDTH-15*ScaleX)/2, 30*ScaleY);
    [winBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [winBt setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];

    [winBt setBackgroundImage:[hybridTool createImageWithColor:GETCOLOR(@"b0.3w")] forState:UIControlStateNormal];
    [winBt setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];

    winBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [winBt addTarget:self action:@selector(winBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:winBt];
    
    
    missBt = [UIButton buttonWithType:UIButtonTypeCustom];
    missBt.frame = CGRectMake((UIScreenWIDTH-15*ScaleX)/2+10*ScaleX,0,(UIScreenWIDTH-15*ScaleX)/2,30*ScaleY);
    [missBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [missBt setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [missBt setBackgroundImage:[hybridTool createImageWithColor:GETCOLOR(@"b0.3w")] forState:UIControlStateNormal];
    [missBt setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
    
     missBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
    [missBt addTarget:self action:@selector(missBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:missBt];
    
    
    currentSelected = winBt;
    winBt.selected = !winBt.selected;
    
    
    
    UILabel * titleBt = [[UILabel alloc]init];
    titleBt.frame = CGRectMake(5*ScaleX,30*ScaleY, 40*ScaleY, 29*ScaleY);
    titleBt.backgroundColor = DTAISCOLORE(255, 255, 255, 0.6);
    titleBt.textAlignment = NSTextAlignmentCenter;
    titleBt.text = @"项目";
    titleBt.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:titleBt];
    
    UILabel * OddBt = [[UILabel alloc]init];
    OddBt.frame = CGRectMake(6*ScaleX+40*ScaleY,30*ScaleY, 40*ScaleY, 29*ScaleY);
    OddBt.backgroundColor = DTAISCOLORE(255,255,255, 0.6);
    OddBt.textAlignment = NSTextAlignmentCenter;
    OddBt.text = @"赔率";
    OddBt.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:OddBt];
    
    UILabel *balllable = [[UILabel alloc]init];
    balllable.frame = CGRectMake(40*ScaleY*2+7*ScaleX, 30*ScaleY, (UIScreenWIDTH-10*ScaleX)-120*ScaleY-3*ScaleX, 29*ScaleY);
    balllable.backgroundColor = DTAISCOLORE(255, 255, 255, 0.6);
    balllable.textAlignment = NSTextAlignmentCenter;
    balllable.text = @"号码";
    balllable.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:balllable];
    
    UILabel *chooseLb = [[UILabel alloc]init];
    chooseLb.frame = CGRectMake(UIScreenWIDTH-40*ScaleY-5*ScaleX,30*ScaleY,40*ScaleY, 29*ScaleY);
    chooseLb.backgroundColor = DTAISCOLORE(255, 255, 255, 0.6);
    chooseLb.textAlignment = NSTextAlignmentCenter;
    chooseLb.text = @"选择";
    chooseLb.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:chooseLb];
    
    
}

-(void)winBtClick:(UIButton *)bt
{
    if (currentSelected==bt)
    {
    }
    else
    {
        currentSelected.selected = NO;
        bt.selected = YES;
        currentSelected = bt;
        [self setOddstring:@"222"];
    }
}

-(void)missBtClick:(UIButton *)bt
{
    if (currentSelected==bt)
    {
    }
    else
    {
        currentSelected.selected = NO;
        bt.selected = YES;
        currentSelected = bt;
        [self setOddstring:@"333"];
    }
}


-(void)setKindString:(NSString *)KindString
{
    _KindString = KindString;
    NSString *string1 = [NSString stringWithFormat:@"%@中",_KindString];
    [winBt setTitle:string1 forState:UIControlStateNormal];
    
    NSString *string2 = [NSString stringWithFormat:@"%@不中",_KindString];
    [missBt setTitle:string2 forState:UIControlStateNormal];

}


-(void)setArraytitle:(NSArray *)Arraytitle
{
    _Arraytitle = Arraytitle;
    
    for (int i = 0; i<_Arraytitle.count; i++)
    {
        SxWsView *TeXiaoView = [[SxWsView alloc]initWithFrame:CGRectMake(5*ScaleX, 61*ScaleY+(1*ScaleY+40*ScaleY)*i, UIScreenWIDTH-10*ScaleX, 40*ScaleY)];
        TeXiaoView.tag = 100+i;
        TeXiaoView.TitleString = _Arraytitle[i];
        TeXiaoView.OddString = @"12.2";
        TeXiaoView.chooseImage = IMAGEFILE(@"shareBt%ld");
        TeXiaoView.BallArray =@[@"3",@"2",@"1"];
      [self.contentView addSubview:TeXiaoView];
    }
}


-(void)setOddstring:(NSString *)Odd
{
    for (int i = 0; i<_Arraytitle.count; i++)
    {
        SxWsView *view = [self viewWithTag:100+i];
        view.OddString = Odd;
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
