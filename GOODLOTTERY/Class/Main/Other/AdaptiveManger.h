//
//  AdaptiveManger.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdaptiveManger : NSObject
+(instancetype)ShareManger;
@property float autoSizeScaleX;
@property float autoSizeScaleY;
@property (nonatomic, copy)NSString *IphoneName;
@end
