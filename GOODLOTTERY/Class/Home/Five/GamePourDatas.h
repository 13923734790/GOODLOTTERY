//
//  GamePourDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GamePourModel;

@interface GamePourDatas : NSObject

//+(GamePourModel *)returnDatas:(NSDictionary *)dic;
//+(GamePourModel *)returnBjHappyDatas:(NSDictionary *)dic;
//+(GamePourModel *)returnJSKSDatas:(NSDictionary *)dic;
//+(GamePourModel *)returnElevenTofiveDatas:(NSDictionary *)dic;
+(GamePourModel *)Gamename:(NSString *)NameString And:(NSDictionary *)dic;
@end
