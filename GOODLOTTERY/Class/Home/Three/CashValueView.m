//
//  CashValueView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashValueView.h"
#import "CashValueHeard.h"
#import "ValueView.h"
#import "CashView.h"

@implementation CashValueView
{
    CashValueHeard *heardView;
    ValueView *value;
    CashView *cash;
    UIScrollView *SelfScrollView;
    NSInteger selctedNub;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        SelfScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,FRAMEWIDTH,FRAMEHEIGHT)];
        SelfScrollView.delegate = self;
        SelfScrollView.contentSize = CGSizeMake(FRAMEWIDTH,FRAMEHEIGHT);
        SelfScrollView.bounces = NO;
        SelfScrollView.pagingEnabled = NO;
        [self addSubview:SelfScrollView];
        
        
        heardView = [[CashValueHeard alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,185*ScaleX)];
        [SelfScrollView addSubview:heardView];
        
        __block CashValueView *Blcokself = self;
        heardView.blcokNub = ^(NSInteger nub)
        {
          if (selctedNub!=nub-99)[Blcokself GETView:nub-99];
        };
        
        cash = [[CashView alloc]initWithFrame:CGRectMake(0, 185*ScaleX,UIScreenWIDTH,FRAMEHEIGHT-185*ScaleX)];
        [SelfScrollView addSubview:cash];
        
        __block CGFloat blockHeight = FRAMEHEIGHT;
        __weak UIScrollView *blcokScroll = SelfScrollView;
        __weak CashView *csh = cash;
        cash.blockNub = ^(NSInteger nub)
        {
            if (nub==99||nub==3)
            {
                blcokScroll.contentSize = CGSizeMake(UIScreenWIDTH,185*ScaleX+690*ScaleY+40*ScaleX);
                csh.frame = CGRectMake(0, 185*ScaleX,UIScreenWIDTH,690*ScaleY+40*ScaleX);
            }
            else if (nub==100)
            {
                blcokScroll.contentSize = CGSizeMake(UIScreenWIDTH,185*ScaleX+400*ScaleY+40*ScaleX);
                csh.frame = CGRectMake(0, 185*ScaleX,UIScreenWIDTH,400*ScaleY+40*ScaleX);
            }
            else
            {
                blcokScroll.contentSize = CGSizeMake(UIScreenWIDTH,blockHeight-185*ScaleX);
                csh.frame = CGRectMake(0, 185*ScaleX,UIScreenWIDTH,blockHeight-185*ScaleX);
            }

        };
    }
    return self;
}

- (void)GETView:(NSInteger)nub
{
    [self getCurrent:selctedNub].hidden=YES;
    selctedNub = nub;
    [self getCurrent:nub].hidden = NO;
    
}
- (UIView *)getCurrent:(NSInteger)nub
{
    SelfScrollView.contentSize = CGSizeMake(UIScreenWIDTH,FRAMEHEIGHT-185*ScaleX);
    cash.frame = CGRectMake(0, 185*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-185*ScaleX);
    
    if (nub==1)
    {
     [cash Click:nil];
     return cash;
    }
    
    return nil;
}
@end
