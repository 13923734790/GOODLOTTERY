//
//  LoginView.m
//  GoodBetKeno1
//
//  Created by apple on 15/11/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "LoginView.h"
#import "AuthcodeView.h"

@implementation LoginView



- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setView];
    }
    return self;
}

- (void)textField:(UITextField *)field
{
    
    
    field.backgroundColor = [UIColor clearColor];
    field.textColor = [UIColor whiteColor];
    field.textAlignment = NSTextAlignmentCenter;
    field.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    CGRect rectleft =  field.leftView.frame;
    rectleft.size.width = rectleft.size.width/2;
    rectleft.size.height = rectleft.size.height/2;
    rectleft.origin.y = rectleft.size.height/2;
    field.leftView.frame = rectleft;
    
    CGRect rectRight = field.rightView.frame;
    rectRight.size.width = rectRight.size.width*2/3;
    rectRight.size.height = rectRight.size.height/2;
    rectRight.origin.y = rectRight.size.height/2;
    field.rightView.frame = rectRight;

}
- (void)setView
{
    //背景图片和logo
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, FRAMEWIDTH,FRAMEHEIGHT)];
    [self addSubview:_imageView];
    _titleView = [[UIImageView alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4,(64*ScaleY+20), UIScreenWIDTH/2, UIScreenWIDTH/2)];
    _titleView.image = [UIImage imageNamed:@"EnterKing1"];
    [self addSubview:_titleView];
    
    
    
    
    UIImageView *imageclearView = [[UIImageView alloc]initWithFrame:CGRectMake(15*ScaleX,UIScreenWIDTH/2+64*ScaleY+20+50*ScaleY,UIScreenWIDTH-30*ScaleX,(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
    imageclearView.userInteractionEnabled = YES;
    imageclearView.image = [UIImage imageNamed:@"NubbackImageKing1"];

    _userTextField = [[NumbersCustomsField alloc]initWithFrame:CGRectMake(20*ScaleX,0,UIScreenWIDTH-30*ScaleX-40*ScaleX,(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
    _userTextField.placeholder = @"请输入帐号";
    _userTextField.FieldType = DigitAndLetterType;
    _userTextField.BitNub = 16;
    _userTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    //不制动更正。
    //    [_userTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
     _userTextField.keyboardType = UIKeyboardTypeASCIICapable;
    [_userTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_userTextField setValue:[UIFont boldSystemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
    UIImageView *leftImageuser=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NubKing"]];
    _userTextField.leftView=leftImageuser;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImageuser2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keyKIng1"]];
    _userTextField.rightView=leftImageuser2;
    _userTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
    [self textField:_userTextField];
    [imageclearView addSubview:_userTextField];
    
    

    UIImageView *imageclearView2 = [[UIImageView alloc]initWithFrame:CGRectMake(15*ScaleX,UIScreenWIDTH/2+64*ScaleY+20+50*ScaleY+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/16,UIScreenWIDTH-30*ScaleX,(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
    imageclearView2.userInteractionEnabled = YES;
    imageclearView2.image = [UIImage imageNamed:@"NubbackImageKing1"];
    
    _passtTextField = [[NumbersCustomsField alloc]initWithFrame:CGRectMake(20*ScaleX,0,UIScreenWIDTH-30*ScaleX-40*ScaleX,(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
    _passtTextField.placeholder = @"请输入密码";
    _passtTextField.FieldType = DigitAndLetterType;
    _passtTextField.BitNub = 16;
    [_passtTextField setSecureTextEntry:YES];
    _passtTextField.keyboardType = UIKeyboardTypeASCIICapable;
    [_passtTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passtTextField setValue:[UIFont boldSystemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
    
    UIImageView *leftImagepass=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passwordKing"]];
    _passtTextField.leftView=leftImagepass;
    _passtTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImagepass2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keyKIng1"]];
    _passtTextField.rightView=leftImagepass2;
    _passtTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
    [self textField:_passtTextField];
    [imageclearView2 addSubview:_passtTextField];
    //验证码testField
    
    
    
    
          UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(15*ScaleX, UIScreenWIDTH/2+64*ScaleY+20+50*ScaleY+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/4+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8, (UIScreenWIDTH-45*ScaleX)/2, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
          imageView3.backgroundColor = DTAISCOLORE(0, 0, 0, 0.4);
          imageView3.userInteractionEnabled  =YES;
          [self addSubview:imageView3];
    
    
     _VerificationCodeTextField = [[NumbersCustomsField alloc]initWithFrame:CGRectMake(0,0, (UIScreenWIDTH-30*ScaleX)/2, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
       _VerificationCodeTextField.FieldType = DigitAndLetterType;
       _VerificationCodeTextField.BitNub = 4;
        _VerificationCodeTextField.placeholder = @"验证码";
      _VerificationCodeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
       _VerificationCodeTextField.keyboardType = UIKeyboardTypeASCIICapable;
        [_VerificationCodeTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        [_VerificationCodeTextField setValue:[UIFont boldSystemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
        [self textField:_VerificationCodeTextField];
    
       [imageView3 addSubview:_VerificationCodeTextField];
    
    
    
        //修改字体  和颜色
        //    textField.placeholder = @"username is in here!";
        //    [textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        //    [textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
        
        
        UIView *CodeView = [[UIView alloc]initWithFrame:CGRectMake((UIScreenWIDTH-45*ScaleX)/2+30*ScaleX, UIScreenWIDTH/2+64*ScaleY+20+50*ScaleY+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/4+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8, (UIScreenWIDTH-45*ScaleX)/2, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8)];
        CodeView.backgroundColor = DTAISCOLORE(0, 0, 0, 0.4);
        
    _authCodeView = [[AuthcodeView alloc]initWithFrame:CGRectMake(5*ScaleX, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/32, (UIScreenWIDTH-45*ScaleX)/4, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/16)];
    [CodeView addSubview:_authCodeView];
    
        
        UIButton *CodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CodeButton.frame = CGRectMake(((UIScreenWIDTH-30*ScaleX)/2-15*ScaleX)/2+5*ScaleX, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/32, ((UIScreenWIDTH-30*ScaleX)/2-15*ScaleX)/2, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/16);
        [CodeButton setTitle:@"换一换" forState:UIControlStateNormal];
        [CodeButton addTarget:self action:@selector(Newget) forControlEvents:UIControlEventTouchUpInside];
        [CodeView addSubview:CodeButton];
        
        
    
        
        _enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _enterButton.frame = CGRectMake(15*ScaleX, UIScreenWIDTH/2+64*ScaleY+20+50*ScaleY+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)*3/8+(UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)*3/16,UIScreenWIDTH-30*ScaleX, (UIScreenHEIGHT-UIScreenWIDTH/2-64*ScaleY-20-50*ScaleY)/8);
    
    
    
        
        [self addSubview:CodeView];
        [self addSubview:_enterButton];
        [self addSubview:imageView3];
        [self addSubview:imageclearView2];
        [self addSubview:imageclearView];
        
}
- (void)Newget
{
    [_authCodeView getAuthcode];
}
@end
