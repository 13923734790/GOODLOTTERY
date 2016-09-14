//
//  ReportFootView.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportFootView : UIView
@property(nonatomic)NSInteger Kind;
@property(nonatomic,strong)UIView *PullBackView;
@property (nonatomic, strong)void(^blcokpullCell)(BOOL IsHiddenView);
- (void)Uppersonnedatas:(NSArray *)array;
- (void)UpTeamdatas:(NSArray *)array;

@end
