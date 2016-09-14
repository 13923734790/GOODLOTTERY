//
//  SuperClassCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SuperClassCtrl.h"
#import "RESideMenu.h"
#import "MenuManger.h"
#import "NewPickerView.h"
#import "LotteryBarView.h"
#import "KSDatePicker.h"
#import "CreditTitleView.h"
#import "UIViewController+LJWKeyboardHandlerHelper.h"

@interface SuperClassCtrl ()

@end

@implementation SuperClassCtrl
{
    UILabel *_titlelable;
    UIImageView *_leftImage ;
    UIImageView *_rightImage;
    MenuManger *menumanger;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (_Blockhidden)
    {
    [self CustomLeft:@"返回"];
    [_leftButton addTarget:self action:@selector(BlockMainViewCtrl) forControlEvents:UIControlEventTouchUpInside];
    }
    _iamgeView = [[UIImageView alloc]init];
    _iamgeView.frame = CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT );
    [self.view addSubview:_iamgeView];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    NSShadow *shadow = [[NSShadow alloc] init];
//    shadow.shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
//    shadow.shadowOffset = CGSizeMake(0, 1);
    // title的文字颜色
//     shadow, NSShadowAttributeName,  阴影。
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    //添加监听主题更换的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SkinPeeler:) name:@"skinpeeler" object:nil];
    [self SuperSkinpeelrNub];
    [self registerLJWKeyboardHandler].assistantHeight = 0;
    [self setUpForDismissKeyboard];//点击空区域缩键盘
    
}
- (void)SkinPeeler:(NSNotification *)SomeThings
{
    [self SuperSkinpeelrNub];
    if (_Skindelegate&&[_Skindelegate respondsToSelector:@selector(SkinpeelrNub)])
    {
        [_Skindelegate SkinpeelrNub];
    }
}
- (void)SuperSkinpeelrNub
{
    //    图片设置
    NSInteger nub = [SkinPeelerTool GetNSUserDefaultsOfNub];
    NSString *nvBackstring = [NSString stringWithFormat:@"NVBackImageKing%ld",nub];
    NSString *BackImageString = [NSString stringWithFormat:@"SuperBack%ld",nub];
    self.iamgeView.image = [UIImage imageNamed:BackImageString];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:nvBackstring] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)setPickerone:(NSInteger)left andMiddle:(NSInteger)middle and:(NSInteger)right and:(NSArray *)ModelArray
{     
    _newpickerView = [[NewPickerView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 285*ScaleY) andLeftNub:left andMiddleNub:middle andRightNub:right and:ModelArray];
    _newpickerView.backgroundColor = [UIColor blackColor];
    
    _pickerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _pickerButton.hidden = YES;
    _pickerButton.frame = CGRectMake(0,0, UIScreenWIDTH, UIScreenHEIGHT-NVHEIGHT-20);
    [_pickerButton addTarget:self action:@selector(pickerBt) forControlEvents:UIControlEventTouchUpInside];
    [_pickerButton addSubview:_newpickerView];
    [self.view  addSubview:_pickerButton];
    
}
- (void)pickerBt
{
    _pickerButton.hidden = YES;
}

