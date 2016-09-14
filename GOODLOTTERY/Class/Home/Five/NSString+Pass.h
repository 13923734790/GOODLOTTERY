//
//  NSString+Pass.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Pass)

//邮箱
- (BOOL)isValidEmail;
//微信
-(BOOL)isWeixinNumber;
//固定电话
-(BOOL)isStationaryNumber;
// 验证字符串是否都是手机号
- (BOOL)isValidPhoneNumber;
//全是数字
- (BOOL)isAllNumber;
//包含汉字
- (BOOL)hasChineseCharacter;
//全是数字
- (BOOL)isAllCharacter;
//字母和数字
- (BOOL)isNumberAndCharacter;
//包含表情
- (BOOL)isContainsEmoji;

// 验证信用卡号码是否正确
- (BOOL)isValidCreditCardNumber;

//身份证
- (BOOL)isValidIdentityCardNumber;

// 是否是有效密码
- (BOOL)isValidPassword;
// 是否是有效验证码
- (BOOL)isValidPassCode;
//邮箱
//-(BOOL)isValidateEmail;
//中国名字
- (BOOL)isValidChineseName;

- (BOOL)isValidCard4;
//银行卡检验
- (BOOL)isValidateBankCardNumber;
//银行卡后四位
- (BOOL) validateBankCardLastNumber;
//特殊字符
-(BOOL)isHaveSpecialSymbol;
//银行卡
- (BOOL)bankNumber;

- (CGSize)sizeWithStringAndfont:(UIFont *)font AndLableSize:(CGSize)LableSize;

//+ (BOOL) isValidNumber:(NSString*)value;

//+ (BOOL) is
@end
