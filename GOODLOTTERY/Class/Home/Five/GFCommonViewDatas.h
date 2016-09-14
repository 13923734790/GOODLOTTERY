//
//  GFCommonViewDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFCommonViewDatas : NSObject
@property(nonatomic,strong)NSArray *BtArray;
-(void)shareQuickClick:(UIButton *)bt;
-(NSArray *)shareBallBtClick:(UIButton *)bt;
@property(nonatomic,strong)void(^BlockSeletedArray)(NSArray *seletedArray);
@end
