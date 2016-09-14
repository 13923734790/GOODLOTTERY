//
//  CreditTitleView.h
//  GOODLOTTERY
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditTitleView : UIView

@property(nonatomic,strong)NSArray *TitleArray;
@property(nonatomic,strong)void(^BlockTitleString)(NSString *TitleString);
@end
