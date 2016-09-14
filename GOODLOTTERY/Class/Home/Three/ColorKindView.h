//
//  ColorKindView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorKindView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@end
