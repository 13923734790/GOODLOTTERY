//
//  GFCommonDSView.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonDSView.h"

@implementation GFCommonDSView
{
    UITextView *OddField;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAllView];
        
    }
    return self;
}

-(void)setAllView
{
    
    OddField = [[UITextView alloc]initWithFrame:CGRectMake(5*ScaleX,5*ScaleY, UIScreenWIDTH-10*ScaleX,CGRectGetHeight(self.frame)-70*ScaleY)];
    
    OddField.backgroundColor = [UIColor orangeColor];
    OddField.scrollEnabled = NO;
    OddField.editable = YES;
    OddField.font  = [UIFont systemFontOfSize:13*ScaleY];
    OddField.textColor = [UIColor whiteColor];
    OddField.delegate = self;
    [self addSubview:OddField];
    
    
    
    UILabel *TishiLable = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX,OddField.frame.size.height+10*ScaleY,UIScreenWIDTH-10*ScaleX,20*ScaleY)];
    TishiLable.textColor = [UIColor whiteColor];
    TishiLable.font = [UIFont systemFontOfSize:11*ScaleX];
    TishiLable.text = @"每注号码之间请用一个英文逗号[,]空格[ ]或者英文分号[;]隔开";
    [self addSubview:TishiLable];
    
    
    
    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.frame = CGRectMake(UIScreenWIDTH/3,OddField.frame.size.height+35*ScaleY,UIScreenWIDTH*2/9,30*ScaleY);
    leftBut.backgroundColor = GETCOLOR(@"b0.6w");
    [leftBut setTitle:@"删除重复号" forState:UIControlStateNormal];
    leftBut.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
    [self addSubview:leftBut];
    
    UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBt.frame = CGRectMake(UIScreenWIDTH*5/9+20*ScaleX,OddField.frame.size.height+35*ScaleY,UIScreenWIDTH/9,30*ScaleY);
    rightBt.backgroundColor = GETCOLOR(@"b0.6w");
    rightBt.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
    [rightBt setTitle:@"清空" forState:UIControlStateNormal];
    [self addSubview:rightBt];
    
}

- (void)textViewDidChange:(UITextView *)textView{

    NSLog(@"%@",textView.text);
}


#define kAlphaNum1 @"0123456789; ,"
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    //判断是否超过 ACCOUNT_MAX_CHARS  个字符,注意要判断当string.leng>0
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum1] invertedSet];
    
    NSString *filtered =
    [[text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [text isEqualToString:filtered];
    return basic;
}

-(void)layoutSubviews
{
    
}

@end
