//
//  MarkSixModel.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MarkSixModel.h"

@implementation MarkSixModel

+(instancetype)ShareMarkSix
{
    static dispatch_once_t onceToken;
    static id instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDatas];
    }
    return self;
}

-(void)initDatas
{
    _OddString = @"3.3";
}
@end
