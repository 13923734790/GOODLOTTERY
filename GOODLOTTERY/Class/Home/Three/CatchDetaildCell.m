//
//  CatchDetaildCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchDetaildCell.h"
#import "blackAndwhiteLable.h"

@implementation CatchDetaildCell
{
    blackAndwhiteLable *lable1;
    blackAndwhiteLable *lable2;
    blackAndwhiteLable *lable3;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH/3,30*ScaleY)];
        lable2 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/3, 0,UIScreenWIDTH/3, 30*ScaleY)];
        lable3 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3, 0,UIScreenWIDTH/3,30*ScaleY)];
        lable1.textAlignment = NSTextAlignmentCenter;
        lable2.textAlignment = NSTextAlignmentCenter;
        lable3.textAlignment = NSTextAlignmentCenter;
        lable3.textColor = [UIColor redColor];
        
        lable1.layer.borderColor = [UIColor grayColor].CGColor;
        lable1.layer.borderWidth = 1;
        lable2.layer.borderColor = [UIColor grayColor].CGColor;
        lable2.layer.borderWidth = 1;
        lable3.layer.borderColor = [UIColor grayColor].CGColor;
        lable3.layer.borderWidth = 1;
        [self addSubview:lable1];
        [self addSubview:lable2];
        [self addSubview:lable3];
        
    }
    [self updatas:nil];
    
    return self;
}

- (void)updatas:(NSArray *)array
{
    lable1.text = @"20161225137999";
     lable2.text = @"1倍";
     lable3.text = @"完成";
    
}
@end
