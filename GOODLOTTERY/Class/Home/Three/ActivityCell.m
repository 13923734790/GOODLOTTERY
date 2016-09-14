//
//  ActivityCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        for (int i = 0; i<5; i++)
        {
            
            if (i==4)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(((UIScreenWIDTH-4)/5+1)*i,0,(UIScreenWIDTH-4)/5,40*ScaleY-1);
                [button setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                button.backgroundColor = GETCOLOR(@"b0.3w");
                [button addTarget:self action:@selector(ClickPull) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                
            }
            else
            {
                UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-4)/5+1)*i,0,(UIScreenWIDTH-4)/5,40*ScaleY-1)];
                
                lable.tag = 100+i;
                [self AttributeLable:lable];
                lable.textColor = GETCOLOR(@"yr");
                [self addSubview:lable];
            }
        }
        
    }
    
    _PullBackView = [[UIView alloc]initWithFrame:CGRectMake(0,40*ScaleY,UIScreenWIDTH,75*ScaleY)];
    _PullBackView.hidden = YES;
    
    
    NSArray *Lb1Array = @[@"活动状态",@"备注",@"创建时间"];
    for (int i = 0; i<3; i++)
    {
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,25*ScaleY*i,(UIScreenWIDTH)/2,24.5*ScaleY)];
        [_PullBackView addSubview:lable1];
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH)/2,25*ScaleY*i,(UIScreenWIDTH)/2,24.5*ScaleY)];
        [_PullBackView addSubview:lable2];
        lable1.text = Lb1Array[i];
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
    NSArray *array1 = @[@"注册送8元",@"0",@"0",@"nil"];
    for (int i = 0; i<5; i++)
    {
        if (i==4)
        {
        }
        else
        {
            UILabel *lable = [self viewWithTag:100+i];
            lable.text = array1[i];
        }
    }
    
}

- (void)ClickPull:(UIButton *)bt
{
    
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
    
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    NSArray *array1 = @[@"充值活动",@"10000.00",@"审核通过",@"2016/2/25\n1:30:15"];
//    if (self)
//    {
//        for (int i = 0; i<5; i++)
//        {
//            if (i==4)
//            {
//                button = [UIButton buttonWithType:UIButtonTypeCustom];
//                button.frame = CGRectMake(1+(1+(UIScreenWIDTH-6)*2/9)*i,0,(UIScreenWIDTH-6)/9,35*ScaleY-1);
//                button.backgroundColor = GETCOLOR(@"b0.3w");
//                button.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
//                [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
//                [button setTitle:@"领取" forState:UIControlStateNormal];
//                [button setTitleColor:DTAISCOLORE(27, 87, 183,1) forState:UIControlStateNormal];
//                [self addSubview:button];
//            }
//            else
//            {
//                UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(1+(1+(UIScreenWIDTH-6)*2/9)*i,0,(UIScreenWIDTH-6)*2/9,35*ScaleY-1)];
//                lable1.backgroundColor = GETCOLOR(@"b0.3w");
//                [self addSubview:lable1];
//            lable1.textAlignment = NSTextAlignmentCenter;
//            if (i==0||i==3) lable1.textColor = GETCOLOR(@"wb");
//            if (i==1) lable1.textColor = [UIColor redColor];
//            if (i==2) lable1.textColor = DTAISCOLORE(71, 133, 27, 1);
//            lable1.numberOfLines = 0;
//            lable1.font = [UIFont systemFontOfSize:13*ScaleY];
//            lable1.text = array1[i];
//            }
//        }
//    }
//    return self;
//}
//
//- (void)Click:(UIButton *)bt
//{
//}
@end
