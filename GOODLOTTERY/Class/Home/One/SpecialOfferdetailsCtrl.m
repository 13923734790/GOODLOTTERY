//
//  SpecialOfferdetailsCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SpecialOfferdetailsCtrl.h"
#import "EaseLoadingView.h"
#import "UIImageView+WFImg.h"


@interface SpecialOfferdetailsCtrl ()<UIScrollViewDelegate>

@end

@implementation SpecialOfferdetailsCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    
        UIScrollView *selfScrollView = [[UIScrollView alloc]init];
        selfScrollView.backgroundColor = [UIColor clearColor];
        selfScrollView.delegate = self;
        selfScrollView.bounces = NO;
        selfScrollView.pagingEnabled = NO;
        [self.view addSubview:selfScrollView];
    
        UIImageView *imageView = [[UIImageView alloc]init];
        [selfScrollView addSubview:imageView];
//        UIImage *image1 = [UIImage imageNamed:@"img_01"];
    
    
     UIButton *leftbt = [UIButton buttonWithType:UIButtonTypeCustom];
     UIButton *rightbt = [UIButton buttonWithType:UIButtonTypeCustom];
     [leftbt addTarget:self action:@selector(ClickLeft) forControlEvents:UIControlEventTouchUpInside];
     [leftbt addTarget:self action:@selector(ClickRight) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftbt];
    [self.view addSubview:rightbt];
    
         __block  CGFloat ScrollHeight;
    
        [imageView wf_setImageWithUrlString:@"http://idting.com/Files/upload/20160304/56d99104d0f44.png" placeholderImage:nil completed:^(UIImage *image)
        {
            if (image.size.height>400*ScaleY) ScrollHeight = 400*ScaleY;else ScrollHeight = image.size.height;
            selfScrollView.frame = CGRectMake(10,10,UIScreenWIDTH-20,ScrollHeight);
            selfScrollView.contentSize = CGSizeMake(UIScreenWIDTH-20, image.size.height);
            imageView.frame = CGRectMake(0, 0,UIScreenWIDTH-20, image.size.height);
            leftbt.frame = CGRectMake(0,ScrollHeight,0,0);
            rightbt.frame = CGRectMake(0, 0, 0, 0);
        }];
    
    
        EaseLoadingView *EaseView = [[EaseLoadingView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT)];
        [self.view addSubview:EaseView];
        [EaseView startAnimating];
    
    
}
- (void)ClickLeft
{
    
}
- (void)ClickRight
{
    
}
@end

