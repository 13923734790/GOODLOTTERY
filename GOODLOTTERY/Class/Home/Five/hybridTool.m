//
//  hybridTool.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "hybridTool.h"

@implementation hybridTool
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
