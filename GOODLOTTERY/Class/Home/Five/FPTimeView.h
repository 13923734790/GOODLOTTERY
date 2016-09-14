//
//  FPTimeView.h
//  GOODLOTTERY
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPTimeView : UIView
@property (nonatomic, strong)UIView *FPView;
@property (nonatomic, strong)UILabel *MiddleLable;
@property (nonatomic,strong)UIButton *topPullImage;

@property (nonatomic, strong)UIButton *rightBt;
@property (nonatomic, strong)UIButton *leftBt;

@property (nonatomic,strong)UIButton *pullRightBt;
@property (nonatomic,strong)UIButton *pullLeftBt;


@property (nonatomic,strong)NSArray *LeftArray;
@property (nonatomic,strong)NSArray *RightArray;
@property (nonatomic)BOOL IsChange;//是否联动

@property (nonatomic,strong)UIView *YiLouView;
@property (nonatomic,strong)NSString *GameString;
@property (nonatomic,strong)void(^blockLeftSelected)(NSString *CurrentString);
@property (nonatomic,strong)void(^blockRightSelected)(NSString *CurrentString);


-(void)SetQuestionBt;
-(void)SetPromptBt;
-(void)SetLeftPullBt;
-(void)setRightPullBt;
-(void)setYiLouPaiHanView;


- (void)UpdataImageTextColor;
@end
