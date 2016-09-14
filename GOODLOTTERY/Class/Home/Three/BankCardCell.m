//
//  BankCardCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankCardCell.h"

@implementation BankCardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

        for (int i = 0; i<4; i++)
        {
            
            if (i==3)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake((UIScreenWIDTH/4+0.5)*i,0,UIScreenWIDTH/4-0.5,39*ScaleY);
                [button setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                button.backgroundColor = GETCOLOR(@"b0.3w");
                [button addTarget:self action:@selector(ClickPull) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                
            }
            else
            {
                UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH/4+0.5)*i,0,UIScreenWIDTH/4-0.5,39*ScaleY)];
                
                lable.tag = 100+i;
                [self AttributeLable:lable];
//                lable.textColor = GETCOLOR(@"wb");
//                lable.backgroundColor = GETCOLOR(@"b0.3w");
//                lable.font = [UIFont systemFontOfSize:13*ScaleY];
//                lable.textAlignment = NSTextAlignmentCenter;
                [self addSubview:lable];
            }
        }
        
    }
    
    _PullBackView = [[UIView alloc]initWithFrame:CGRectMake(0,40,UIScreenWIDTH,50*ScaleY)];
    _PullBackView.hidden = YES;
    
    
    NSArray *Lb1Array = @[@"卡号",@"绑定时间"];
    for (int i = 0; i<2; i++)
    {
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,25*ScaleY*i,UIScreenWIDTH/4,24.5*ScaleY)];
        [_PullBackView addSubview:lable1];
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+0.5,25*ScaleY*i,UIScreenWIDTH*3/4-0.5,24.5*ScaleY)];
        [_PullBackView addSubview:lable2];
        lable1.text = Lb1Array[i];
        
        lable2.tag = 200+i;
        [self AttributeLable:lable1];
        [self AttributeLable:lable2];
    }
    
    
    
    [self addSubview:_PullBackView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self Updatas:nil];
    return self;
}

- (void)AttributeLable:(UILabel *)Lb
{
    Lb.textColor = GETCOLOR(@"wb");
    Lb.backgroundColor = GETCOLOR(@"b0.3w");
    Lb.font = [UIFont systemFontOfSize:13*ScaleY];
    Lb.textAlignment = NSTextAlignmentCenter;
    
}
- (void)ClickPull
{
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
}
- (void)Updatas:(NSArray *)array
{
     NSArray *array1 = @[@"君亦在",@"中国工商银行",@"正常"];
    for (int i = 0; i<4; i++)
    {
        if (i==3)
        {
        }
        else
        {
            UILabel *lable = [self viewWithTag:100+i];
            lable.text = array1[i];
        }
    }
    
    
    UILabel *bankNub = (UILabel *)[self viewWithTag:200];
    NSString *string = [@"1234567891234567891" stringByReplacingCharactersInRange:NSMakeRange(4, 11) withString:@"************"];
    bankNub.text = string;
    UILabel *BdTime = (UILabel *)[self viewWithTag:201];
    BdTime.text = @"2015-05-09 23:16:30";
    

}

- (void)ClickPull:(UIButton *)bt
{
    
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
    
}

@end
