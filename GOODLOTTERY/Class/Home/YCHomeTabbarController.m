//
//  YCFirstViewController.m
//  Left
//
//  Created by apple on 15/12/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "YCHomeTabbarController.h"
#import "LoginCtrl.h"
#import "LotteryBallCtrl.h"
#import "OnlineServiceCtrl.h"
#import "SpecialOfferCtrl.h"
#import "MemberCenterCtrl.h"
#import "SkinPeelerCtrl.h"
@interface YCHomeTabbarController ()<UITabBarControllerDelegate>

@property(nonatomic, strong) UIButton *openDrawerButton;

@end

@implementation YCHomeTabbarController
{
    NSMutableArray *TabbarArray;
    NSUserDefaults *userDef;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!TabbarArray) TabbarArray = [NSMutableArray arrayWithCapacity:5];
        // 1.初始化子控制器
    LotteryBallCtrl *myOne = [[LotteryBallCtrl alloc] init];
    
    [self addChildVc:myOne title:@"彩票大厅"];
    OnlineServiceCtrl *myTwo = [[OnlineServiceCtrl alloc] init];
 
    [self addChildVc:myTwo title:@"在线客服"];
    SpecialOfferCtrl *myThree = [[SpecialOfferCtrl alloc] init];

    [self addChildVc:myThree title:@"优惠活动"];
    SkinPeelerCtrl *myFive = [[SkinPeelerCtrl alloc] init];

    [self addChildVc:myFive title:@"换肤" ];
    MemberCenterCtrl *myFour = [[MemberCenterCtrl alloc] init];
    
    [self addChildVc:myFour title:@"会员中心" ];
    
    self.delegate = self;
    
    
    if (!userDef)userDef = [NSUserDefaults standardUserDefaults];
    [self changeImage:TabbarArray andKingnub:[[userDef objectForKey:@"SkinSpeelerNub"] integerValue ]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SkinPeeler:) name:@"skinpeeler" object:nil];
}

- (void)SkinPeeler:(NSNotification *)SomeThings
{
    [self changeImage:TabbarArray andKingnub:[SomeThings.userInfo[@"king"] integerValue]];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)changeImage:(NSMutableArray *)tabbararray andKingnub:(NSInteger)nub
{
    NSString *TabbarBackImage = [NSString stringWithFormat:@"TBRBackImageKing%ld",nub];
    self.tabBar.backgroundImage = [UIImage imageNamed:TabbarBackImage];
    for (int i = 0; i<TabbarArray.count; i++)
    {
    UIViewController *ctrl = TabbarArray[i];
    NSString *normalPath = [NSString stringWithFormat:@"tabbarking1_%d",i+1];
    NSString *selectepath = [NSString stringWithFormat:@"tabbarking%ld_%d%d",nub,i+1,i+1];
    ctrl.tabBarItem.image = [UIImage imageNamed:normalPath];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectepath]
                                     imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
        
    if (nub==2)selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];else selectTextAttrs[NSForegroundColorAttributeName] = TABBARCOLORE;
    [ctrl.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [ctrl.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    }

}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title;
{
    childVc.title = title;
    [TabbarArray addObject:childVc];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    NSLog(@"%ld",tabBarController.selectedIndex);
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end