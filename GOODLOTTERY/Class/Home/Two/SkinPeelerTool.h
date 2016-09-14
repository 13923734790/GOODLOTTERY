//
//  SkinPeelerTool.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SkinPeelerTool : NSObject
+(NSArray *)UpdateLoginCtrlImage;
+(NSArray *)UpdataFPTxtColor;
+(NSArray *)UpdataSuperImage;
+(NSArray *)UpdataLotteryImage;
+(NSArray *)UpdataMenuImage;
+(NSArray *)UpdataBottomPourImage;
+(NSArray *)UpdataConfirmBetsImageAndTxtColor;
+(NSArray *)updataCatchNubCtrl;
+(NSArray *)UpdataRegisterCtrl;
+(NSArray *)UpdataCheckView;
+(NSArray *)UpdatasCurrent;

+(UIColor *)GetColor:(NSString *)string;
+(NSInteger)ReturnSkinpManger;
+(NSInteger)GetNSUserDefaultsOfNub;
@end
