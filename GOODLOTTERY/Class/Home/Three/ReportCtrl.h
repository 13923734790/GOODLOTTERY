//
//  ReportCtrl.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SuperClassCtrl.h"

@interface ReportCtrl : SuperClassCtrl
@property(nonatomic)NSInteger kind;
@property(nonatomic, copy)NSString *TitleName;
@property(nonatomic, strong)UITableView *tableView;
@end
