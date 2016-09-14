//
//  OddAndNubModel.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OddAndNubModel.h"

@implementation OddAndNubModel

-(instancetype)init{
    self = [super init];
    if (self)
    {
        [self Datasdefault];
    }
    return self;
}
+(instancetype)shareOddAndNubModel
{
    static id  instance = nil;;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(void)Datasdefault
{
    _price = 2.0;
    _Odd = 1.0;
}
@end
