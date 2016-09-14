//
//  ColorKindCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ColorKindCell.h"

@implementation ColorKindCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        for (int i= 0; i<4; i++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((1+(UIScreenWIDTH-3)/4)*i,0.5,(UIScreenWIDTH-3)/4,40*ScaleY-1)];
            label.textColor = GETCOLOR(@"wb");
            label.font = [UIFont systemFontOfSize:13*ScaleY];
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = GETCOLOR(@"b0.3w");
            label.text = @"16%";
            [self addSubview:label];
        }
    }
    return self;
}
@end
