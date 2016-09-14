//
//  ReportHeardView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportHeardView : UIView
-(instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind;
@property(nonatomic,strong)void(^blockTime)(UIButton * but, NSInteger nub);
@end
