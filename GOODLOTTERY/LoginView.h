//
//  LoginView.h
//  GoodBetKeno1
//
//  Created by apple on 15/11/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AuthcodeView;
@interface LoginView : UIView<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView *titleView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)NumbersCustomsField *userTextField;
@property (nonatomic, strong)NumbersCustomsField *passtTextField;
@property (nonatomic, strong)NumbersCustomsField*VerificationCodeTextField;
@property (nonatomic, strong)AuthcodeView *authCodeView;
@property (nonatomic, strong)UIButton *enterButton;

@end
