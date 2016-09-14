//
//  MenuHeardView.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuHeardView : UIView
@property (nonatomic, strong)UIButton *heardBt;
@property (nonatomic, strong)void(^BlockTopOut)(NSInteger Nub);
@end
