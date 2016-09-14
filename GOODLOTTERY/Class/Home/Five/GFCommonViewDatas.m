//
//  GFCommonViewDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonViewDatas.h"
#import "GFBallBt.h"

@implementation GFCommonViewDatas
{
   UIButton *CurrentSelected;
   NSMutableArray *seletedArray;
}
-(instancetype)init
{
    self = [super init];
    if (self)
    {
    seletedArray = [NSMutableArray arrayWithCapacity:5];
    }
    return self;
}

-(void)shareQuickClick:(UIButton *)bt{
    
    if ([bt.currentTitle isEqualToString:@"清"])
    {
        if (!CurrentSelected);else  CurrentSelected.selected = NO,CurrentSelected = nil;
        [self removeAllballBt];
        if (_BlockSeletedArray)
        {
            _BlockSeletedArray([self CurrentSeletedObjc]);
        }
    }
    else
    {
        if ([bt.currentTitle isEqualToString:@"全"])
        {
            if (!CurrentSelected)
            {
                CurrentSelected = bt,bt.selected = YES;
            }
            else{
                if (CurrentSelected==bt);else CurrentSelected.selected = NO,CurrentSelected = bt,bt.selected = YES;
            }
            
            for (GFBallBt *Ballbt in _BtArray)
            {
                Ballbt.titleBT.selected = YES;
            }
            if (_BlockSeletedArray)
            {
                _BlockSeletedArray([self CurrentSeletedObjc]);
            }
            
        }
        else if ([bt.currentTitle isEqualToString:@"大"])
        {
            if (!CurrentSelected)
            {
                CurrentSelected = bt,bt.selected = YES;
            }
            else{
                if (CurrentSelected==bt);else CurrentSelected.selected = NO,CurrentSelected = bt,bt.selected = YES;
            }
            
            for (int i = 0; i<_BtArray.count; i++)
            {
                if (i+1>_BtArray.count/2)
                {
                    GFBallBt *Ballbt = _BtArray[i];
                    Ballbt.titleBT.selected = YES;
                }
                else{
                    GFBallBt *Ballbt = _BtArray[i];
                    Ballbt.titleBT.selected = NO;
                }
            }
            if (_BlockSeletedArray)
            {
                _BlockSeletedArray([self CurrentSeletedObjc]);
            }
            
        }
        else if ([bt.currentTitle isEqualToString:@"小"])
        {
            if (!CurrentSelected)
            {
                CurrentSelected = bt,bt.selected = YES;
            }
            else{
                if (CurrentSelected==bt);else CurrentSelected.selected = NO,CurrentSelected = bt,bt.selected = YES;
            }
            for (int i = 0; i<_BtArray.count; i++)
            {
                if (i+1>_BtArray.count/2)
                {
                    GFBallBt *Ballbt = _BtArray[i];
                    Ballbt.titleBT.selected = NO;
                }
                else{
                    GFBallBt *Ballbt = _BtArray[i];
                    Ballbt.titleBT.selected = YES;
                }
            }
            if (_BlockSeletedArray)
            {
                _BlockSeletedArray([self CurrentSeletedObjc]);
            }

            
        }
        else if ([bt.currentTitle isEqualToString:@"单"])
        {
            if (!CurrentSelected)
            {
                CurrentSelected = bt,bt.selected = YES;
            }
            else{
                if (CurrentSelected==bt);else CurrentSelected.selected = NO,CurrentSelected = bt,bt.selected = YES;
            }
            
            for (GFBallBt *Ballbt in _BtArray)
            {
                if ([Ballbt.titleBT.currentTitle integerValue]%2)
                {
                    Ballbt.titleBT.selected = YES;
                }
                else
                {
                    Ballbt.titleBT.selected = NO;
                }
            }
            if (_BlockSeletedArray)
            {
                _BlockSeletedArray([self CurrentSeletedObjc]);
            }

        }
        else if ([bt.currentTitle isEqualToString:@"双"])
        {
            if (!CurrentSelected)
            {
                CurrentSelected = bt,bt.selected = YES;
            }
            else{
                if (CurrentSelected==bt);else CurrentSelected.selected = NO,CurrentSelected = bt,bt.selected = YES;
            }
            
            for (GFBallBt *Ballbt in _BtArray)
            {
                if ([Ballbt.titleBT.currentTitle integerValue]%2)
                {
                    Ballbt.titleBT.selected = NO;
                }
                else
                {
                    Ballbt.titleBT.selected = YES;
                }
            }
            if (_BlockSeletedArray)
            {
                _BlockSeletedArray([self CurrentSeletedObjc]);
            }

        }
    }

}
-(NSArray *)shareBallBtClick:(UIButton *)bt
{
    GFBallBt *ballBt =(GFBallBt *) bt;
    ballBt.titleBT.selected = !ballBt.titleBT.selected;
    return [self CurrentSeletedObjc];
}
////当前选中的项目
-(NSArray *)CurrentSeletedObjc
{
    [seletedArray removeAllObjects];
    
    for (GFBallBt*Bt in _BtArray)
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

-(void)removeAllballBt
{
    for (GFBallBt*Bt in _BtArray)
    {
        Bt.titleBT.selected = NO;
    }
}
@end
