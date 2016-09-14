//
//  PECell.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PECell.h"

@implementation PECell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIView *BackCell = [[UIView alloc]initWithFrame:CGRectMake(0, 1, UIScreenWIDTH,39*ScaleY)];
        BackCell.backgroundColor = GETCOLOR(@"b0.3w");
        [self addSubview:BackCell];

        for (int i = 0;i<5;i++ )
        {
            if (i==3)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(UIScreenWIDTH/5*i,10*ScaleY,UIScreenWIDTH/5,20*ScaleY);
                [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"OddAndNub%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
                [BackCell addSubview:button];
            }
            else
            {
                UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/5*i,10*ScaleY,UIScreenWIDTH/5,20*ScaleY)];
                lable.textColor = GETCOLOR(@"wb");
                lable.textAlignment = NSTextAlignmentCenter;
                lable.font = [UIFont systemFontOfSize:15*ScaleY];
                lable.text = @"78787";
                [BackCell addSubview:lable];
                
            }
            
        }
    }
    
    self.backgroundColor = GETCOLOR(@"cgroup");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}
@end
