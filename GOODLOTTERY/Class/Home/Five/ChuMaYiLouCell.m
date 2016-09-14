//
//  ChuMaYiLouCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChuMaYiLouCell.h"

@implementation ChuMaYiLouCell
{
    UILabel *leftLeft;
    UILabel *rightLable;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setAllView];
    }
    return self;
}

-(void)setAllView
{    leftLeft = [[UILabel alloc]init];
     leftLeft.font = [UIFont systemFontOfSize:15*ScaleY];
     [self.contentView addSubview:leftLeft];
     rightLable = [[UILabel alloc]init];
     rightLable.font = [UIFont systemFontOfSize:15*ScaleY];
    rightLable.textAlignment = NSTextAlignmentRight;
     [self.contentView addSubview:rightLable];
    
}
-(void)layoutSubviews
{
    leftLeft.frame = CGRectMake(5*ScaleX, 0,CGRectGetWidth(self.frame)*3/4-5*ScaleX,CGRectGetHeight(self.frame));
    rightLable.frame = CGRectMake(CGRectGetWidth(self.frame)*3/4, 0,CGRectGetWidth(self.frame)/4-5*ScaleX,CGRectGetHeight(self.frame));
}

-(void)setObjString:(NSString *)ObjString
{
    _ObjString = ObjString;
    leftLeft.textColor = [UIColor yellowColor];
    leftLeft.text = ObjString;
    
}
-(void)setQiShuNub:(NSInteger)QiShuNub
{
    _QiShuNub = QiShuNub;
    rightLable.textColor = [UIColor whiteColor];
    rightLable.text = [NSString stringWithFormat:@"%ld期",_QiShuNub];

    
}
@end
