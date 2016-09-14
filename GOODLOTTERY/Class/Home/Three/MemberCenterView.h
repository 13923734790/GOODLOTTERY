//
//  MemberCenterView.h
//  GOODLOTTERY
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberCenterView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong)UIButton *heardBt;
@property (nonatomic, strong)void(^PushCtrlID)(NSString * stringID);
- (void)StartAnimotion;
@end
