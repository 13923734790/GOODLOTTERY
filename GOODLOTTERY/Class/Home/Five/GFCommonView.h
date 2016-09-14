//
//  GFCommonView.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFCommonView : UIView

@property(nonatomic,copy)NSString *titleName;
@property(nonatomic,strong)NSArray *quickArray;//快速选择
@property(nonatomic)NSInteger startBallNub;
@property(nonatomic)NSInteger  allBallNub;
@property(nonatomic,strong)NSArray *objArray;
@property(nonatomic)BOOL isHaveClodHot;
@property(nonatomic,strong)NSArray *coldHotArray;
@property(nonatomic,strong)void(^BlockColdHot)(NSString *Clodhot);
@property(nonatomic,strong)void(^BlcokSeletedArray)(NSArray *SeletedArray);
@end
