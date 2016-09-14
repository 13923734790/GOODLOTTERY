//
//  deepBlocklable.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "deepBlocklable.h"

@implementation deepBlocklable

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = DTAISCOLORE(0, 0, 0, 0.6);
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:13*ScaleY];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


@end
