//
//  SkinpManger.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SkinpManger.h"

@implementation SkinpManger
+(instancetype)ShareSkinpManger
{
    
    static dispatch_once_t once;
    static id instance = nil;
    
    dispatch_once(&once, ^{
        instance = [[self alloc]init];
  });
    return instance;
}
@end
