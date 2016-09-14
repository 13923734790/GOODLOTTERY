//
//  UserListCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "blackAndwhiteLable.h"

@interface UserListCell : UITableViewCell
@property(nonatomic,strong)UIView *pullView;
@property(nonatomic,strong)NSArray *PullArray;
@property (nonatomic, strong)void(^blcokpullCell)(NSInteger IndexRow);
@property (nonatomic, strong)void(^blcokpushView)(NSString *TitleString);

@end
