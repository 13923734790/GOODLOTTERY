//
//  LoginCtrl.m
//  GoodBetKeno1
//
//  Created by apple on 15/10/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LoginCtrl.h"
#import "LoginView.h"
#import "AuthcodeView.h"
#import "MenuCtrl.h"
#import "YCHomeTabbarController.h"
#import "SkinpManger.h"

#import <CommonCrypto/CommonDigest.h>
@interface LoginCtrl ()<SkinpeelerDelegate>
@end

@implementation LoginCtrl
{
    LoginView *login;
    SkinpManger *manger;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 写的啥
    login = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, UIScreenHEIGHT)];
    [self.view addSubview:login];
    [self SkinpeelrNub];
    self.Skindelegate =self;
    [login.enterButton addTarget:self action:@selector(enter1) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)SkinpeelrNub
{
    [login.enterButton setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"enterButtonKing%ld")] forState:UIControlStateNormal];
    login.imageView.image = [UIImage imageNamed:IMAGEFILE(@"BackImageKing%ld")];
    login.titleView.image = [UIImage imageNamed:IMAGEFILE(@"EnterKing%ld")];
}
- (void)enter1
{
//    if (login.VerificationCodeTextField.text.length<4)
//    {
//        [self showAlert:@"请输入验证码"];
//        return;
//    }
//    if (login.passtTextField.text.length ==0||login.userTextField.text.length ==0)
//    {
//        [self showAlert:@"请输入帐号密码"];
//    }
//    else
//    {
//    }
             [self startRequest];
             [self GotoMainCtrl];

        

    //验证不匹配，验证码和输入框抖动
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
//    anim.repeatCount = 1;
//    anim.values = @[@-20,@20,@-20];
//    [login.authCodeView.layer addAnimation:anim forKey:nil];
//    [login.VerificationCodeTextField.layer addAnimation:anim forKey:nil];

}

-(void)startRequest
{
    int CompanyId = 36052;
    NSString *ValidateKey =login.authCodeView.CurrentGUID;
    NSString *ValidateCode =login.VerificationCodeTextField.text;
    NSString *UserName = @"clqtest001";
    NSString *Password = @"aaaa1111";
    NSString *md5Password =  [[self getMd5_32Bit:[[self getMd5_32Bit:Password] stringByAppendingString:ValidateKey]] lowercaseString];
    
    NSString *UrlString = [NSString stringWithFormat:@"http://192.168.1.10:31/Account/login?CompanyId=%d&ValidateKey=%@&ValidateCode=%@&UserName=%@&Password=%@",CompanyId,ValidateKey,ValidateCode,UserName,md5Password];
    
//    NSString *stringUrl =[NSString stringWithFormat:@"http://192.168.1.141/Home/GameRows"];
    AFNetworkingAPI *afmanger = [AFNetworkingAPI shareAFNetworking];
    [afmanger getHttp:UrlString showHUD:NO parameters:nil success:^(NSMutableDictionary *responseDic)
     {
        NSLog(@"success-------%@",responseDic);
     } failure:^(NSError *error)
     {
         
     }];

    
//    [self showAlert:@"fuck"];
//
//            // 获取网络数据时的动画
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    
//    [afmanger postHttp:@"http://192.168.1.10:31/Account/login" showHUD:NO parameters:params success:^(NSMutableDictionary *responseDic) {
//        NSLog(@"success");
//    } failure:^(NSError *error) {
//        NSLog(@"error %@",error);
//    }];
    
    
}

- (NSString *)getMd5_32Bit:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)string.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

-(void)showAlert:(NSString *)messageString
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: messageString preferredStyle:UIAlertControllerStyleAlert];
    

    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
    {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)GotoMainCtrl
{
    YCHomeTabbarController *first = [[YCHomeTabbarController alloc] init];
    first.selectVCIndex = 0;
    MenuCtrl *Menu = [[MenuCtrl alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:first
                                                                    leftMenuViewController:nil
                                                                   rightMenuViewController:Menu];
    
    sideMenuViewController.mainController = first;
    sideMenuViewController.menuPreferredStatusBarStyle = 1;
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewInLandscapeOffsetCenterX =[[UIScreen mainScreen]bounds].size.width/4;
    sideMenuViewController.contentViewInPortraitOffsetCenterX =[[UIScreen mainScreen]bounds].size.width/4;
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    //是否缩小
    sideMenuViewController.panFromEdge = NO;
    sideMenuViewController.fadeMenuView = NO;
    sideMenuViewController.scaleBackgroundImageView = NO;
    sideMenuViewController.scaleContentView = NO;
    //sideMenuViewController.backgroundImage = [UIImage imageNamed:@"MenuBack"];
    sideMenuViewController.scaleMenuView = NO;
    
    [self presentViewController:sideMenuViewController animated:YES completion:nil];

}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

@end
