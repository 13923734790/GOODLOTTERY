//
//  PullDownMenuAppearance.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^PullDownMenuResult)(NSString * TitleString);

@interface PullDownMenuAppearance : NSObject

@property (nonatomic, copy) PullDownMenuResult  resultCallBack;
//这里可以写属性。。。。。
@end
