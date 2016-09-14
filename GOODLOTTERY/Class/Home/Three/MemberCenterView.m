//
//  MemberCenterView.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MemberCenterView.h"
#import "RegisterCtrl.h"


@implementation MemberCenterView
{
    UILabel *namelable;
    UILabel *moneylable;
//    UIButton *mailbox;
    UIView *ButtonView;
    UIButton *leftbutton;
    UIButton *rightbutton;
    UIImageView *JuhuaImage;
    double  angle;
    NSArray *Titlearray;
    UIScrollView *SelfScrollView;
}

- (void)updatas
{
    Titlearray = @[@"充值",@"提现",@"彩票查询",@"追号查询",@"个人报表",@"团队报表",@"账变报表",@"活动详情",@"个人总览",@"修改密码",@"密保设定",@"绑定银行卡",@"资料修改",@"彩种信息",@"彩种限额",@"团队总览",@"用户列表",@"推广注册",@"站内短信",@"网站公告",@"开奖结果"];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {    [self updatas];
        
        SelfScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,FRAMEWIDTH,FRAMEHEIGHT)];
        SelfScrollView.delegate = self;
        SelfScrollView.contentSize = CGSizeMake(FRAMEWIDTH,(FRAMEWIDTH-3)*3/2+30*ScaleY+FRAMEWIDTH/4+25*ScaleY+80*ScaleY);
        SelfScrollView.bounces = NO;
        SelfScrollView.pagingEnabled = NO;
        [self addSubview:SelfScrollView];

         [self setMemberAllView];
    }
    return self;
}

