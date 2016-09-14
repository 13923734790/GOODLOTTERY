//
//  PEHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PEHeardView.h"

@implementation PEHeardView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX, 0,UIScreenWIDTH-5*ScaleX,45*ScaleY)];
        _titleLable.textColor = GETCOLOR(@"wb");
        _titleLable.text = @"用户名:";
        [self addSubview:_titleLable];
        UIView *BackView = [[UIView alloc]initWithFrame:CGRectMake(0,45*ScaleY, UIScreenWIDTH,45*ScaleY)];
        BackView.backgroundColor = [UIColor blackColor];
        
        
        NSArray *array = @[@"返点等级",@"拥有数量",@"剩余数量",@"分配数量",@"您的配额"];
        for (int i = 0; i<5; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/5*i,0,UIScreenWIDTH/5,45*ScaleY)];
            lable.textColor = [UIColor whiteColor];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.text = array[i];
            [BackView addSubview:lable];
        }
        
        [self addSubview:BackView];
        
        
        
    }
    return self;
}

-(void)setTitlestring:(NSString *)titlestring
{
    _titlestring = titlestring;
    _titleLable.text = [_titleLable.text stringByAppendingString:_titlestring];
//    _titleLable.text = _titlestring;
}
@end
