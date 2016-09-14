//
//  DownListVIew.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DownListModel;

@interface DownListVIew : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic,strong)void(^BlockButtonTitle)(NSString *titleString);
- (instancetype)initWithFrame:(CGRect)frame AndModel:(DownListModel *)Model;
@end
