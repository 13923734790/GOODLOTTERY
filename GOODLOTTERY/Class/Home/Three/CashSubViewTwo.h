//
//  CashSubViewTwo.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashSubViewTwo : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)void (^blockNub)(NSInteger);
@end
