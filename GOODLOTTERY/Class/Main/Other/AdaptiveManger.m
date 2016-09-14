//
//  AdaptiveManger.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AdaptiveManger.h"
static id instance = nil;
@implementation AdaptiveManger
+(instancetype)ShareManger
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
@end
