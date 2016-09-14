//
//  blackAndwhiteLable.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "blackAndwhiteLable.h"

@implementation blackAndwhiteLable
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.textColor = GETCOLOR(@"wb");
        self.font = [UIFont systemFontOfSize:13*ScaleY];
    }
    return self;
}
@end
