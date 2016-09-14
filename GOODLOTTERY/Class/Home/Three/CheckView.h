//
//  CheckView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)void(^SeletedCell)(NSString *string);
@property (nonatomic, strong)void(^BlockTime)(UIButton *but,NSInteger nub);
@end
