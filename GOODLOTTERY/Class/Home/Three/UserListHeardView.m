//
//  UserListHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListHeardView.h"
#import "blackAndwhiteLable.h"

@implementation UserListHeardView
{
    UIButton *  CheckBt;
    UIImageView *CheckImage;
    UIButton *Gamebt;
    UIImageView *Gameimage;
    UIImageView *imageView1;
    UIImageView *imageView2;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self One];
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0,44*ScaleY,UIScreenWIDTH,40*ScaleY)];
        titleView.backgroundColor = [UIColor blackColor];
        NSArray *array1 = @[@"用户名",@"用户类型",@"返点级别",@"余额",@"状态",@"操作"];
        [self addSubview:titleView];
        for (int i = 0; i<6; i++)
        {
            UILabel *lable1;
            if (i==5)
            {
                lable1 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/11*i,0,UIScreenWIDTH/11,40*ScaleY)];
                
            }
            else
            {
                lable1 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/11*i,0,UIScreenWIDTH*2/11,40*ScaleY)];
            }
            lable1.textAlignment = NSTextAlignmentCenter;
            lable1.text = array1[i];
            lable1.textColor = [UIColor whiteColor];
            lable1.font = [UIFont systemFontOfSize:13*ScaleY];
            [titleView addSubview:lable1];
        }
    }
    
    [self UpdataImageAndColor];
    return self;
    
}
- (void)Clickbt:(UIButton *)bt
{
    if (_BlockNub) {
        _BlockNub(bt.tag-300);
    }
}
- (void)Click2:(UIButton *)bt
{
    
}
-(void)UpdataImageAndColor
{
    NSArray *arrayImage = [SkinPeelerTool UpdataCheckView];
    [Gamebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    [CheckBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    imageView1.image = [UIImage imageNamed:arrayImage[0]];
    imageView2.image = [UIImage imageNamed:arrayImage[0]];
    CheckImage.image = [UIImage imageNamed:arrayImage[1]];
    Gameimage.image = [UIImage imageNamed:arrayImage[3]];
}
-(void)One
{
    CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
    CheckBt.frame = CGRectMake((UIScreenWIDTH-8*ScaleX)*4/5+6*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/5, 40*ScaleY);
    CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
    [CheckBt addSubview:CheckImage];
    [self addSubview:CheckBt];
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(2*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/2,40*ScaleY)];
    [self addSubview:imageView1];
    imageView1.userInteractionEnabled = YES;
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(4*ScaleX+(UIScreenWIDTH-8*ScaleX)/2,2*ScaleY,(UIScreenWIDTH-8*ScaleX)*3/10,40*ScaleY)];
    imageView2.userInteractionEnabled = YES;
    [self addSubview:imageView2];
    
    blackAndwhiteLable *lable1= [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(5*ScaleX,0,30*ScaleX,40*ScaleY)];
    blackAndwhiteLable *lable2= [[blackAndwhiteLable alloc]initWithFrame:CGRectMake((UIScreenWIDTH-8*ScaleX)/4+15*ScaleX,0,20*ScaleX,40*ScaleY)];
    lable1.text = @"余额";lable2.text = @"至";
    [imageView1 addSubview:lable1];
    [imageView1 addSubview:lable2];
    UITextField *field1= [[UITextField alloc]initWithFrame:CGRectMake(35*ScaleX,0,((UIScreenWIDTH-8*ScaleX)/2-55*ScaleX)/2,40*ScaleY)];
    UITextField *field2= [[UITextField alloc]initWithFrame:CGRectMake(((UIScreenWIDTH-8*ScaleX)/2-55*ScaleX)/2+55*ScaleX,0,((UIScreenWIDTH-8*ScaleX)/2-55*ScaleX)/2,40*ScaleY)];
    field1.textColor = GETCOLOR(@"wb");
    field2.textColor = GETCOLOR(@"wb");
    [imageView1 addSubview:field1];
    [imageView1 addSubview:field2];
    
    
    UITextField *field3 = [[UITextField alloc]initWithFrame:CGRectMake(5*ScaleX, 0,(UIScreenWIDTH-8*ScaleX)*3/10-10*ScaleX, 40*ScaleY)];
    field3.textColor = GETCOLOR(@"wb");
    field3.placeholder = @"输入用户名";
    field3.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    [field3 setValue:GETCOLOR(@"wb") forKeyPath:@"_placeholderLabel.textColor"];
    [field3 setValue:[UIFont systemFontOfSize:15*ScaleY] forKeyPath:@"_placeholderLabel.font"];
    [imageView2 addSubview:field3];
    
}

@end
