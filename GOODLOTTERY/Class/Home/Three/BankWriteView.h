//
//  BankWriteView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankWriteView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UIButton *button;
@property(nonatomic,strong)UITableView *tableView;
@end
