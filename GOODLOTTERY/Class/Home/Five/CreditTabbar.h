//
//  CreditTabbar.h
//  GOODLOTTERY
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditTabbar : UIView

@property (strong, nonatomic)  UIButton *rulesBt;
@property (strong, nonatomic)  UISlider *sliderBt;
@property (strong, nonatomic)  UILabel  *OddLable;
@property (strong, nonatomic)  UIButton *AddBt;
@property (strong, nonatomic)  UIButton *CutBt;

@property (nonatomic, strong)void(^BlcokOdd)(NSString *OddString);

@end