-(void)setCreditTitleView
{
    _creditTitleView = [[CreditTitleView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH, UIScreenHEIGHT-NVHEIGHT-20)];;
    _creditTitleView.hidden = YES;
    [self.view addSubview:_creditTitleView];
}
- (void)UpdataTitleFramTitleButtonTitleString:(NSString *)string andLeftImage:(NSString *)leftString andRightImage:(NSString *)rightString
{
    CGRect rect = [string  boundingRectWithSize:CGSizeMake(UIScreenWIDTH/2+35*ScaleX,20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_titlelable.font} context:nil];
    
    if (rightString&&leftString)
    {
        _titlelable.frame =CGRectMake(20,5,rect.size.width, 20);
        _leftImage.frame = CGRectMake(0,5, 20, 20);
        _rightImage.frame = CGRectMake(rect.size.width+20,5, 15, 20);
        _TitleView.frame = CGRectMake((UIScreenWIDTH-rect.size.width-20-15)/2,7,rect.size.width+20+15,30);
    }
     else if (leftString)
    {
        _titlelable.frame =CGRectMake(20,5,rect.size.width, 20);
        _leftImage.frame = CGRectMake(0,5, 20, 20);
        _TitleView.frame = CGRectMake((UIScreenWIDTH-rect.size.width-20-15)/2,7,rect.size.width+20,30);
    }
    else if (rightString)
    {
        _titlelable.frame =CGRectMake(0,5,rect.size.width, 20);
        _rightImage.frame = CGRectMake(rect.size.width,5, 15, 20);
        _TitleView.frame = CGRectMake((UIScreenWIDTH-rect.size.width-20-15)/2,7,rect.size.width+15,30);
    }
    else
    {
    _titlelable.frame =CGRectMake(0,5,rect.size.width, 20);
    _TitleView.frame = CGRectMake((UIScreenWIDTH-rect.size.width-20-15)/2,7,rect.size.width,30);
    }
    _leftImage.image = [UIImage imageNamed:leftString];
    _rightImage.image = [UIImage imageNamed:rightString];
    _titlelable.text = string;
}
- (void)Maketitlebutton
{
    _TitleView = [UIButton  buttonWithType:UIButtonTypeCustom];
    _titlelable = [[UILabel alloc]init];
    _titlelable.numberOfLines = 1;
    _titlelable.font = [UIFont systemFontOfSize:19];
    _titlelable.textColor = [UIColor whiteColor];
    _leftImage = [[UIImageView alloc]init];
    _rightImage = [[UIImageView alloc]init];
    [_TitleView addSubview:_titlelable];
    [_TitleView addSubview:_leftImage];
    [_TitleView addSubview:_rightImage];
    self.navigationItem.titleView = _TitleView;
    
}

- (void)CustomLeft:(NSString *)leftstring
{
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake(10,0,40,20 )];
    leftlable.backgroundColor = [UIColor clearColor];
    leftlable.textAlignment = NSTextAlignmentRight;
    leftlable.textColor = [UIColor whiteColor];
    leftlable.tag = 99;
    leftlable.text = leftstring;
    [_leftButton addSubview:leftlable];
    _leftButton.frame = CGRectMake(0, 0,40,20);
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , 10, 20)];
    leftImageView.backgroundColor = [UIColor clearColor];
    UIImage *leftImage = [UIImage imageNamed:@"leftblockKing1"];
    leftImageView.image = leftImage;
    leftImageView.backgroundColor = [UIColor clearColor];
    [_leftButton addSubview:leftImageView];
    
    UIBarButtonItem *leftbarButton = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    self.navigationItem.leftBarButtonItem = leftbarButton;
}

- (void)CustomRight:(NSString *)rightstring
{
     UIButton *_rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightButton addTarget:self action:@selector(presentRightMenuViewController:)
           forControlEvents:UIControlEventTouchUpInside];
    _rightButton.frame = CGRectMake(0, 0,60,20);
    
    UILabel *rightlable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,40 ,20)];
    rightlable.backgroundColor = [UIColor clearColor];
    
    rightlable.text = rightstring;
    rightlable.textAlignment = NSTextAlignmentLeft;
    rightlable.textColor = [UIColor whiteColor];
    [_rightButton addSubview:rightlable];
    
    UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40,0 , 20, 20)];
    rightImageView.backgroundColor = [UIColor clearColor];
    UIImage *rightImage = [UIImage imageNamed:@"RightMenu"];
    rightImageView.image = rightImage;
    rightImageView.backgroundColor = [UIColor clearColor];
    [_rightButton addSubview:rightImageView];
    UIBarButtonItem *rightbarButton = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = rightbarButton;
    
}
- (void)MakeLotterybarView
{
    _lotterybarView = [[LotteryBarView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH, 35*ScaleY+5*ScaleY)];
    [self.view addSubview:_lotterybarView];
}


- (void)setUpForDismissKeyboard
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
    
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    
    [self.view endEditing:YES];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.TitleView.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.TitleView.hidden = NO;
}
@end
