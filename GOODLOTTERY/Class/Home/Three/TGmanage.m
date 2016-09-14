//
//  TGmanage.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TGmanage.h"

@implementation TGmanage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",@"恭喜发财"];
    
    CGSize cSize = [@"恭" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:rect.size.height/8]}];
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = (rect.size.width-cSize.width)/2;
        pY = rect.size.height/4*i;
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:rect.size.height/8]}];
    }
    
    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //设置线条宽度
//    CGContextSetLineWidth(context, kLineWidth);
    
//    //绘制干扰线
//    for (int i = 0; i < kLineCount; i++)
//    {
//        UIColor *color = kRandomColor;
//        CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
//        
//        //设置线的起点
//        pX = arc4random() % (int)rect.size.width;
//        pY = arc4random() % (int)rect.size.height;
//        CGContextMoveToPoint(context, pX, pY);
//        //设置线终点
//        pX = arc4random() % (int)rect.size.width;
//        pY = arc4random() % (int)rect.size.height;
//        CGContextAddLineToPoint(context, pX, pY);
//        //画线
//        CGContextStrokePath(context);
//    }
}

@end
