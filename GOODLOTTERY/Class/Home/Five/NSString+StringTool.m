//
//  NSString+StringTool.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSString+StringTool.h"

@implementation NSString (StringTool)

+ (NSString *)CurrentTime:(TimeStyle)timeStyle
{
    NSDate *dateTime = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    if (timeStyle==TimeSimpleStyle)
//    {
//        [formatter setDateFormat:@"yyyy-MM-dd"];
//    }
//    if (timeStyle==TimeCommonStyle)
//    {
//        [formatter setDateFormat:@"yyyy年MM月dd日"];
//    }
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    return [formatter stringFromDate:dateTime];
}
@end
