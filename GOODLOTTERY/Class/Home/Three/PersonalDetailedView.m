//
//  PersonalDetailedView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PersonalDetailedView.h"


#import "blackAndwhiteLable.h"

@implementation PersonalDetailedView
{
    UILabel *TitleView;
    NSArray *array;
    NSInteger nub;
}
- (instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind
{
    NSArray *array1 = @[@"日期:",@"充值:",@"提款:",@"彩票投注:",@"彩票中奖:",@"投注返点:",@"代理返点:",@"彩票亏盈:"];
    NSArray *array2 = @[@"用户名",@"所属组",@"销售总额",@"投注返点",@"代理返点",@"实际销售总额",@"返奖总额",@"充值总额",@"提现总额",@"总盈亏"];
    self = [super initWithFrame:frame];
    if (kind==1) nub = 8,array=array1;else nub=10, array=array2;
    if (self)
    {
        for (int i = 0; i<nub; i++)
        {
            blackAndwhiteLable *lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(15*ScaleX,10*ScaleY+(10*ScaleY+20*ScaleY)*i,UIScreenWIDTH/4,20*ScaleY)];
            lable1.text = array[i];
            blackAndwhiteLable *lable2 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+20*ScaleX,10*ScaleY+(10*ScaleY+20*ScaleY)*i,UIScreenWIDTH*3/4-20*ScaleX,20*ScaleY)];
            lable2.tag = 100+i;
            [self addSubview:lable2];
            [self addSubview:lable1];
        }
    }
    [self Updatas:nil];
    [self UpdateImageAndColor];
    return self;
}
- (void)Updatas:(NSArray *)array
{
    NSArray *array1 = @[@"2016-05-09",@"0",@"0",@"1倍,元",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    for (int i = 0; i<nub; i++)
    {
        UILabel *lable = [self viewWithTag:100+i];
        lable.text =array1[i];
    }
    
}
- (void)UpdateImageAndColor
{
    self.backgroundColor = GETCOLOR(@"cw");
}

@end
