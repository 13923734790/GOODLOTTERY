//
//  DragonTigerCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DragonTigerCell.h"
#import "DragonTigerView.h"
#import "DragonTigerBt.h"

@implementation DragonTigerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _seletedArray = [NSMutableArray arrayWithCapacity:5];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];
    }
    return self;
}


-(void)setAllBt
{
    if (_DragonTigerStyle==DragonTigerTwo)
    {
        for (int i = 0; i<(int)_NubCount; i++)
        {
            NSArray *seletedArr = [NSArray array];
            [_seletedArray addObject:seletedArr];
            
           DragonTigerView *view = [[DragonTigerView alloc]initWithFrame:CGRectMake(5*ScaleX+((UIScreenWIDTH-15*ScaleX)/2+5*ScaleX)*(i%2), 5*ScaleY+((UIScreenWIDTH-15*ScaleX)/4+5*ScaleY)*(i/2),(UIScreenWIDTH-15*ScaleX)/2,(UIScreenWIDTH-15*ScaleX)/4) AndStyle:DragonTigerBtTwo];
            
            view.TitleLable.text = @"1vs2";
            view.blockSeletedArray = ^(NSArray *seletedArr)
            {
                _seletedArray[i] = seletedArr;
            };

            [view.leftBt.OddBT setTitle:@"2.2" forState:UIControlStateNormal];
            [view.rightBt.OddBT setTitle:@"2.2" forState:UIControlStateNormal];
            
            
            [self addSubview:view];
        }
    }
    else if (_DragonTigerStyle==DragonTigerThree)
    {
        for (int i = 0; i<9; i++)
        {
            DragonTigerView *view = [[DragonTigerView alloc]initWithFrame:CGRectMake(5*ScaleX+((UIScreenWIDTH-15*ScaleX)/2+5*ScaleX)*(i%2), 5*ScaleY+((UIScreenWIDTH-15*ScaleX)/4+5*ScaleY)*(i/2),(UIScreenWIDTH-15*ScaleX)/2,(UIScreenWIDTH-15*ScaleX)/4) AndStyle:DragonTigerBtThree];
            view.TitleLable.text = @"1vs2";
            view.blockSeletedArray = ^(NSArray *seletedArr)
            {
                _seletedArray[i] = seletedArr;
            };
            
            [view.leftBt.OddBT setTitle:@"2.2" forState:UIControlStateNormal];
            [view.MiddleBt.OddBT setTitle:@"2.2" forState:UIControlStateNormal];
            [view.rightBt.OddBT setTitle:@"2.2" forState:UIControlStateNormal];
            [self addSubview:view];

        }
    }
}


-(void)setOddstring:(NSString *)Odd
{
    for (DragonTigerView *buttonView in [self subviews])
    {
        [buttonView.leftBt.OddBT setTitle:Odd forState:UIControlStateNormal];
        [buttonView.MiddleBt.OddBT setTitle:Odd forState:UIControlStateNormal];
        [buttonView.rightBt.OddBT setTitle:Odd forState:UIControlStateNormal];
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
