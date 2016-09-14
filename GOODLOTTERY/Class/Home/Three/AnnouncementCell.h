//
//  AnnouncementCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnouncementCell : UITableViewCell

@property(nonatomic,strong)NSString*TimeString;
@property(nonatomic,strong)NSString *TitleString;
@property(nonatomic,strong)NSString *DetailedString;
@property(nonatomic)BOOL isHiddenCell;
@end
