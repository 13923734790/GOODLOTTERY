//
//  CommonDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommonDatas.h"

@implementation CommonDatas
+(NSArray *)GameKind
{
    NSArray *array = @[@"北京快乐8",@"江苏快三",@"重庆时时彩",@"新疆时时彩",@"天津时时彩",@"迪拜分分彩",@"迪拜五分彩",@"山东11选5",@"广东11选5",@"江西11选5",@"北京PK拾",@"福彩3D",@"排列三,五"];
    return array;
}
+(UIImage *) createImageWithColor: (UIColor *) color
{
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return myImage;
}

@end
