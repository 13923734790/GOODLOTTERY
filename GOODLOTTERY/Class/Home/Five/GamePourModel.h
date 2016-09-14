//
//  GamePourModel.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePourModel : NSObject
@property(nonatomic,strong)NSArray *BugKeyArray;
@property(nonatomic,strong)NSArray *DigitArray;
@property(nonatomic, strong)NSArray *OptionsArray;//非数字的内容
@property(nonatomic, strong)NSArray *OptionsArrays;//非数字的内容多个数组
@property(nonatomic)NSInteger  BallNub;//球的总数
@property(nonatomic)NSInteger StartNub;//起始球号
@property(nonatomic)BOOL IsHeardlable;//冷热度开关
@property(nonatomic)NSInteger KindShape;//UI类型 
@property(nonatomic, strong)NSString *ShapeString;
@end
