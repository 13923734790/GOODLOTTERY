//
//  TransferView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TransferView.h"

@implementation TransferView
{
    UIView *cellTwoView;
    UIButton *_button;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,180*ScaleY+4)];
        backView.backgroundColor = GETCOLOR(@"cbw");
        [self addSubview:backView];
        NSArray *array1 = @[@"用户账号:",@"您的余额:",@"充值金额:"];
        
        for (int i = 0; i<3; i++)
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
            
            if (i==2)
            {
                UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(100*ScaleX, 0,UIScreenWIDTH-100*ScaleX,45*ScaleY)];
                field.tag = 10;
                field.textColor = GETCOLOR(@"wb");
                field.keyboardType = UIKeyboardTypeNamePhonePad;
                [CellView addSubview:field];
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
        
        
        
        
        cellTwoView = [[UIView alloc]initWithFrame:CGRectMake(0,135*ScaleY+3,UIScreenWIDTH, 45*ScaleY)];
        cellTwoView.backgroundColor =GETCOLOR(@"b0.3w");
        
        [backView addSubview:cellTwoView];
        
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,100*ScaleX,45*ScaleY)];
        lable.text = @"使用分红金额:";
        lable.textColor = GETCOLOR(@"wb");
        lable.textAlignment = NSTextAlignmentRight;
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        [cellTwoView addSubview:lable];
        
        
        for (int i = 0;i<2;i++)
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(120*ScaleX+(UIScreenWIDTH-120*ScaleX)/2*i,0,(UIScreenWIDTH-120*ScaleX)/2,45*ScaleY)];
            [cellTwoView addSubview:view];
            
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.frame = CGRectMake(0,15*ScaleY,15*ScaleX,15*ScaleX);
            [bt setBackgroundImage:[UIImage imageNamed:@"shareBt"] forState:UIControlStateNormal];
            [bt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"shareBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateSelected];
            [bt addTarget:self action:@selector(Ckickbt:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:bt];
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,0,45*ScaleX,45*ScaleY)];
            lable.textColor = GETCOLOR(@"wb");
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            [view addSubview:lable];
            if (i==0) lable.text = @"是";else lable.text = @"否";
        }
        
        
        UILabel *BZlable = [[UILabel alloc]initWithFrame:CGRectMake(0,180*ScaleY+4,UIScreenWIDTH,30*ScaleY)];
        BZlable.backgroundColor = GETCOLOR(@"b0.6group");
        BZlable.textColor = GETCOLOR(@"wb");
        BZlable.textAlignment = NSTextAlignmentCenter;
        BZlable.font = [UIFont systemFontOfSize:12*ScaleY];
        BZlable.text = @"(如果食用分红余额，且分红余额大于充值金额，则下级不需要打码)";
        [self addSubview:BZlable];
        
        
        
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



- (void)Ckickbt:(UIButton *)bt
{
    bt.selected = !bt.selected;
}
- (void)Updatas:(NSArray *)array
{
    NSArray *array2 = @[@"TEST111",@"64621.631(分红余额:0)"];
    for (int i= 0; i<3; i++)
    {
        UIView *view = [self viewWithTag:100+i];
        if (i==2)
        {
        }else
        {
        UILabel *lable = [view viewWithTag:10];
            lable.text =array2[i];
        }
    }
}
@end
