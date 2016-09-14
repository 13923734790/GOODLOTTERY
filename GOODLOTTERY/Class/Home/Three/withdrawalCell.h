//
//  withdrawalCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface withdrawalCell : UITableViewCell
@property(nonatomic,assign)NSInteger IndexNub;
@property(nonatomic)BOOL isHiddenCell;
@property(nonatomic,strong)void(^BlockCellID)(NSInteger NubID,BOOL isHiddenCell);
- (void)setAllViewFram:(NSInteger)Nub;

@end
