//
//  MenuHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MenuHeardView.h"
//#import "CashValueCtrl.h"
@implementation MenuHeardView
{
    UILabel *namelable;
    UILabel *moneylable;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self MenuheardView];
    }
    return self;
}
- (void)MenuheardView
{
    _heardBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _heardBt.frame = CGRectMake(FRAMEWIDTH/3, 15*ScaleX, FRAMEWIDTH/3, FRAMEWIDTH/3);
    _heardBt.layer.cornerRadius = FRAMEWIDTH/3/2;
    _heardBt.layer.masksToBounds = YES;
    [self addSubview:_heardBt];
    
//    UIButton *mailbox = [UIButton buttonWithType:UIButtonTypeCustom];
//    mailbox.frame = CGRectMake(FRAMEWIDTH-30*ScaleX, 15*ScaleY, 20*ScaleX, 10*ScaleY);
//    [self addSubview:mailbox];
    
    namelable = [[UILabel alloc]initWithFrame:CGRectMake(FRAMEWIDTH/4, 15*ScaleY+FRAMEWIDTH/3+5*ScaleY,FRAMEWIDTH/2,20*ScaleY)];
    UIImageView *JuhuaImage = [[UIImageView alloc]initWithFrame:CGRectMake(FRAMEWIDTH*3/4, 15*ScaleY+FRAMEWIDTH/3+5*ScaleY,20*ScaleY,20*ScaleY)];
    JuhuaImage.image = [UIImage imageNamed:@"CenterJuhua"];
    
    UILabel *Titlelable = [[UILabel alloc]initWithFrame:CGRectMake(0, 15*ScaleY+FRAMEWIDTH/3+20*ScaleY+5*ScaleY, FRAMEWIDTH/2,20*ScaleY)];
    moneylable = [[UILabel alloc]initWithFrame:CGRectMake(FRAMEWIDTH/2, 15*ScaleY+FRAMEWIDTH/3+20*ScaleY+5*ScaleY, FRAMEWIDTH/2,20*ScaleY)];
    namelable.textAlignment = NSTextAlignmentCenter;
    Titlelable.textAlignment = NSTextAlignmentRight;
    moneylable.textAlignment = NSTextAlignmentCenter;
    
    namelable.textColor = [UIColor whiteColor];
    Titlelable.textColor = [UIColor whiteColor];
    moneylable.textColor = [UIColor whiteColor];
    namelable.font = [UIFont boldSystemFontOfSize:15];
    Titlelable.font = [UIFont boldSystemFontOfSize:15];
    moneylable.font = [UIFont boldSystemFontOfSize:15];
    Titlelable.text = @"账号余额:";
    
    UIButton *TopUpBt =[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *OUTmoneyBt = [UIButton buttonWithType:UIButtonTypeCustom];
    TopUpBt.frame = CGRectMake(0, 15*ScaleY+FRAMEWIDTH/3+40*ScaleY+10*ScaleY, FRAMEWIDTH/2-0.5*ScaleX, FRAMEHEIGHT-(FRAMEWIDTH/3+(40+10+15)*ScaleY));
    OUTmoneyBt.frame = CGRectMake(FRAMEWIDTH/2+0.5*ScaleX, FRAMEWIDTH/3+(40+10+15)*ScaleY, FRAMEWIDTH/2-0.5*ScaleX, FRAMEHEIGHT-(FRAMEWIDTH/3+(40+10+15)*ScaleY));
    TopUpBt.backgroundColor = DTAISCOLORE(255, 255, 255, 0.2);
    OUTmoneyBt.backgroundColor = DTAISCOLORE(255, 255, 255, 0.2);
    CGFloat imageWith = TopUpBt.frame.size.width;
    CGFloat imageheight = TopUpBt.frame.size.height;
    
    UIImageView *topUpimageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageWith/2-30*ScaleX,(imageheight-30*ScaleY)/2, 30*ScaleY,30*ScaleY)];
    UIImageView *outImageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageWith/2-30*ScaleX, (imageheight-30*ScaleY)/2, 30*ScaleY,30*ScaleY)];
    
    UILabel *uplable = [[UILabel alloc]initWithFrame:CGRectMake(imageWith/2+5*ScaleX, (imageheight-20*ScaleY)/2, imageWith/2-5*ScaleX, 20*ScaleY)];
    uplable.textColor = [UIColor whiteColor];
    UILabel *outlable = [[UILabel alloc]initWithFrame:CGRectMake(imageWith/2+5*ScaleX, (imageheight-20*ScaleY)/2, imageWith/2-5*ScaleX, 20*ScaleY)];
    outlable.textColor = [UIColor whiteColor];
    uplable.text = @"充值";
    outlable.text = @"提现";
    outImageView.image = [UIImage imageNamed:@"Center1"];
    topUpimageView.image = [UIImage imageNamed:@"Center2"];
    [TopUpBt addTarget:self action:@selector(TopClick) forControlEvents:UIControlEventTouchUpInside];
    [OUTmoneyBt addTarget:self action:@selector(OutClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    [self addSubview:namelable];
    [self addSubview:JuhuaImage];
    [self addSubview:Titlelable];
    [self addSubview:moneylable];
    [TopUpBt addSubview:uplable];
    [TopUpBt addSubview:topUpimageView];
    [OUTmoneyBt addSubview:outlable];
    [OUTmoneyBt addSubview:outImageView];
    [self addSubview:TopUpBt];
    [self addSubview:OUTmoneyBt];
    [self updata:nil];
    
    
//    [mailbox setBackgroundImage:[UIImage imageNamed:@"CenterMail"] forState:UIControlStateNormal];
    [_heardBt setBackgroundImage:[UIImage imageNamed:@"CenterTitleView"] forState:UIControlStateNormal];

    
}
- (void)TopClick
{
    if (_BlockTopOut)
    {
        _BlockTopOut(1);
    }
    
}
- (void)OutClick
{
    if (_BlockTopOut)
    {
        _BlockTopOut(2);
    }

}
- (void)updata:(NSArray *)array
{
    namelable.text = @"contemplation";
    moneylable.text = @"10000000元";
}
@end
