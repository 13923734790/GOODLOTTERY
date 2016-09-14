//
//  PersonalCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCell : UITableViewCell
@property(nonatomic,strong)UIView *PullBackView;
@property (nonatomic, strong)void(^blcokpullCell)(NSInteger IndexRow);
- (void)Updatas:(NSArray *)array;
@end
