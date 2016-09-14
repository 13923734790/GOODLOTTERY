//
//  MailBoxCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MailBoxCell.h"

@implementation MailBoxCell
{
    UILabel *lable1;
    UILabel *lable2;
    UIButton *button;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(1, 0.5,UIScreenWIDTH,79*ScaleY)];
        backView.backgroundColor = GETCOLOR(@"b0.3w");
        [self addSubview:backView];
        lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX,5*ScaleY,UIScreenWIDTH-2,35*ScaleY)];
        lable2 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX,45*ScaleY,UIScreenWIDTH-2,35*ScaleY)];
        [self setlable:lable1];
        [self setlable:lable2];
        [backView addSubview:lable1];
        [backView addSubview:lable2];
        
//        button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(UIScreenWIDTH-80*ScaleX,0.5*ScaleY,79*ScaleX,79*ScaleX);
//        button.backgroundColor = GETCOLOR(@"b0.6group");
//        [button setTitle:@"删除" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
        
    }
    return self;
}
-(void)setlable:(UILabel *)lb
{
    lb.textColor = GETCOLOR(@"wb");
    lb.numberOfLines = 0;
    lb.adjustsFontSizeToFitWidth = YES;
    [lb sizeThatFits:CGSizeMake(UIScreenWIDTH-70*ScaleX, 35*ScaleY)];
}
- (void)Updatas:(NSArray *)array
{
    lable1.text = @"test332  2016-05-09 01:00:00";
    NSMutableAttributedString *AttString1 = [[NSMutableAttributedString alloc]initWithString:@"你已经成功充值1000000元"];
    NSRange ClolorRange1 = NSMakeRange([[AttString1 string] rangeOfString:@"值"].location+1,[[AttString1 string] rangeOfString:@"你已经成功充值1000000元"].length-[[AttString1 string] rangeOfString:@"你已经成功充值"].length);
    [AttString1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:ClolorRange1];
    [lable2 setAttributedText:AttString1];
    

}
- (void)Click:(UIButton *)bt
{
    NSLog(@"删除");
}
@end
