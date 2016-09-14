//
//  AllkingGameDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^datasSuccessBlock)(NSMutableArray *responseDic);
typedef void(^datasFailureBlock)(NSError *error);

@interface AllkingGameDatas : NSObject
+(NSArray *)pickerViewAllDatas:(NSString *)NameString ;

+(void)pickerViewAllDatas:(NSString *)NameString success:(datasSuccessBlock)success failure:(datasFailureBlock)failure;

@end
