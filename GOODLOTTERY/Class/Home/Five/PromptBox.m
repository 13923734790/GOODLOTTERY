//
//  PromptBox.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PromptBox.h"

@implementation PromptBox
{
    UIView *_PromptBox;
    UIView *_BorderView;
    UITextView *_textView;
    UIButton    *_maskView;
    NSArray *_dataString;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    _maskView = [UIButton buttonWithType:UIButtonTypeCustom];
    _appearance = [PromptBoxAppearance new];
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    
    [self reloadAppearance];
    
}
- (void)reloadAppearance
{
    {
        _maskView.frame = [UIScreen mainScreen].bounds;
        _maskView.backgroundColor = [UIColor blackColor];
        [_maskView addTarget:self action:@selector(HiddeSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    {
        self.layer.borderColor =_appearance.BorderColor.CGColor;
        self.layer.borderWidth = _appearance.BorderWithl;
        self.backgroundColor = _appearance.BackgroundColor;
    }
    
    
}
-(void)setPromptView:(UIView *)PromptView
{
    _PromptView = PromptView;
    _PromptView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_PromptView];
}
- (void)layoutSubviews
{
//    CGFloat supWidth = self.frame.size.width;
//    CGFloat supHeight = self.frame.size.height;
    {
//      _PromptBox.frame =CGRectMake(0,0,supWidth, supHeight);
//    _textView.frame = CGRectMake(2*_appearance.BorderWithl, 2*_appearance.BorderWithl, supWidth-4*_appearance.BorderWithl, supHeight-4*_appearance.BorderWithl);
        
    }
    
}

- (void)HiddeSelf{
    
    [self hidden];
}

- (void)show
{
    [self reloadAppearance];
    
    [self animationWithView:self duration:0.3];
    _maskView.alpha= 0;
    [UIView animateWithDuration:0.25 animations:^{
        _maskView.alpha = 0.5;
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.center = [UIApplication sharedApplication].keyWindow.center;
}
- (void)hidden
{   [_maskView removeFromSuperview];
   [self removeFromSuperview];
}


- (void)animationWithView:(UIView *)view duration:(CFTimeInterval)duration{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [view.layer addAnimation:animation forKey:nil];
}

@end
