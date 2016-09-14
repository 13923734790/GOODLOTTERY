//
//  CreditChangeView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LotteryCheckHeardView;
@interface CreditChangeView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic, strong)LotteryCheckHeardView *heardView ;
@end
