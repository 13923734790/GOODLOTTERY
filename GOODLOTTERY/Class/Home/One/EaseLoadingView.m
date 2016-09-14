//
//  EaseLoadingView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "EaseLoadingView.h"
#import "Masonry.h"

@interface EaseLoadingView ()
@property (nonatomic, assign) CGFloat loopAngle, monkeyAlpha, angleStep, alphaStep;
@end


@implementation EaseLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _loopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CenterTitleView"]];
        _monkeyView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LotteryBall2"]];

        [_loopView setCenter:self.center];
        [_monkeyView setCenter:self.center];
        [self addSubview:_loopView];
        [self addSubview:_monkeyView];
        [_loopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        _loopAngle = 0.0;
        _monkeyAlpha = 1.0;
        _angleStep = 360/3;
        _alphaStep = 1.0/3.0;
    }
    return self;
}

- (void)startAnimating{
    self.hidden = NO;
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    [self loadingAnimation];
}

- (void)stopAnimating{
    self.hidden = YES;
    _isLoading = NO;
}

- (void)loadingAnimation{
    static CGFloat duration = 0.25f;
    _loopAngle += _angleStep;
    if (_monkeyAlpha >= 1.0 || _monkeyAlpha <= 0.0) {
        _alphaStep = -_alphaStep;
    }
    _monkeyAlpha += _alphaStep;
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGAffineTransform loopAngleTransform = CGAffineTransformMakeRotation(_loopAngle * (M_PI / 180.0f));
        _loopView.transform = loopAngleTransform;
        _monkeyView.alpha = _monkeyAlpha;
    } completion:^(BOOL finished) {
        if (_isLoading && [self superview] != nil) {
            [self loadingAnimation];
        }else{
            [self removeFromSuperview];
            
            _loopAngle = 0.0;
            _monkeyAlpha = 1,0;
            _alphaStep = ABS(_alphaStep);
            CGAffineTransform loopAngleTransform = CGAffineTransformMakeRotation(_loopAngle * (M_PI / 180.0f));
            _loopView.transform = loopAngleTransform;
            _monkeyView.alpha = _monkeyAlpha;
        }
    }];
}

@end
