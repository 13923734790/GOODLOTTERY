//
//  TGlogon.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TGlogon.h"

@implementation TGlogon
{
    NSArray *array;
    NSArray *array1;
    UIView *InformationView;
    UILabel *Promptlable;
    UIButton *ConfirmBt;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    array = @[@"用户类型:",@"链接有效期:",@"奖金组设定",@"设置奖金:"];
    array1 = @[@"会员",@"一天",@"",@"7%－1940"];
    self = [super initWithFrame:frame];
    if (self)
    {
        [self SetView];
        [self UpdataImageAndTxtColor];
    }
    return self;
}
- (void)SetView
{
    
    InformationView = [[UIView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH, 215*ScaleY)];
    [self addSubview:InformationView];
    
    Promptlable = [[UILabel alloc]initWithFrame:CGRectMake(0,180*ScaleY,UIScreenWIDTH,35*ScaleY)];
    Promptlable.text = @"奖金组一旦上调后无法降低，请谨慎操作";
    Promptlable.font = [UIFont systemFontOfSize:15*ScaleY];
    Promptlable.textAlignment = NSTextAlignmentCenter;
    [InformationView addSubview:Promptlable];
    for (int i = 0; i<4; i++)
    {
        UIView *view;
        if (i!=2)
        {
            view = [[UIView alloc]initWithFrame:CGRectMake(1*ScaleX,1*ScaleY+45*ScaleY*i,UIScreenWIDTH-2*ScaleX,44*ScaleY)];
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20*ScaleX,10*ScaleY+45*ScaleY*i,(UIScreenWIDTH*3/4-20*ScaleX),25*ScaleY)];
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.text = array[i];
            
            
            UIButton *OtherBt = [UIButton buttonWithType:UIButtonTypeCustom];
            OtherBt.frame= CGRectMake(UIScreenWIDTH*3/8,10*ScaleY+45*ScaleY*i, UIScreenWIDTH/2,29*ScaleY);
            OtherBt.layer.cornerRadius = 5;
            OtherBt.layer.masksToBounds = YES;
            if (i==0) [OtherBt setTitle:@"会员" forState:UIControlStateNormal];
            if (i==1) [OtherBt setTitle:@"一天" forState:UIControlStateNormal];
            if (i==3) [OtherBt setTitle:@"选择其他奖金组" forState:UIControlStateNormal];
            [OtherBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
            [OtherBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
            
            [OtherBt addTarget:self action:@selector(OtherBtClick:) forControlEvents:UIControlEventTouchUpInside];
            OtherBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            //            OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
            OtherBt.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH/2-25*ScaleX,0, -5*ScaleX);
            
            OtherBt.backgroundColor = GETCOLOR(@"w0.1group");
            [InformationView addSubview:OtherBt];
            
            lable.tag = 100+i;
            OtherBt.tag = 200+i;
            view.tag = 300+i;
            [InformationView addSubview:view];
            [InformationView addSubview:lable];
            [InformationView addSubview:OtherBt];
        }
        else
        {
            view = [[UIView alloc]initWithFrame:CGRectMake(0,1*ScaleY+45*ScaleY*i,UIScreenWIDTH,44*ScaleY)];
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,1*ScaleY+45*ScaleY*i,UIScreenWIDTH,44*ScaleY)];
            lable.tag = 100+i;
            view.tag = 300+i;
            lable.textAlignment = NSTextAlignmentCenter;
            lable.text = array[i];
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            [InformationView addSubview:view];
            [InformationView addSubview:lable];
            
        }
    }
    
    
    
    
    
    ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ConfirmBt.frame = CGRectMake(10*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
    [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ConfirmBt setTitle:@"生成链接" forState:UIControlStateNormal];
    [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ConfirmBt];
}

- (void)btClick
{
    
}
- (void)OtherBtClick:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    
    if (bt.tag==200)pullmenu.DatasArray = @[@"会员",@"代理"];
    if (bt.tag==201)pullmenu.DatasArray = @[@"一天",@"两天",@"三天",@"永久有效"];
    if (bt.tag==203)pullmenu.DatasArray = @[@"选择其他的奖金组",@"6.9%-----1938",@"6.8%-----1936",@"6.7%-----1934",@"6.6%-----1932",@"6.5%-----1930"];
    
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
}

-(void)UpdataImageAndTxtColor
{
    
    self.backgroundColor = GETCOLOR(@"cw");
    InformationView.backgroundColor =GETCOLOR(@"cgr");
    
    Promptlable.textColor = GETCOLOR(@"wb");
    Promptlable.backgroundColor = GETCOLOR(@"b0.6group");
    for (int i = 0; i<4; i++)
    {
        UILabel *lable;
        UIView *view;
        UIButton *but;
        if (i!=2)
        {
            lable = [self viewWithTag:100+i];
            but = [self viewWithTag:400+i];
            view = [self viewWithTag:300+i];
            lable.textColor = GETCOLOR(@"wb");
            view.backgroundColor = GETCOLOR(@"b0.3w");
            [but setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
        }
        else
        {
            lable = [self viewWithTag:100+i];
            view = [self viewWithTag:300+i];
            lable.textColor = GETCOLOR(@"blr");
            view.backgroundColor = GETCOLOR(@"b0.6group");
        }
    }
}

@end
