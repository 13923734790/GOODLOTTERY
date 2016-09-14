//
//  LiuHeHeXIaoCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiuHeHeXIaoCell : UITableViewCell
@property(nonatomic,copy)NSString *KindString;

@property(nonatomic,strong)NSArray *Arraytitle;

-(void)setOddstring:(NSString *)Odd;
@end
