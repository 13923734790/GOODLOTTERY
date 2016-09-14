//
//  PullDownCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PullDownCell.h"

@implementation PullDownCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _TextLB = [[UILabel alloc]init];
        _TextLB.textAlignment = NSTextAlignmentLeft;
        _TextLB.adjustsFontSizeToFitWidth = YES;
        _TextLB.font = [UIFont systemFontOfSize:13*ScaleY];
        
        _RightView = [[UIImageView alloc]init];
        [self.contentView addSubview:_RightView];
        [self.contentView addSubview:_TextLB];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _TextLB.frame = CGRectMake(5, 0,self.contentView.frame.size.width-20,self.contentView.frame.size.height);
    _RightView.frame = CGRectMake(self.contentView.frame.size.width-15, (self.contentView.frame.size.height-15)/2,15,15);
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
