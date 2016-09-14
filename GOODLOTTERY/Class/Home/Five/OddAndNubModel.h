//
//  OddAndNubModel.h
//  GOODLOTTERY
//
//  Created by apple on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OddAndNubModel : NSObject

+(instancetype)shareOddAndNubModel;
@property(nonatomic) CGFloat  Odd;
@property(nonatomic) NSInteger Nub;
@property(nonatomic) CGFloat price;
@end
