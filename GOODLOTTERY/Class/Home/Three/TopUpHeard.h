//
//  TopUpHeard.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopUpHeard : UIView
@property(nonatomic, strong)void(^blcokPushNub)(NSInteger nub);
@property(nonatomic, strong)void(^blockUpdataTableView)(NSInteger nub);
@end
