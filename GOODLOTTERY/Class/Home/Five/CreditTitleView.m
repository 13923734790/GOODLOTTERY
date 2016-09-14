//
//  CreditTitleView.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CreditTitleView.h"

@implementation CreditTitleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Click)];
        [self addGestureRecognizer:top];
    }
    return self;
}

-(void)Click
{
    self.hidden = YES;
}
-(void)setTitleArray:(NSArray *)TitleArray
{
    _TitleArray = TitleArray;
    
    if (TitleArray.count!=1)
    {
        for (int i = 0; i<_TitleArray.count; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(UIScreenWIDTH/5*(i%5), UIScreenWIDTH/5/2*(i/5),UIScreenWIDTH/5,UIScreenWIDTH/5/2);
            button.layer.borderColor = [UIColor grayColor].CGColor;
            button.layer.borderWidth = 1;
            button.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
            [button setTitle:_TitleArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = DTAISCOLORE(0, 0, 0, 0.8);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self addSubview:button];
        }
    }
    
}
-(void)Click:(UIButton *)bt
{
    if (_BlockTitleString)
    {
        _BlockTitleString(bt.currentTitle);
    }
}
@end
