//
//  GameKingCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GameKingCell.h"
@implementation GameKingCell
- (void)SetAllButton
{
    
    for (int i = 0; i<_array.count; i++)
    {
        UIButton *backbutton = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4*(i%4),(_ItemHeight/2)*(i/4),UIScreenWIDTH/4,_ItemHeight/2)];
        [self.contentView addSubview:backbutton];
        
        UIButton *ImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        ImageButton.frame = CGRectMake(10*ScaleX,10*ScaleY,UIScreenWIDTH/4-20*ScaleX,UIScreenWIDTH/4-20*ScaleX);
        ImageButton.layer.cornerRadius =(UIScreenWIDTH/4-20*ScaleX)/2;
        ImageButton.layer.masksToBounds = YES;
        ImageButton.tag = 100+i;
        [ImageButton addTarget:self action:@selector(clickbt:) forControlEvents:UIControlEventTouchUpInside];
        
        [ImageButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"game%d_2",i+1]] forState:UIControlStateNormal];
        [backbutton addSubview:ImageButton];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,_ItemHeight/2-40*ScaleY,UIScreenWIDTH/4,20*ScaleY)];
        lable.text = _array[i];
        lable.tag = 200+i;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:13*ScaleY];
        lable.textColor = [UIColor whiteColor];
        [backbutton addSubview:lable];
        
    }
}

- (void)clickbt:(UIButton *)bt
{
    
    UILabel *lable = [self viewWithTag:bt.tag+100];
    if (_GameIDBlock)
    {
        _GameIDBlock(lable.text);
    }
}
@end
