//
//  PromotedView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PromotedView.h"
#import "TGlogon.h"
#import "TGmanage.h"

@interface PromotedView()
@property(nonatomic, strong)UISegmentedControl *SegMent;
@property(nonnull, strong)TGlogon *TglogonView;
@property(nonnull, strong)TGmanage *TgmanageView;
@end
@implementation PromotedView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self SetView];
        [self UpdataImageAndTxtColor];
    }
    return self;
}
- (void)SetView
{
    _SegMent = [[UISegmentedControl alloc]initWithItems:@[@"推广注册",@"推广管理"]];
    _SegMent.frame = CGRectMake(10*ScaleX, 10*ScaleY,UIScreenWIDTH-20*ScaleX,45*ScaleY);
    [_SegMent setSelectedSegmentIndex:0];
    [_SegMent addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_SegMent];
    
    _TglogonView = [[TGlogon alloc]initWithFrame:CGRectMake(0,65*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-65*ScaleY)];
    [self addSubview:_TglogonView];
    

    _TgmanageView = [[TGmanage alloc]initWithFrame:CGRectMake(0,65*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-65*ScaleY)];
    _TgmanageView.backgroundColor = [UIColor orangeColor];
    _TgmanageView.hidden = YES;
    [self addSubview:_TgmanageView];

    
}

- (void)change:(id)sender
{
    UISegmentedControl *ctrl = (UISegmentedControl *)sender;
    if ( ctrl.selectedSegmentIndex)
    {
        _TglogonView.hidden = YES;
        _TgmanageView.hidden = NO;
    }
    else
    {
        _TglogonView.hidden = NO;
        _TgmanageView.hidden = YES;
    }
}

-(void)UpdataImageAndTxtColor
{
    
    self.backgroundColor = GETCOLOR(@"cw");
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:GETCOLOR(@"wg"),NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    NSDictionary *dic2= [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    [_SegMent setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    [_SegMent setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    _SegMent.tintColor = GETCOLOR(@"bgg");

    
   }
@end

