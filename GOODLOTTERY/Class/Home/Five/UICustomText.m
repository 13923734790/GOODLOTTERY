//
//  UICustomText.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UICustomText.h"

@implementation UICustomText

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor whiteColor];
        self.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self setBackground:[UIImage imageNamed:@"NubbackImageKing2"]];
        self.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return self;
}
//显示文本位置

-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width-15, bounds.size.height);
    return inset;
}
//编辑文本位子
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width-15, bounds.size.height);
    return inset;
}
@end