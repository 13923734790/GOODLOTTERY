//
//  CatchCheckView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LotteryCheckHeardView;
@interface CatchCheckView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)void(^SeletedCell)(NSString *string);
@property (nonatomic, strong)LotteryCheckHeardView *heardView ;
@end
