//
//  LotteryBarView.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryBarView : UIView
@property (nonatomic, strong)UILabel *KJRightlable;
@property (nonatomic, strong)UIButton *LeftButton;
@property (nonatomic, strong)UIView *KJView;
@property (nonatomic, strong)UIView *KJBAllView;
@property (nonatomic, strong)UIButton *KJBut;
- (void)ClickKJ:(UIButton *)btt;
@end
