//
//  CashSubViewTowSubOne.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashSubViewTowSubOne.h"

@implementation CashSubViewTowSubOne
{
    UIScrollView *_scrollView;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX, 0,UIScreenWIDTH-20*ScaleX,20*ScaleY)];
        lable1.text = @"请用选择的银行卡充值到下一帐户中";
        lable1.textColor = DTAISCOLORE(66,66,66, 1);
        lable1.font = [UIFont systemFontOfSize:13*ScaleY];
        [self addSubview:lable1];
//        
        UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(0,30*ScaleY,UIScreenWIDTH, 240*ScaleY+5)];
        viewOne.backgroundColor = [UIColor whiteColor];
//        viewOne.layer.cornerRadius = 2;
        //        viewOne.layer.masksToBounds = YES;
//        viewOne.layer.shadowOffset = CGSizeMake(1, 1);
//        viewOne.layer.shadowColor = [UIColor blackColor].CGColor;
//        viewOne.layer.shadowOpacity = 1;
        [self addSubview:viewOne];
        
        NSArray *array1 = @[@"入款银行卡:",@"开户行网点:",@"收款人:",@"银行:",@"帐号:",@"订单号:"];
        NSArray *array2 = @[@"中国民生银行:",@"大西北",@"大逼哥",@"天地银行",@"7373738768476283648726872",@"3264782364237854372654"];
        for (int i = 0; i<6; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,40*ScaleY*i,80*ScaleX,40*ScaleY)];
            lable.text = array1[i];
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            lable.font = [UIFont systemFontOfSize:13*ScaleY];
            lable.textAlignment = NSTextAlignmentRight;
            
            UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(90*ScaleX,40*ScaleY*i,UIScreenWIDTH-160*ScaleX,40*ScaleY)];;
            field.text = array2[i];
            field.font = [UIFont systemFontOfSize:13*ScaleY];
            field.enabled = NO;
            
            
//            UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
//            butt.frame = CGRectMake(UIScreenWIDTH-70*ScaleX,10*ScaleY+40*ScaleY*i,40*ScaleX,20*ScaleY);
//            butt.backgroundColor = [UIColor orangeColor];
//            [butt setTitle:@"复制" forState:UIControlStateNormal];
//            [butt setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
//            butt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
//            [viewOne addSubview:butt];
            
            
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleY,40*ScaleY*i,UIScreenWIDTH-40*ScaleX,1)];
            lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [viewOne addSubview:lineView];
            [viewOne addSubview:lable];
            [viewOne addSubview:field];
        }
        
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX, 270*ScaleY,UIScreenWIDTH-20*ScaleX,30*ScaleY)];
        lable2.text = @"填写你的转帐资料:";
        lable2.textColor = GETCOLOR(@"blr");
        lable2.font = [UIFont systemFontOfSize:13*ScaleY];
        [self addSubview:lable2];
        
        UIView *viewTwo = [[UIView alloc]initWithFrame:CGRectMake(0,300*ScaleY,UIScreenWIDTH, 200*ScaleY)];
        viewTwo.backgroundColor = [UIColor whiteColor];
        [self addSubview:viewTwo];
        
        NSArray *array3 = @[@"订单号:",@"存入金额:",@"存入时间:",@"存款人姓名:",@"存款方式:"];
        for (int i = 0; i<5; i++)
        {
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,40*ScaleY*i,80*ScaleX,40*ScaleY)];
            lable.text = array3[i];
            lable.textAlignment = NSTextAlignmentRight;
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            lable.font = [UIFont systemFontOfSize:13*ScaleY];
            UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(90*ScaleX,40*ScaleY*i,UIScreenWIDTH-110*ScaleX,40*ScaleY)];
            field.font = [UIFont systemFontOfSize:13*ScaleY];
//            if (i==1)
//            {
//                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(80*ScaleX,30*ScaleY*i,10*ScaleX,30*ScaleY)];
//                view.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
//                [viewTwo addSubview:view];
//                lable.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
//                field.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
//            }
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleY,40*ScaleY*i,UIScreenWIDTH-40*ScaleX,1)];
            lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [viewTwo addSubview:lineView];
           
            [viewTwo addSubview:lable];
            [viewTwo addSubview:field];
        }
        
        
//        UILabel *TimeTitle= [[UILabel alloc]initWithFrame:CGRectMake(80*ScaleX,370*ScaleY,40*ScaleX,40*ScaleX)];
//        TimeTitle.textColor = DTAISCOLORE(66,66,66, 1);
//        TimeTitle.text = @"有效时间";
//        TimeTitle.numberOfLines = 2;
//        TimeTitle.font = [UIFont systemFontOfSize:15*ScaleX];
//        [self addSubview:TimeTitle];
//        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(120*ScaleX,370*ScaleY, 40*ScaleX, 40*ScaleY)];
//        imageView.image = [UIImage imageNamed:@"CashImage8"];
//        [self addSubview:imageView];
//        
//        UILabel *TimeLable = [[UILabel alloc]initWithFrame:CGRectMake(170*ScaleX,370*ScaleY,150*ScaleX,40*ScaleY)];
//        TimeLable.textColor = DTAISCOLORE(66,66,66, 1);
//        TimeLable.text = @"09:30";
//        TimeLable.font = [UIFont boldSystemFontOfSize:40*ScaleX];
//        [self addSubview:TimeLable];
        
        
        
        UIButton *butLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        butLeft.frame = CGRectMake(10*ScaleX, 510*ScaleY,80*ScaleX,20*ScaleX);
        [butLeft setTitle:@"联系客服" forState:UIControlStateNormal];
        [butLeft setTitleColor:GETCOLOR(@"blr") forState:UIControlStateNormal];
        [butLeft setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        butLeft.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
        [self addSubview:butLeft];
        
        UIButton *butRight = [UIButton buttonWithType:UIButtonTypeCustom];
        butRight.frame = CGRectMake(UIScreenWIDTH-90*ScaleX, 510*ScaleY, 80*ScaleX, 20*ScaleX);
        [butRight setTitle:@"再充一笔" forState:UIControlStateNormal];
        [butRight setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [butRight setTitleColor:GETCOLOR(@"blr") forState:UIControlStateNormal];
        butRight.titleLabel.font = [UIFont systemFontOfSize:15*ScaleX];
        [self addSubview:butRight];
        
        
        
        UIButton *ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
        ConfirmBt.frame = CGRectMake(10*ScaleX,550*ScaleY,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
        [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
        [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ConfirmBt setTitle:@"开始充值" forState:UIControlStateNormal];
        [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ConfirmBt];
    }
    
    return self;
}

- (void)btClick
{
    if (_blcokDatas)
    {
        _blcokDatas(nil);
    }
}
@end
