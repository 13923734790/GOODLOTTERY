//
//  DragonTigerView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DragonTigerView.h"
#import "DragonTigerBt.h"

@implementation DragonTigerView
{
    NSMutableArray *SeletedArray;
    UIView *seletedView;
}

-(instancetype)initWithFrame:(CGRect)frame AndStyle:(DragonTigerBtkind)DragonTigerKindstyle;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)/4-1*ScaleY)];
        _TitleLable.font = [UIFont boldSystemFontOfSize:13*ScaleY];
        _TitleLable.textAlignment = NSTextAlignmentCenter;
        _TitleLable.textColor = [UIColor whiteColor];
        _TitleLable.backgroundColor = GETCOLOR(@"b0.3w");
        [self addSubview:_TitleLable];
        
        SeletedArray = [NSMutableArray arrayWithCapacity:5];
        
        if (DragonTigerKindstyle==DragonTigerBtTwo)
        {
            [self setTwoDragonTiger:DragonTigerBtTwo];
        }
        else if (DragonTigerKindstyle==DragonTigerBtThree)
        {
            [self setThreeDragonTiger:DragonTigerBtThree];
        }
        
        
    }
    return self;
}



- (void)setTwoDragonTiger:(NSInteger)kind
{
    seletedView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.frame)/4,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*3/4)];
    [self addSubview:seletedView];
    
    _leftBt = [DragonTigerBt buttonWithType:UIButtonTypeCustom];
    _leftBt.Kind = kind;
    _leftBt.backgroundColor = GETCOLOR(@"b0.3w");
    _leftBt.BallBt.backgroundColor = [UIColor orangeColor];
    _leftBt.frame = CGRectMake(0,0,(CGRectGetWidth(self.frame)-1*ScaleX)/2,CGRectGetHeight(self.frame)*3/4);
    [_leftBt.BallBt setTitle:@"龙" forState:UIControlStateNormal];
    [_leftBt.BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftBt addTarget:self action:@selector(LeftClick:) forControlEvents:UIControlEventTouchUpInside];
    [seletedView addSubview:_leftBt];
    
    
    _rightBt = [DragonTigerBt buttonWithType:UIButtonTypeCustom];
    _rightBt.Kind = kind;
    _rightBt.BallBt.backgroundColor = [UIColor redColor];
    _rightBt.backgroundColor = GETCOLOR(@"b0.3w");
    _rightBt.frame = CGRectMake((CGRectGetWidth(self.frame)-1*ScaleX)/2+1*ScaleX,0,(CGRectGetWidth(self.frame)-1*ScaleX)/2,CGRectGetHeight(self.frame)*3/4);
    [_rightBt addTarget:self action:@selector(RightClick:) forControlEvents:UIControlEventTouchUpInside];

    [_rightBt.BallBt setTitle:@"虎" forState:UIControlStateNormal];
    [_rightBt.BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seletedView addSubview:_rightBt];
    
    
}

- (void)setThreeDragonTiger:(NSInteger)kind
{
    seletedView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.frame)/4,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*3/4)];
    [self addSubview:seletedView];
    
    _leftBt = [DragonTigerBt buttonWithType:UIButtonTypeCustom];
    _leftBt.Kind = kind;
    _leftBt.BallBt.backgroundColor = [UIColor orangeColor];
    _leftBt.backgroundColor = GETCOLOR(@"b0.3w");
    _leftBt.frame = CGRectMake(0,0,(CGRectGetWidth(self.frame)-2*ScaleX)/3,CGRectGetHeight(self.frame)*3/4);
    [_leftBt addTarget:self action:@selector(LeftClick:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBt.BallBt setTitle:@"龙" forState:UIControlStateNormal];
    [_leftBt.BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seletedView addSubview:_leftBt];
    
    
    _MiddleBt = [DragonTigerBt buttonWithType:UIButtonTypeCustom];
    _MiddleBt.Kind = kind;
    _MiddleBt.BallBt.backgroundColor = [UIColor greenColor];
    _MiddleBt.backgroundColor = GETCOLOR(@"b0.3w");
    _MiddleBt.frame = CGRectMake((CGRectGetWidth(self.frame)-2*ScaleX)/3+1*ScaleX,0,(CGRectGetWidth(self.frame)-2*ScaleX)/3,CGRectGetHeight(self.frame)*3/4);
    [_MiddleBt addTarget:self action:@selector(MiddleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_MiddleBt.BallBt setTitle:@"和" forState:UIControlStateNormal];
    [_MiddleBt.BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seletedView addSubview:_MiddleBt];
    
    
    _rightBt = [DragonTigerBt buttonWithType:UIButtonTypeCustom];
    _rightBt.Kind = kind;
    _rightBt.BallBt.backgroundColor = [UIColor redColor];
    _rightBt.backgroundColor = GETCOLOR(@"b0.3w");
    _rightBt.frame = CGRectMake((CGRectGetWidth(self.frame)-2*ScaleX)*2/3+2*ScaleX,0,(CGRectGetWidth(self.frame)-2*ScaleX)/3,CGRectGetHeight(self.frame)*3/4);
    [_rightBt addTarget:self action:@selector(RightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_rightBt.BallBt setTitle:@"虎" forState:UIControlStateNormal];
    [_rightBt.BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seletedView addSubview:_rightBt];
}

-(void)LeftClick:(DragonTigerBt *)bt
{
    bt.selected = !bt.selected;
    [self CurrentSeletedObjc];
}
-(void)MiddleClick:(DragonTigerBt *)bt
{
     bt.selected = !bt.selected;
    [self CurrentSeletedObjc];
}
-(void)RightClick:(DragonTigerBt *)bt
{
     bt.selected = !bt.selected;
    [self CurrentSeletedObjc];
}

//当前选中的项目
-(void)CurrentSeletedObjc
{
    
    [SeletedArray removeAllObjects];
    for (DragonTigerBt *BT in [seletedView subviews])
    {
        if (BT.selected)
        {
            NSString *string = [NSString stringWithFormat:@"%@:%@",_TitleLable.text,BT.BallBt.currentTitle];
            [SeletedArray addObject:string];
        }
    }
    
    if (_blockSeletedArray)
    {
        _blockSeletedArray(SeletedArray);
    }
    
}
@end
