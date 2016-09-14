//
//  AuthcodeView.m
//  GoodBetKeno1
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AuthcodeView.h"
#import <UIImageView+WebCache.h>

#define CodeUrl @"http://192.168.1.10:31/Account/ValidateCode?ValidateKey=%@"

@implementation AuthcodeView
{
    UIImageView *CodeImage;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        CodeImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,FRAMEWIDTH, FRAMEHEIGHT)];
        CodeImage.userInteractionEnabled = YES;
        [self addSubview:CodeImage];
        
        [self getAuthcode];

        
    }
    return self;
}


- (void)getAuthcode
{
    
    [CodeImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CodeUrl,[self getUniqueStrByUUID]]]];

}

//获取 uuid
- (NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    _CurrentGUID = uuidString;
    return uuidString ;
}

@end
