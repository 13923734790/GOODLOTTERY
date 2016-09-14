//
//  InOutBoxView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InOutBoxView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
- (instancetype)initWithFrame:(CGRect)frame AndName:(NSString *)name;
@property(nonatomic)NSInteger InoutInt;
@end
