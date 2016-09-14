//
//  shallowBL.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "shallowBL.h"

@implementation shallowBL

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = DTAISCOLORE(0, 0, 0, 0.3);
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:13*ScaleY];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
@end
