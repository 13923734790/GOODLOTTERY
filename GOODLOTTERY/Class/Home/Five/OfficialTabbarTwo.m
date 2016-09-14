//
//  OfficialTabbarTwo.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OfficialTabbarTwo.h"
#import "OddAndNubModel.h"

@implementation OfficialTabbarTwo
{
    OddAndNubModel *Nubmodel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        Nubmodel = [OddAndNubModel shareOddAndNubModel];
        [self SetConfirmBetsView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeArrayNub:) name:@"ChangeArrayNub" object:nil];
    }
    return self;
}

- (void)SetConfirmBetsView
{
    _leftbutton = [UIButton  buttonWithType:UIButtonTypeCustom];
    _rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftbutton.frame = CGRectMake(5*ScaleX, 5*ScaleY,60*ScaleX,35*ScaleY);
    _rightbutton.frame = CGRectMake(UIScreenWIDTH-(65*ScaleX),5*ScaleY,60*ScaleX,35*ScaleY);
    
    _Uplable = [[UILabel alloc]initWithFrame:CGRectMake(65*ScaleX,0,UIScreenWIDTH-(130*ScaleX),20*ScaleY)];
    _Downlable = [[UILabel alloc]initWithFrame:CGRectMake(65*ScaleX,20*ScaleY,UIScreenWIDTH-(130*ScaleX),20*ScaleY)];
    
    _Uplable.textAlignment = NSTextAlignmentCenter;
    _Uplable.font = [UIFont systemFontOfSize:13*ScaleY];
    _Downlable.textAlignment = NSTextAlignmentCenter;
    _Downlable.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:_leftbutton];
    [self addSubview:_rightbutton];
    [self addSubview:_Uplable];
    [self addSubview:_Downlable];
    
    _Uplable.text = @"共选0注";
    _Downlable.text = @"共0元,盈利0元";
    [self UpdataImageTextColor2];
    
}

-(void)ChangeOdd:(NSNotification *)notidic
{
//    NSDictionary *dic = notidic.userInfo;
//    NSInteger Odd = [dic[@"Odd"] integerValue];
   
    CGFloat allMoney =Nubmodel.Nub*Nubmodel.price*Nubmodel.Odd;
    _Downlable.text = [NSString stringWithFormat:@"共%0.2f元,盈利%0.2f元",allMoney,allMoney*0.2];
}
-(void)ChangeArrayNub:(NSNotification *)notidic
{
//    NSDictionary *dic = notidic.userInfo;
//    NSArray *Allarray = dic[@"ArrayNub"];
//    Nubmodel.Nub = 0;
//    for (NSArray *array in Allarray)
//    {
//     Nubmodel.Nub = Nubmodel.Nub+ array.count;
//    }
    
    _Uplable.text = [NSString stringWithFormat:@"共选%ld注",Nubmodel.Nub];
    CGFloat allMoney =Nubmodel.Nub*Nubmodel.price*Nubmodel.Odd;
    _Downlable.text = [NSString stringWithFormat:@"共%0.2f元,盈利%0.2f元",allMoney,allMoney*0.2];

    
}

-(void)ddddealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"销毁销毁");
}


- (void)UpdataImageTextColor2
{
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGEFILE(@"customBackTwo%ld")]];
    _Downlable.textColor = [UIColor whiteColor];
    _Uplable.textColor = [UIColor whiteColor];
    [_leftbutton setBackgroundImage:[UIImage imageNamed:@"LeftAddImage1"] forState:UIControlStateNormal];
    [_rightbutton setBackgroundImage:[UIImage imageNamed:@"RightSeleted1"] forState:UIControlStateNormal];
}


@end
