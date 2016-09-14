//
//  AnnouncementCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AnnouncementCell.h"

@implementation AnnouncementCell
{
    UILabel *TimeLable;
    UILabel *TitleLable;
    UILabel *detailedLable;
    UIView *BackView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        BackView =[[UIView alloc]init];
        BackView.backgroundColor = GETCOLOR(@"b0.3w");
        [self.contentView addSubview:BackView];
        
        
        TimeLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, UIScreenWIDTH-20,10*ScaleY)];
        TimeLable.textColor = GETCOLOR(@"wb");
        TimeLable.font = [UIFont systemFontOfSize:10*ScaleY];
        [BackView addSubview:TimeLable];
        
        TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5,10+10*ScaleY, UIScreenWIDTH-20, 15*ScaleY)];
        TitleLable.textColor = GETCOLOR(@"wb");;
        TitleLable.font = [UIFont systemFontOfSize:13*ScaleY];
        [BackView addSubview:TitleLable];
        
        detailedLable = [[UILabel alloc]init];
        detailedLable.textColor = GETCOLOR(@"wb");;
        detailedLable.numberOfLines = 0;
        detailedLable.font = [UIFont systemFontOfSize:13*ScaleY];
        [BackView addSubview:detailedLable];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setTimeString:(NSString *)TimeString
{
    _TimeString = TimeString;
    TimeLable.text = _TimeString;
}
-(void)setTitleString:(NSString *)TitleString
{
    _TitleString = TitleString;
    TitleLable.text = _TitleString;
}

-(void)setDetailedString:(NSString *)DetailedString
{
    _DetailedString = DetailedString;
    detailedLable.text = _DetailedString;
    CGSize size1 = [DetailedString sizeWithStringAndfont:detailedLable.font AndLableSize:CGSizeMake(UIScreenWIDTH-20, 8000)];
    detailedLable.frame = CGRectMake(10, 20+25*ScaleY, size1.width, size1.height+10);
    
}
-(void)setIsHiddenCell:(BOOL)isHiddenCell
{
    _isHiddenCell = isHiddenCell;
    detailedLable.hidden = _isHiddenCell;
    if (isHiddenCell)
    {
        BackView.frame = CGRectMake(0, 0,UIScreenWIDTH,20+25*ScaleY);
    }
    else
    {
        BackView.frame = CGRectMake(0, 0,UIScreenWIDTH,20+25*ScaleY+detailedLable.frame.size.height);
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
