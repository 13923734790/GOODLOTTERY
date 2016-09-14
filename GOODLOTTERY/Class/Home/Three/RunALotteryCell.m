//
//  RunALotteryCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RunALotteryCell.h"

@implementation RunALotteryCell
{
    UIImageView *TitleImage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
        for (int i = 0; i<2; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX+(UIScreenWIDTH-10*ScaleX)/2*i,5*ScaleY,(UIScreenWIDTH-10*ScaleX)/2,20*ScaleY)];
            lable.tag = 100+i;
            lable.textColor = GETCOLOR(@"wt1");
            lable.font = [UIFont systemFontOfSize:13*ScaleY];
            if (i==1)lable.textAlignment = NSTextAlignmentRight;else lable.textAlignment = NSTextAlignmentLeft;
            [self addSubview:lable];
        }
        for (int i = 0; i<10; i++)
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5*ScaleX+(UIScreenWIDTH-5)*ScaleX/10*i,30*ScaleY,(UIScreenWIDTH-5*ScaleX)/10,40*ScaleY)];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0,(40*ScaleY-(UIScreenWIDTH-5*ScaleX)/10)/2,(UIScreenWIDTH-5*ScaleX)/10-5*ScaleX,(UIScreenWIDTH-5*ScaleX)/10-5*ScaleX);
            [view addSubview:button];
            button.tag = 200+i;
            button.layer.cornerRadius =((UIScreenWIDTH-5*ScaleX)/10-5*ScaleX)/2;
            button.layer.masksToBounds = YES;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self addSubview:view];
        }
        TitleImage = [[UIImageView alloc]initWithFrame:CGRectMake(5*ScaleX,87*ScaleY,UIScreenWIDTH,3*ScaleY)];
        TitleImage.image =[UIImage imageNamed:[NSString stringWithFormat:@"CutLine%ld",[SkinPeelerTool ReturnSkinpManger]]];
        [self addSubview:TitleImage];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self Updatas:nil];
    return self;
}

- (void)Updatas:(NSArray *)array
{
    NSArray *array1 = @[@"广东快十",@"150914024期"];
    for (int i = 0; i<2; i++)
    {
        UILabel *lable = [self viewWithTag:100+i];
        lable.text =array1[i];
    }
    for (int i = 0; i<7; i++)
    {
        UIButton *button = [self viewWithTag:200+i];
        [button setTitle:@"1" forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"LotteryBall%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    }
}
@end
