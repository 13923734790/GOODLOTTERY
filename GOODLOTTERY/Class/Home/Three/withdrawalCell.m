//
//  withdrawalCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "withdrawalCell.h"
#import "deepBlocklable.h"
#import "shallowBL.h"

@implementation withdrawalCell
{
    deepBlocklable *TimeLB;
    deepBlocklable *MoneyLB;
    deepBlocklable *cheapLB;
    deepBlocklable *LB1;
    deepBlocklable *LB2;
    deepBlocklable *LB3;
    
    shallowBL *TimeStartLB;
    shallowBL *TimeEndLB;
    shallowBL *Money1LB;
    shallowBL *LB11;
    shallowBL *LB22;
    UIButton *detailsBt;

    
    UIView *TimesView;
    UIView *BetedView;
    UIView *Pass1View;
    UIView *Pass2View;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setAllView];
        [self SetHidenCell];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
    
}
- (void)setAllView
{
    TimeLB = [[deepBlocklable alloc]init];
    MoneyLB = [[deepBlocklable alloc]init];
    cheapLB = [[deepBlocklable alloc]init];
    LB1 = [[deepBlocklable alloc]init];
    LB2 = [[deepBlocklable alloc]init];
    LB3 = [[deepBlocklable alloc]init];
    [self.contentView addSubview:TimeLB];
     [self.contentView addSubview:MoneyLB];
    [self.contentView addSubview:cheapLB];
    [self.contentView addSubview:LB1];
    [self.contentView addSubview:LB2];
    [self.contentView addSubview:LB3];
    
    TimeStartLB = [[shallowBL alloc]init];
    TimeEndLB= [[shallowBL alloc]init];
    Money1LB= [[shallowBL alloc]init];
    LB11= [[shallowBL alloc]init];
    LB22= [[shallowBL alloc]init];
    detailsBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailsBt addTarget:self action:@selector(PullCellClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:TimeStartLB];
    [self.contentView addSubview:TimeEndLB];
    [self.contentView addSubview:Money1LB];
    [self.contentView addSubview:LB11];
    [self.contentView addSubview:LB22];
    [self.contentView addSubview:detailsBt];
    
    [self setALlViewDatas:nil];
    
}

