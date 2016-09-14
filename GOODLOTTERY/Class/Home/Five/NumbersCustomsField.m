//
//  NumbersCustomsField.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NumbersCustomsField.h"

@implementation NumbersCustomsField

////显示文本位置
//-(CGRect)textRectForBounds:(CGRect)bounds
//{
//    CGRect inset = CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height);
//    return inset;
//}
//////编辑文本位子
//-(CGRect)editingRectForBounds:(CGRect)bounds
//{
//    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width-5, bounds.size.height);
//    return inset;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delegate =self;
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (_FieldType==PureDigitType)
    {
        if ([textField.text isEqualToString:@""])
        {
            textField.text = @"0";
        }
    }
    else if (_FieldType==DigitAndLetterType)
    {
    }
    
}
#define kAlphaNum1 @"0123456789"
#define kAlphaNum2 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange :( NSRange)range replacementString :( NSString *)string   // return NO to not change text
{
    //判断是否超过 ACCOUNT_MAX_CHARS  个字符,注意要判断当string.leng>0
    //的情况才行，如果是删除的时候，string.length==
    NSInteger length = textField.text.length;
    if (length==0&&[string isEqualToString:@"0"])
    {
        return NO;
    }
    if (length >= _BitNub &&  string.length >0)
    {
        return  NO;
    }
    NSCharacterSet *cs;
    if (_FieldType==PureDigitType)
    {
    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum1] invertedSet];
    }
    else if (_FieldType==DigitAndLetterType)
    {
    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum2] invertedSet];
    }
    NSString *filtered =
    [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [string isEqualToString:filtered];
    return basic;
}

@end
