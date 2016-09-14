//
//  DragonTigerCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DragonTigerKind) {
    DragonTigerTwo = 99,
    DragonTigerThree,
};
@interface DragonTigerCell : UITableViewCell
@property(nonatomic,strong)NSString *TitleString;
@property(nonatomic)DragonTigerKind DragonTigerStyle;
@property(nonatomic)NSInteger NubCount;

@property(nonatomic,strong)NSMutableArray *seletedArray;
-(void)setAllBt;

@end
