//
//  MenuCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setCellview];
    }
//    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return self;
}

- (void)setCellview
{
     CGFloat cellHeight =(UIScreenHEIGHT -UIScreenWIDTH*3/4/3-(15+5+5+40+20+10)*ScaleY)/10;
    
    cellHeight = cellHeight*3/4;
    
    _BackView = [[UIView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH*3/4, cellHeight)];
    [self addSubview:_BackView];
    
    _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(50*ScaleX,(cellHeight-30*ScaleY)/2,30*ScaleY,30*ScaleY)];
    [_BackView addSubview:_leftImage];
    _TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(70*ScaleX, (cellHeight-20*ScaleY)/2, UIScreenWIDTH*3/4-70*ScaleX, 20*ScaleY)];
    _TitleLable.textColor = [UIColor whiteColor];
    _TitleLable.textAlignment = NSTextAlignmentCenter;
    [_BackView addSubview:_TitleLable];
}
@end
