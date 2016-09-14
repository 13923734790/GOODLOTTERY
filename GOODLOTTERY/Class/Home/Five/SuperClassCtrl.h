//
//  SuperClassCtrl.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkinpeelerDelegate.h"

@class NewPickerView;
@class LotteryBarView;
@class CreditTitleView;
@interface SuperClassCtrl : UIViewController

- (void)CustomLeft:(NSString *)leftstring;
- (void)CustomRight:(NSString *)rightstring;
- (void)Maketitlebutton;
- (void)MakeLotterybarView;
-(void)setCreditTitleView;
- (void)UpdataTitleFramTitleButtonTitleString:(NSString *)string andLeftImage:(NSString *)leftString andRightImage:(NSString *)rightString;
- (void)setPickerone:(NSInteger)left andMiddle:(NSInteger)middle and:(NSInteger)right and:(NSArray *)ModelArray;



@property(nonatomic)BOOL Blockhidden;
@property (nonatomic, strong)UIButton *TitleView;
@property (nonatomic, strong)UIButton *pickerButton;
@property (nonatomic, strong)NewPickerView *newpickerView;
@property (nonatomic, strong)CreditTitleView *creditTitleView;
@property (nonatomic, strong) UIImageView *iamgeView;
@property (nonatomic, strong)UIButton *leftButton;
@property (nonatomic, strong)LotteryBarView *lotterybarView;
@property (nonatomic, assign) id<SkinpeelerDelegate>Skindelegate;

@end

