//
//  BankCardCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardCell : UITableViewCell
@property(nonatomic,strong)UIView *PullBackView;
@property (nonatomic, strong)void(^blcokpullCell)(NSInteger IndexRow);
- (void)Updatas:(NSArray *)array;
@end
