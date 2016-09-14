//
//  UserListView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)void(^blcokpushView)(NSString *TitleString);
@end
