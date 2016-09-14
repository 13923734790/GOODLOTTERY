//
//  BankCardView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)UIButton *button;
- (void)UpdatasImageAndColcor;
@end
