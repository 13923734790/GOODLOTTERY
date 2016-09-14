//
//  DragonTigerView.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DragonTigerBt;

typedef NS_ENUM(NSInteger,DragonTigerBtkind) {
    DragonTigerBtTwo = 99,
    DragonTigerBtThree,
};

@interface DragonTigerView : UIView
 
@property(nonatomic,strong)UILabel *TitleLable;
@property(nonatomic,strong)DragonTigerBt *leftBt;
@property(nonatomic,strong)DragonTigerBt *MiddleBt;
@property(nonatomic,strong)DragonTigerBt *rightBt;


@property(nonatomic,strong)void(^blockSeletedArray)(NSArray *array);
-(instancetype)initWithFrame:(CGRect)frame AndStyle:(DragonTigerBtkind)DragonTigerKindstyle;

@end
