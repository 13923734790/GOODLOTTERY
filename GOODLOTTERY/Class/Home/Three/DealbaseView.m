//
//  DealbaseView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DealbaseView.h"

@implementation DealbaseView
{
    UIButton *_button;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,225*ScaleY+5)];
        backView.backgroundColor = GETCOLOR(@"cbw");
        [self addSubview:backView];
        
        NSArray *array1 = @[@"用户账号:",@"用户昵称:",@"返点等级:",@"您的返点:",@"用户返点:"];
        for (int i = 0; i<5; i++)
        {
            
            UIView *CellView = [[UIView alloc]initWithFrame:CGRectMake(0,(45*ScaleY+1)*i,UIScreenWIDTH,45*ScaleY)];
            CellView.tag = 100+i;
            CellView.backgroundColor = GETCOLOR(@"b0.3w");
            [backView addSubview:CellView];
            
            UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,0,80*ScaleX,45*ScaleY)];
            lable1.tag = 5;
            lable1.text = array1[i];
            lable1.textColor = GETCOLOR(@"wb");
            lable1.textAlignment = NSTextAlignmentRight;
            lable1.font = [UIFont systemFontOfSize:15*ScaleY];
            [CellView addSubview:lable1];
            
            if (i==4)
            {
                
                UIButton *OtherBt = [UIButton buttonWithType:UIButtonTypeCustom];
                OtherBt.frame= CGRectMake(125*ScaleX, 5*ScaleY,UIScreenWIDTH-150*ScaleX,35*ScaleY);
                OtherBt.layer.cornerRadius = 5;
                OtherBt.layer.masksToBounds = YES;
                [OtherBt setTitle:@"7.3%.....无限制" forState:UIControlStateNormal];
                [OtherBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
                [OtherBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                
                [OtherBt addTarget:self action:@selector(OtherBtClick:) forControlEvents:UIControlEventTouchUpInside];
                OtherBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                
                OtherBt.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH-150*ScaleX-25*ScaleX,0, -5*ScaleX);
                
                OtherBt.backgroundColor = GETCOLOR(@"w0.1group");
                [CellView addSubview:OtherBt];

            }
            else
            {
                UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(100*ScaleX, 0,UIScreenWIDTH-100*ScaleX,45*ScaleY)];
                lable2.textColor = GETCOLOR(@"wb");
                lable2.tag = 10;
                lable2.textAlignment = NSTextAlignmentLeft;
                lable2.font = [UIFont systemFontOfSize:15*ScaleY];
                [CellView addSubview:lable2];
            }
        }
        
        
    
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(15*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-30*ScaleX,50*ScaleY);
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"下一步" forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:[SkinPeelerTool UpdatasCurrent][0]] forState:UIControlStateNormal];
        [self addSubview:_button];
        
    }
    [self Updatas:nil];
    return self;
    
}
-(void)Updatas:(NSArray *)array
{
    NSArray *arr = @[@"TEST111",@"TEST111",@"7.3%",@"7.4%"];
    for (int i = 0;i<4;i++)
    {
        UILabel *lable = [[self viewWithTag:100+i] viewWithTag:10];
        lable.text = arr[i];
    }
}
- (void)OtherBtClick:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    
    
    pullmenu.DatasArray = @[@"7%.....无限制",@"6.9%.....无限制",@"6.8%.....无限制",@"6.7%.....无限制",@"6.6%.....无限制"];
    
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
}

@end
