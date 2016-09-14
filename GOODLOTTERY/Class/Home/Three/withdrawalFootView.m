//
//  withdrawalFootView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "withdrawalFootView.h"

@implementation withdrawalFootView
{
    UILabel *ThingLable;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        ThingLable = [[UILabel alloc]init];
        ThingLable.numberOfLines = 0;
        ThingLable.textColor = [UIColor whiteColor];
        ThingLable.font = [UIFont systemFontOfSize:12*ScaleY];
        ThingLable.frame = CGRectMake(5, 0, UIScreenWIDTH-10,100*ScaleY);
        NSString *Stringtext = @"优惠流水审核:通过优惠流水审核!不需要扣除存款优惠!\n常态性流水审核:通过常态流水审核!\n优惠流水审核+常态流水审核+手续费(50.00)共需扣除:50\n此次出款时间为:2016-04-19 18:00:06";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:Stringtext];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:3];//调整行间距
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [Stringtext length])];
        ThingLable.attributedText = attributedString;
        [self addSubview:ThingLable];
        
        _ContinueBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _ContinueBt.frame = CGRectMake(5, 100*ScaleY, UIScreenWIDTH-10, 45*ScaleY);
        _ContinueBt.layer.cornerRadius = 5;
        _ContinueBt.layer.masksToBounds = YES;
        [_ContinueBt setTitle:@"我要继续出款" forState:UIControlStateNormal];
        [_ContinueBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _ContinueBt.backgroundColor = GETCOLOR(@"blr");
        [self addSubview:_ContinueBt];
        
    }
    return self;
}
@end
