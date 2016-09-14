//
//  XYCommonView.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCommonView : UIView

@property(nonatomic,copy)NSString *TitleName;
@property(nonatomic,strong)NSArray *SubTitleArray;

@property(nonatomic,strong)NSArray *OneFaceArray;
@property(nonatomic)NSInteger OneWidthFaceNub;//       两面width方向个数
@property(nonatomic)CGFloat OnehieghtOddwidth;//       高宽之比


@property(nonatomic,strong)NSArray *TwoFaceArray;
@property(nonatomic)NSInteger TwoWidthFaceNub;//       两面width方向个数
@property(nonatomic)CGFloat TwohieghtOddwidth;//       高宽之比



@property(nonatomic)BOOL IsThreeColorBall;  //      是否为三色球
@property(nonatomic)NSInteger WidthBallNub;//       球的width方向个数
@property(nonatomic)NSInteger BallstartNub;
@property(nonatomic)NSInteger BallNub;



@property(nonatomic,strong)void(^BlcokSeletedArray)(NSArray *SeletedArray);

@end
