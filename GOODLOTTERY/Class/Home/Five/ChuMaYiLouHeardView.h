//
//  ChuMaYiLouHeardView.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChuMaYiLouHeardView : UIView
@property(nonatomic,copy)NSString *leftString;
@property(nonatomic,strong)NSArray *rightArray;
@property(nonatomic,strong)void(^BlockUpdatas)(NSString *GameString);
@end
