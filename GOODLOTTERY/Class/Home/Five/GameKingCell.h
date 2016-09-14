//
//  GameKingCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameKingCell : UITableViewCell
@property(nonatomic, strong)void(^GameIDBlock)(NSString *);
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,assign)CGFloat ItemHeight;
- (void)SetAllButton;

@end
