//
//  EaseLoadingView.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface EaseLoadingView : UIView
@property (strong, nonatomic) UIImageView *loopView, *monkeyView;
@property (assign, nonatomic, readonly) BOOL isLoading;
- (void)startAnimating;
- (void)stopAnimating;

@end
