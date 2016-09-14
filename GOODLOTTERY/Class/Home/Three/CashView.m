//
//  CashView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashView.h"
#import "CashSubViewOne.h"
#import "CashSubViewTwo.h"
#import "CashSubViewThree.h"

@implementation CashView
{
    NSInteger BtNub;
    CashSubViewOne *Oneview;
    CashSubViewTwo *Twoview;
    CashSubViewThree *Threeview;
   __block BOOL  isOnsize;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
        UIImageView *SignImage = [[UIImageView alloc]initWithFrame:CGRectMake((UIScreenWIDTH/4-15*ScaleX)/2, -15*ScaleX, 15*ScaleX, 15*ScaleX)];
        SignImage.image = [UIImage imageNamed:@"CashImage9"];
        [self addSubview:SignImage];
        [self SetAllView];
        
    }
    return self;
}

- (void)SetAllView
{
    NSArray *array1 = @[@"第三方",@"公司入款",@"微信入款"];
    BtNub = 1;
    for (int i = 0; i<3; i++)
    {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(UIScreenWIDTH/3*i, 0,UIScreenWIDTH/3,40*ScaleY);
        [bt setTitle:array1[i] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bt setTitleColor:GETCOLOR(@"blr") forState:UIControlStateSelected];
        [bt setBackgroundColor:[UIColor whiteColor]];
        bt.tag = 100+i;
        if (BtNub ==i+1)
        {
            bt.selected = YES;
            bt.backgroundColor =DTAISCOLORE(203, 203, 203, 1);
        }
        [bt addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
    }
    
    
    
    Oneview = [[CashSubViewOne alloc]initWithFrame:CGRectMake(0, 40*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-40*ScaleY)];
    
    [self addSubview:Oneview];
    
    Twoview = [[CashSubViewTwo alloc]initWithFrame:CGRectMake(0, 40*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-40*ScaleY)];
    Twoview.hidden = YES;
    CashView *BlockSelf = self;
    Twoview.blockNub = ^(NSInteger nub)
    {
         isOnsize = YES;//标记scrollView 已经改变了长的contensize。
        if (BlockSelf.blockNub)
            {
               BlockSelf.blockNub(nub);
            }

    };
    [self addSubview:Twoview];
    
    Threeview = [[CashSubViewThree alloc]initWithFrame:CGRectMake(0, 40*ScaleY,UIScreenWIDTH,690*ScaleY+40*ScaleX)];
    Threeview.hidden = YES;
    Threeview.blockThree = ^(NSString *ThreeId)
    {
        if (BlockSelf.blockNub)
        {
            BlockSelf.blockNub(100);
        }

    };
    [self addSubview:Threeview];
    
}
- (void)Click:(UIButton *)bt
{
     NSInteger nub;
    if (bt==nil) nub = 100;else nub = bt.tag;
    if (nub!=BtNub)
    {
        UIButton *but1 = [self viewWithTag:99+BtNub];
        but1.backgroundColor = [UIColor whiteColor];
        [self Return:BtNub].hidden = YES;
        but1.selected = NO;
        BtNub = nub-99;
        [self Return:BtNub].hidden = NO;
        UIButton *but2 = [self viewWithTag:99+BtNub];
        but2.selected = YES;
        but2.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
        
    }
    
    
    if (_blockNub)
    {
        if (BtNub==2&& isOnsize)
        {
             _blockNub(99);
        }
        else
        {
             _blockNub(BtNub);
        }
    }
}

- (UIView *)Return:(NSInteger)nub
{
    if (nub==1) return Oneview;
    if (nub==2) return Twoview;
    if (nub==3) return Threeview;
    return nil;
}
@end
