//
//  ChangeDataView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangeDataView.h"
#import "UICustomText.h"

@implementation ChangeDataView
{
    UIButton *_button;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSArray *array = @[@"用户名称:",@"用户手机:",@"真实姓名:",@"用户邮箱:",@"用户QQ:"];
    if (self)
    {
        for (int i = 0; i<5; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleY,100*ScaleY+(75*ScaleY*i),80*ScaleX,45)];
            UICustomText *field = [[UICustomText alloc]initWithFrame:CGRectMake(110*ScaleX,100*ScaleY+(75*ScaleY*i),210*ScaleX, 45*ScaleY)];
            lable.textColor = [UIColor whiteColor];
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.textAlignment = NSTextAlignmentCenter;
            [self addSubview:lable];
            [self addSubview:field];
            lable.text = array[i];
            
        }
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(15*ScaleX,FRAMEHEIGHT-90*ScaleY,UIScreenWIDTH-30*ScaleX,50*ScaleY);
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"确认修改" forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:[SkinPeelerTool UpdatasCurrent][0]] forState:UIControlStateNormal];
        [self addSubview:_button];
        
    }
    return self;
}
@end