- (void )setMemberAllView
{
    leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake((FRAMEWIDTH-FRAMEWIDTH/4)/2/3-5,30*ScaleY+FRAMEWIDTH/4/2/2 ,FRAMEWIDTH/4/2-10*ScaleX, FRAMEWIDTH/4/2-10*ScaleX);
    rightbutton.frame = CGRectMake(FRAMEWIDTH-FRAMEWIDTH/4+5,30*ScaleY+FRAMEWIDTH/4/2/2 ,FRAMEWIDTH/4/2-10*ScaleX, FRAMEWIDTH/4/2-10*ScaleX);
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake((FRAMEWIDTH-FRAMEWIDTH/4)/2/3-5*ScaleX,30*ScaleY+FRAMEWIDTH/4/2/2+FRAMEWIDTH/4/2-10*ScaleY ,FRAMEWIDTH/4/2-10*ScaleY, (FRAMEWIDTH/4/2-10*ScaleY)/2)];
    UILabel *rightlable = [[UILabel alloc]initWithFrame:CGRectMake(FRAMEWIDTH-FRAMEWIDTH/4+5*ScaleX,30*ScaleX+FRAMEWIDTH/4/2/2+FRAMEWIDTH/4/2-10*ScaleY ,FRAMEWIDTH/4/2-10*ScaleY, (FRAMEWIDTH/4/2-10*ScaleY)/2)];
    [leftbutton addTarget:self action:@selector(LeftBt:) forControlEvents:UIControlEventTouchUpInside];
    [rightbutton addTarget:self action:@selector(RightBt:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    leftlable.text = @"注册管理";
    rightlable.text = @"推出登入";
    leftlable.textColor = [UIColor whiteColor];
    rightlable.textColor = [UIColor whiteColor];
    leftlable.font = [UIFont systemFontOfSize:(FRAMEWIDTH/4/2-10*ScaleY)/2/2];
    rightlable.font = [UIFont systemFontOfSize:(FRAMEWIDTH/4/2-10*ScaleY)/2/2];
    [SelfScrollView addSubview:leftbutton];
    [SelfScrollView addSubview:rightbutton];
    [SelfScrollView addSubview:leftlable];
    [SelfScrollView addSubview:rightlable];
    
    
    
    
    _heardBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _heardBt.frame = CGRectMake((FRAMEWIDTH-FRAMEWIDTH/4)/2,30*ScaleY,FRAMEWIDTH/4, FRAMEWIDTH/4);
    _heardBt.layer.cornerRadius = FRAMEWIDTH/4/2;
    _heardBt.layer.masksToBounds = YES;
    [SelfScrollView addSubview:_heardBt];
    
    
//    mailbox = [UIButton buttonWithType:UIButtonTypeCustom];
//    mailbox.frame = CGRectMake(FRAMEWIDTH-35*ScaleX, 10*ScaleY, 25*ScaleX, 10*ScaleY);
//    [SelfScrollView addSubview:mailbox];
    
    namelable = [[UILabel alloc]initWithFrame:CGRectMake(FRAMEWIDTH/4,30*ScaleY+FRAMEWIDTH/4+5*ScaleY,FRAMEWIDTH/2,20*ScaleY)];
    JuhuaImage = [[UIImageView alloc]initWithFrame:CGRectMake(FRAMEWIDTH*3/4,30*ScaleY+FRAMEWIDTH/4+5*ScaleY,20*ScaleX,20*ScaleX)];
    JuhuaImage.image = [UIImage imageNamed:@"CenterJuhua"];

    
    UILabel *Titlelable = [[UILabel alloc]initWithFrame:CGRectMake(0, 30*ScaleY+FRAMEWIDTH/4+25*ScaleY, FRAMEWIDTH/2,20*ScaleY)];
    moneylable = [[UILabel alloc]initWithFrame:CGRectMake(FRAMEWIDTH/2, 30*ScaleY+FRAMEWIDTH/4+25*ScaleY, FRAMEWIDTH/2,20*ScaleY)];
    namelable.textAlignment = NSTextAlignmentCenter;
    Titlelable.textAlignment = NSTextAlignmentRight;
    namelable.textColor = [UIColor whiteColor];
    Titlelable.textColor = [UIColor whiteColor];
    moneylable.textColor = [UIColor whiteColor];
    namelable.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    Titlelable.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    moneylable.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    Titlelable.text = @"账号余额:";
    
    
    [SelfScrollView addSubview:namelable];
    [SelfScrollView addSubview:JuhuaImage];
    [SelfScrollView addSubview:Titlelable];
    [SelfScrollView addSubview:moneylable];
    
    ButtonView = [[UIView alloc]initWithFrame:CGRectMake(0,30*ScaleY+FRAMEWIDTH/4+25*ScaleY+80*ScaleY, FRAMEWIDTH, FRAMEWIDTH*3/2+5)];
    [SelfScrollView addSubview:ButtonView];
    
    for (int i = 0; i<21; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100+i;
        button.frame = CGRectMake(((FRAMEWIDTH-3)/4+1)*(i%4),((FRAMEWIDTH-3)/4+1)*(i/4),(FRAMEWIDTH-3)/4, (FRAMEWIDTH-3)/4);
        [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        
        button.backgroundColor = [UIColor colorWithRed:41/255.0 green:82/255.0 blue:92/255.0 alpha:0.3];
        [ButtonView addSubview:button];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((button.frame.size.width-35*ScaleX)/2,(button.frame.size.height/2-35)/2+10*ScaleY, 35*ScaleX, 35*ScaleX)];
        imageView.tag = 5;
        UILabel *Btlable = [[UILabel alloc]initWithFrame:CGRectMake(0, button.frame.size.height/2+(button.frame.size.height/2-20*ScaleY)/2, button.frame.size.width,20*ScaleY)];
        Btlable.tag = 9;
        Btlable.textAlignment = NSTextAlignmentCenter;
        Btlable.textColor = [UIColor whiteColor];
        Btlable.font = [UIFont systemFontOfSize:13*ScaleY];
        [button addSubview:imageView];
        [button addSubview:Btlable];
    }
    [self updata:nil];
    
}
- (void)StartAnimotion
{
    [UIView animateWithDuration:0.1 animations:^{
        JuhuaImage.transform = CGAffineTransformMakeRotation(angle * M_PI /180);
        
    } completion:^(BOOL finished)
    {
        if (finished)
        {
             angle += 10;
//            if (angle==500)
//            {
//              [UIView commitAnimations];
//            }
//            else{
                [self StartAnimotion];//占停;
//            }
        }
    }];
}

- (void)updata:(NSArray *)array
{
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"CenterLeft"] forState:UIControlStateNormal];
    [rightbutton setBackgroundImage:[UIImage imageNamed:@"CenterRight"] forState:UIControlStateNormal];
//    [mailbox setBackgroundImage:[UIImage imageNamed:@"CenterMail"] forState:UIControlStateNormal];
    [_heardBt setBackgroundImage:[UIImage imageNamed:@"CenterTitleView"] forState:UIControlStateNormal];
    for (int i = 0; i<21; i++)
    {
        UIButton *maxbt = [ButtonView viewWithTag:100+i];
        UIImageView *imageV = [maxbt viewWithTag:5];
        UILabel *Lable = [maxbt viewWithTag:9];

        imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"Center%d",i+1]];
        Lable.text = Titlearray[i];

    }
    namelable.text = @"contemplation";
    moneylable.text = @"100000元";
}

- (void)Click:(UIButton *)bbt
{
    if (self.PushCtrlID)
    {
        self.PushCtrlID([NSString stringWithFormat:@"%@",Titlearray[bbt.tag-100]]);
        NSLog(@"%@",[NSString stringWithFormat:@"%@",Titlearray[bbt.tag-100]]);
    }
}
- (void)LeftBt:(UIButton *)bt
{
    if (self.PushCtrlID)
    {
        self.PushCtrlID(@"Register");
    }
}

- (void)RightBt:(UIButton *)bt
{
    if (self.PushCtrlID)
    {
        self.PushCtrlID(@"Exit");
    }
}
@end
