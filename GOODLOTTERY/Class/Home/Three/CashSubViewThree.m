//
//  CashSubViewThree.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashSubViewThree.h"
#import "CashSubViewTowSubOne.h"

@implementation CashSubViewThree
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *array2 = @[@"选择银行",@"填写金额",@"支付模式",@"充值到账"];
        for (int i = 0; i<4; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX+(UIScreenWIDTH-20*ScaleX)/4*i,10*ScaleY,(UIScreenWIDTH-20*ScaleX)/4, 20*ScaleY)];
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            if (i==1||i==2)lable.textAlignment =NSTextAlignmentCenter;
            if (i==3) lable.textAlignment = NSTextAlignmentRight;
            lable.text = array2[i];
            [self addSubview:lable];
            if (i<3)
            {
                UIButton *btView = [UIButton buttonWithType:UIButtonTypeCustom];
                btView.frame = CGRectMake(30*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,47.5*ScaleY,(UIScreenWIDTH-100*ScaleX)/3,5*ScaleX);
                
                btView.backgroundColor = DTAISCOLORE(66,66,66, 1);
                [self addSubview:btView];
            }
            
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.frame = CGRectMake(10*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,40*ScaleY,20*ScaleX,20*ScaleX);
            bt.layer.cornerRadius = 10*ScaleX;
            bt.layer.masksToBounds = YES;
            if (i==0||i==1)bt.selected =YES;
            bt.tag = 100+i;
            [bt setBackgroundImage:[UIImage imageNamed:@"progressNo1"] forState:UIControlStateNormal];
            [bt setBackgroundImage:[UIImage imageNamed:@"progressYes1"] forState:UIControlStateSelected];
            [self addSubview:bt];
        }
        
        
        CashSubViewTowSubOne * OneView = [[CashSubViewTowSubOne alloc]initWithFrame:CGRectMake(0,70*ScaleY, self.frame.size.width,self.frame.size.height)];
        OneView.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
        [self addSubview:OneView];
        
        __weak CashSubViewThree *BlockSelf = self;
        OneView.blcokDatas = ^(NSArray *array)
        {
            [BlockSelf showNewVIew];
        };
        
        
    }
    return self;
}
- (void)showNewVIew
{
    if (_blockThree)
    {
        _blockThree(@"sss");
    }
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 400*ScaleY);
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 70*ScaleY, UIScreenWIDTH, 400*ScaleY)];
    view.backgroundColor = [UIColor orangeColor];
    [self addSubview:view];
}
@end
