//
//  NSString+StringTool.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,TimeStyle)
{
    TimeSimpleStyle = 999,
    TimeCommonStyle,
};
@interface NSString (StringTool)
+ (NSString *)CurrentTime:(TimeStyle)timeStyle;
@end