- (void)setAllViewFram:(NSInteger)Nub
{
    if (Nub==2)
    {
        TimeLB.frame = CGRectMake(1, 0,(UIScreenWIDTH-6)*2/5+(UIScreenWIDTH-6)*9/50+1,39*ScaleY);
        MoneyLB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2+(UIScreenWIDTH-6)*9/50+1,0,(UIScreenWIDTH-6)*9/50,19*ScaleY);
        cheapLB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2+(UIScreenWIDTH-6)*9/50+1,20*ScaleY,(UIScreenWIDTH-6)*9/50,19*ScaleY);
        LB1.frame = CGRectMake((UIScreenWIDTH-6)*29/50+3+(UIScreenWIDTH-6)*9/50+1,0,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        LB2.frame = CGRectMake(0, 0,0,0);
        LB3.frame = CGRectMake((UIScreenWIDTH-6)*44/50+5, 0,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        {
        TimeStartLB.frame = CGRectMake(1,40*ScaleY,(UIScreenWIDTH-6)*2/5+(UIScreenWIDTH-6)*9/50+1,20*ScaleY);
        TimeEndLB.frame = CGRectMake(1,60*ScaleY,(UIScreenWIDTH-6)*2/5+(UIScreenWIDTH-6)*9/50+1,20*ScaleY);
        Money1LB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2+(UIScreenWIDTH-6)*9/50+1,40*ScaleY,(UIScreenWIDTH-6)*9/50,40*ScaleY);
        LB11.frame = CGRectMake((UIScreenWIDTH-6)*29/50+3+(UIScreenWIDTH-6)*9/50+1,40*ScaleY,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        LB22.frame = CGRectMake(0, 0,0,0);
        detailsBt.frame = CGRectMake((UIScreenWIDTH-6)*44/50+5,40*ScaleY,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        }
        TimeLB.text = @"存款时间";
        MoneyLB.text = @"存款金额";
        cheapLB.text = @"存款优惠";
        LB1.text = @"通过";
        if (Nub==1)LB2.text = @"综合打码";
        LB3.text = @"详情";
        NSLog(@"22222");

    }
    else
    {
        {
        TimeLB.frame = CGRectMake(1, 0,(UIScreenWIDTH-6)*2/5,39*ScaleY);
        MoneyLB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2,0,(UIScreenWIDTH-6)*9/50,19*ScaleY);
        cheapLB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2,20*ScaleY,(UIScreenWIDTH-6)*9/50,19*ScaleY);
        LB1.frame = CGRectMake((UIScreenWIDTH-6)*29/50+3,0,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        LB2.frame = CGRectMake((UIScreenWIDTH-6)*35/50+4, 0,(UIScreenWIDTH-6)*9/50,39*ScaleY);
        LB3.frame = CGRectMake((UIScreenWIDTH-6)*44/50+5, 0,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        }
        {
            TimeStartLB.frame = CGRectMake(1,40*ScaleY,(UIScreenWIDTH-6)*2/5,20*ScaleY);
            TimeEndLB.frame = CGRectMake(1,60*ScaleY,(UIScreenWIDTH-6)*2/5,20*ScaleY);
            Money1LB.frame = CGRectMake((UIScreenWIDTH-6)*2/5+2,40*ScaleY,(UIScreenWIDTH-6)*9/50,40*ScaleY);
            LB11.frame = CGRectMake((UIScreenWIDTH-6)*29/50+3,40*ScaleY,(UIScreenWIDTH-6)*6/50,39*ScaleY);
            LB22.frame = CGRectMake((UIScreenWIDTH-6)*35/50+4,40*ScaleY,(UIScreenWIDTH-6)*9/50,39*ScaleY);
            detailsBt.frame = CGRectMake((UIScreenWIDTH-6)*44/50+5,40*ScaleY,(UIScreenWIDTH-6)*6/50,39*ScaleY);
        }
        
        
        
        TimeLB.text = @"存款时间";
        MoneyLB.text = @"存款金额";
        cheapLB.text = @"存款优惠";
        LB1.text = @"通过";
        if (Nub==0)LB2.text = @"需扣金额";
        if (Nub==1)LB2.text = @"综合打码";
        LB3.text = @"详情";
        NSLog(@"22222");
    }
}

- (void)SetHidenCell
{
    
    //存款日期区间
    {
    TimesView = [[UIView alloc]init];
    TimesView.frame = CGRectMake(0,80*ScaleY,UIScreenWIDTH,63*ScaleY);
    TimesView.hidden = YES;
    [self.contentView addSubview:TimesView];
        
    deepBlocklable *TimeLbs = [[deepBlocklable alloc]init];
    shallowBL *TimeStarts = [[shallowBL alloc]init];
    shallowBL *TimeEnds = [[shallowBL alloc]init];
    shallowBL *TimeLeftTitles = [[shallowBL alloc]init];
    shallowBL *TimeRightTitles = [[shallowBL alloc]init];
    shallowBL *TimeLefts = [[shallowBL alloc]init];
    shallowBL *TimeRights = [[shallowBL alloc]init];
        
        TimeLbs.frame = CGRectMake(1,1*ScaleY,UIScreenWIDTH-2,20*ScaleY);
        TimeStarts.frame = CGRectMake(1,22*ScaleY,(UIScreenWIDTH-3)/2,20*ScaleY);
        TimeEnds.frame = CGRectMake((UIScreenWIDTH-3)/2+2,22*ScaleY,(UIScreenWIDTH-3)/2,20*ScaleY);
        TimeLeftTitles.frame = CGRectMake(1, 43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        TimeRightTitles.frame = CGRectMake((UIScreenWIDTH-3)/2+2,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        TimeLefts.frame = CGRectMake((UIScreenWIDTH-3)/4+1,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        TimeRights.frame = CGRectMake((UIScreenWIDTH-3)*3/4+2,43*ScaleY,(UIScreenWIDTH-3)/4, 20*ScaleY);
        TimeLbs.text = @"存款日期区间";
        TimeLeftTitles.text = @"存款金额";
        TimeRightTitles.text = @"存款优惠";
        
        [TimesView addSubview:TimeLbs];
        [TimesView addSubview:TimeStarts];
        [TimesView addSubview:TimeEnds];
        [TimesView addSubview:TimeLefts];
        [TimesView addSubview:TimeRights];
        [TimesView addSubview:TimeLeftTitles];
        [TimesView addSubview:TimeRightTitles];
    }
    //实际有效投注
    {
        
        BetedView = [[UIView alloc]init];
        BetedView.hidden = YES;
        BetedView.frame = CGRectMake(0,143*ScaleY,UIScreenWIDTH,43*ScaleY);
        [self.contentView addSubview:BetedView];
        
      deepBlocklable *BetedLbs = [[deepBlocklable alloc]init];
      shallowBL *BetedLeftLbs = [[shallowBL alloc]init];
      shallowBL *BetedRightLbs = [[shallowBL alloc]init];
        
      BetedLbs.frame = CGRectMake(1,1*ScaleY,UIScreenWIDTH-2,20*ScaleY);
      BetedLeftLbs.frame = CGRectMake(1,22*ScaleY,(UIScreenWIDTH-2)/2, 20*ScaleY);
      BetedRightLbs.frame = CGRectMake((UIScreenWIDTH-2)/2+1,22*ScaleY,(UIScreenWIDTH-2)/2,20*ScaleY);
      BetedLbs.text = @"实际有效投注额";
      BetedLeftLbs.text = @"彩票";
      [BetedView addSubview:BetedLbs];
      [BetedView addSubview:BetedLeftLbs];
      [BetedView addSubview:BetedRightLbs];
    }
    //优惠流水审核
    {
        
        Pass1View = [[UIView alloc]init];
        Pass1View.hidden = YES;
        Pass1View.frame = CGRectMake(0,186*ScaleY,UIScreenWIDTH,63*ScaleY);
        [self.contentView addSubview:Pass1View];

        deepBlocklable *Pass1Lbs = [[deepBlocklable alloc]init];
        shallowBL*Pass1NubTitles = [[shallowBL alloc]init];
        shallowBL *Pass1Nubs = [[shallowBL alloc]init];
        shallowBL *Pass1StateTitles = [[shallowBL alloc]init];
        shallowBL *Pass1States = [[shallowBL alloc]init];
        
        shallowBL *Pass1AllNubTitles = [[shallowBL alloc]init];
        shallowBL *Pass1AllNubs = [[shallowBL alloc]init];

        shallowBL *Pass1confirmTitles = [[shallowBL alloc]init];
        shallowBL *Pass1confirms = [[shallowBL alloc]init];
        
        Pass1Lbs.frame = CGRectMake(1,1*ScaleY,UIScreenWIDTH-2,20*ScaleY);
        Pass1NubTitles.frame = CGRectMake(1,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1Nubs.frame = CGRectMake((UIScreenWIDTH-3)/4+1,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1StateTitles.frame = CGRectMake((UIScreenWIDTH-3)/2+2, 22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1States.frame = CGRectMake((UIScreenWIDTH-3)*3/4+2,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        
        
        Pass1AllNubTitles.frame = CGRectMake(1,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1AllNubs.frame = CGRectMake((UIScreenWIDTH-3)/4+1,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1confirmTitles.frame = CGRectMake((UIScreenWIDTH-3)/2+2, 43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass1confirms.frame = CGRectMake((UIScreenWIDTH-3)*3/4+2,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);

        Pass1Lbs.text = @"优惠流水审核";
        Pass1NubTitles.text = @"彩票打码量";
        Pass1StateTitles.text = @"通过";
        Pass1AllNubTitles.text = @"综合打码";
        Pass1confirmTitles.text = @"是否到达";

        
        [Pass1View addSubview:Pass1Lbs];
        [Pass1View addSubview:Pass1NubTitles];
        [Pass1View addSubview:Pass1Nubs];
        [Pass1View addSubview:Pass1StateTitles];
        [Pass1View addSubview:Pass1States];
        [Pass1View addSubview:Pass1AllNubTitles];
        [Pass1View addSubview:Pass1AllNubs];
        [Pass1View addSubview:Pass1confirmTitles];
        [Pass1View addSubview:Pass1confirms];
        
    }
    //常态流水审核
    {
        
        Pass2View = [[UIView alloc]init];
        Pass2View.hidden = YES;
        Pass2View.frame = CGRectMake(0,249*ScaleY,UIScreenWIDTH,84*ScaleY);
        [self.contentView addSubview:Pass2View];
        
        deepBlocklable *Pass2Lbs = [[deepBlocklable alloc]init];
        shallowBL *Pass2NubTitles = [[shallowBL alloc]init];
        shallowBL *Pass2Nubs = [[shallowBL alloc]init];
        shallowBL *Pass2MoneyTitles = [[shallowBL alloc]init];
        shallowBL *Pass2Moneys = [[shallowBL alloc]init];
        
        shallowBL *Pass2StateTitles = [[shallowBL alloc]init];
        shallowBL *Pass2States = [[shallowBL alloc]init];
        
        shallowBL *Pass2confirmTitles = [[shallowBL alloc]init];
        shallowBL *Pass2confirms = [[shallowBL alloc]init];
    
        shallowBL *Pass2CutMoneyTitles = [[shallowBL alloc]init];
        shallowBL *Pass2CutMoneys = [[shallowBL alloc]init];
        
        
        Pass2Lbs.frame = CGRectMake(1,1*ScaleY,UIScreenWIDTH-2,20*ScaleY);
        Pass2NubTitles.frame = CGRectMake(1,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2Nubs.frame = CGRectMake((UIScreenWIDTH-3)/4+1,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2MoneyTitles.frame = CGRectMake((UIScreenWIDTH-3)/2+2, 22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2Moneys.frame = CGRectMake((UIScreenWIDTH-3)*3/4+2,22*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2StateTitles.frame = CGRectMake(1,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2States.frame = CGRectMake((UIScreenWIDTH-3)/4+1,43*ScaleY,(UIScreenWIDTH-3)/4,20*ScaleY);
        Pass2confirmTitles.frame = CGRectMake((UIScreenWIDTH-3)/2+2, 43*ScaleY,(UIScreenWIDTH-3)/3,20*ScaleY);
        Pass2confirms.frame = CGRectMake((UIScreenWIDTH-3)*5/6+2,43*ScaleY,(UIScreenWIDTH-3)/6,20*ScaleY);
        Pass2CutMoneyTitles.frame = CGRectMake(1, 64*ScaleY,(UIScreenWIDTH-2)/2,20*ScaleY);
        Pass2CutMoneys.frame = CGRectMake(1+(UIScreenWIDTH-2)/2,64*ScaleY,(UIScreenWIDTH-2)/2,20*ScaleY);

        Pass2Lbs.text = @"常态流水审核";
        Pass2NubTitles.text = @"常态打码量";
        Pass2MoneyTitles.text = @"放宽额度";
        Pass2StateTitles.text = @"通过";
        Pass2confirmTitles.text = @"只需要扣除行政费用";
        Pass2CutMoneyTitles.text = @"需要扣除金额";
        
        
        
        [Pass2View addSubview:Pass2Lbs];
        [Pass2View addSubview:Pass2NubTitles];
        [Pass2View addSubview:Pass2Nubs];
        [Pass2View addSubview:Pass2MoneyTitles];
        [Pass2View addSubview:Pass2Moneys];
        [Pass2View addSubview:Pass2StateTitles];
        [Pass2View addSubview:Pass2States];
        [Pass2View addSubview:Pass2confirmTitles];
        [Pass2View addSubview:Pass2confirms];
        [Pass2View addSubview:Pass2CutMoneyTitles];
        [Pass2View addSubview:Pass2CutMoneys];
        
    }
    
}

- (void)setHidenCellFram
{
    
    
}
- (void)setALlViewDatas:(NSArray *)datas
{
    TimeStartLB.text = @"开始:2016/05/09 17:03";
    TimeEndLB.text = @"开始:2016/05/09 17:03";
    Money1LB.text = @"3000";
    LB11.text = @"通过";
    LB22.text = @"3000";
    [detailsBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];

}

-(void)setIsHiddenCell:(BOOL)isHiddenCell
{
    _isHiddenCell = isHiddenCell;
    TimesView.hidden = _isHiddenCell;
    BetedView.hidden = _isHiddenCell;
    Pass1View.hidden = _isHiddenCell;
    Pass2View.hidden = _isHiddenCell;
}

-(void)PullCellClick:(UIButton *)Bt
{
    if (_BlockCellID)
    {
        _BlockCellID(_IndexNub,!_isHiddenCell);
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
