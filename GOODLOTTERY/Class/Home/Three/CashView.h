//
//  CashView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashView : UIView
@property(nonatomic,strong)void (^blockNub)(NSInteger);
- (void)Click:(UIButton *)bt;
@end
