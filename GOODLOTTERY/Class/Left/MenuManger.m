//
//  MenuManger.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MenuManger.h"

static id instance = nil;
@implementation MenuManger
+(instancetype)ShareMenuManger
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
@end
